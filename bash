"""kod çalıştırılmadan önce /etc/hostname ve 
			-- hostname.pardus.test.tr
			 /etc hosts düzenlenmesi gerekiyor
			--127.0.1.1 hostname.pardus.test.tr hostname
			--161.9.194.182 winad.pardus.test.tr pardus.test.tr"""

#!/bin/bash

sudo apt install sssd sssd-tools adcli krb5-user samba-common samba-common-bin samba-libs -yq -o Dpkg::Options::="--force-confnew"

sed -i '/**/d' /etc/krb5.conf

cat <<EOF >> /etc/krb5.conf
[libdefaults]
        default_realm = PARDUS.TEST.TR
        kdc_timesync = 1
        ccache_type = 4
        forwardable = true
        proxiable = true
        fcc-mit-ticketflags = true
        dns_lookup_realm = false
        dns_lookup_kdc = true
        dns_canonicalize_hostname = true
        rdns = false
[realms]

[domain_realm]
EOF

realm discover -v PARDUS.TEST.TR 

echo "Domaine Dahil Ediliyor"

echo -en 'passW0rd' | realm join -v -U Administrator pardus.test.tr

echo "Domaine Dahil Edildi"

sed -i '/**/d' /etc/sssd/sssd.conf
cat <<EOF >> /etc/sssd/sssd.conf

[sssd]
domains = pardus.test.tr
config_file_version = 2
services = nss, pam

[domain/pardus.test.tr]
ad_server = pardus.test.tr
krb5_realm = PARDUS.TEST.TR
realmd_tags = manages-system joined-with-adcli
cache_credentials = True
id_provider = ad
krb5_store_password_if_offline = True
default_shell = /bin/bash
ldap_id_mapping = True
use_fully_qualified_names = False
fallback_homedir = /home/%u
access_provider = ad
ad_gpo_access_control = permissive
ad_gpo_ignore_unreadable = True
auth_provider = ad
chpass_provider = ad
dyndns_update = True
dyndns_update_ptr = False
ad_hostname = $host.pardus.test.tr
ldap_schema = ad
ldap_sasl_mech = gssapi
ldap_krb5_init_creds = True

EOF

chmod 600 /etc/sssd/sssd.conf

echo 'LC_ALL="tr_CY.UTF-8"' >> /etc/default/sssd
echo 'session required pam_mkhomedir.so skel=/etc/skel umask=0077' >> /etc/pam.d/common-session

systemctl restart sssd
systemctl status sssd
