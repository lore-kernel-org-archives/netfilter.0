From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Subject: nftables with secmark and ipsec
Date: Tue, 31 Dec 2019 12:30:29 +0100
Message-ID: <CAJ2a_DeoZum5_pdZPW=vyT+8ap9u77_ojYjhfstMEojgrMui8w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Dnz9h5D8/WhxJ554I7FZaNMRrMSwBjPBB72tKBQoH0U=;
        b=W7rdzm8O6/Ur5CZHND/H4s4WauPWkrQt+e5Qev7Dm6Jq43EzQpT3tfu5zLsjoO0F9L
         te3j3asgkFSpSGsf2E9NGpgKNDxpzRcERjwVsShT2hGYi6odFQtHgrQCZPq9KqpWsHEk
         /HEHiW+aOPRUqLwxYR49MirpWDdEH08NfOknJoySGeN3MpvmjweLqjcwqaAvB75+t45M
         ZHjiTxZ1f9SxlgOjwTPbSbmSUu0JHMWWLSGhG/JDx1+EMLLUY2vgyODfAIS+57bKfAYv
         PkPYhS1Cz7HwbiPb4i9oj9zquQB7kiblUqFj4T0bz32lDwVoG3xUhlZioIwWKnXFGvAx
         bqiw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi list,

I am further trying secmark labeling.
Currently I am held up by a issue with ipsec.

The host runs multiple services:
  - ipsec : strongswan
  - webserver : apache2
  - imap-server : dovecot

I use Debian sid:
  - kernel: Linux server 5.4.0-1-amd64 #1 SMP Debian 5.4.6-1
(2019-12-27) x86_64 GNU/Linux
  - nftables: nftables v0.9.3 (Topsy)

My current nftables configuration is appended and one can find it at [1].

When connecting to the vpn, I am getting a lot of the following
SELinux checks, which I allowed for now:

type=3DAVC msg=3Daudit(12/31/19 11:50:19.581:7033) : avc:  granted  {
forward_in } for  pid=3D0 comm=3Dswapper/0 saddr=3Dvirtualvpn_ip src=3D3317=
9
daddr=3Dsome_ip dest=3D5228 netif=3Deth0
scontext=3Dsystem_u:object_r:unlabeled_t:s0
tcontext=3Dsystem_u:object_r:ipsecnat_server_packet_t:s0 tclass=3Dpacket

type=3DAVC msg=3Daudit(12/31/19 11:50:19.581:7034) : avc:  granted  {
forward_out } for  pid=3D0 comm=3Dswapper/0 saddr=3Dhost_ip src=3D7161
daddr=3Dsome_ip dest=3D5228 netif=3Deth0
scontext=3Dsystem_u:object_r:unlabeled_t:s0
tcontext=3Dsystem_u:object_r:ipsecnat_server_packet_t:s0 tclass=3Dpacket


When I try to access a service (http or imaps) through the vpn and the
service is on the same host, I am having troubles to set the correct
packet label:

# nft debug output rule: ct state established udp sport 4500 log flags
all prefix "nft_est "
Dec 31 11:54:50 server kernel: nft_est IN=3D OUT=3Deth0 SRC=3Dhost_ip
DST=3Dvpnclient_ip LEN=3D1476 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PRO=
TO=3DUDP
SPT=3D4500 DPT=3D56602 LEN=3D1456
Dec 31 11:54:51 server kernel: nft_est IN=3D OUT=3Deth0 SRC=3Dhost_ip
DST=3Dvpnclient_ip LEN=3D1476 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PRO=
TO=3DUDP
SPT=3D4500 DPT=3D56602 LEN=3D1456
Dec 31 11:54:52 server audit[0]: AVC avc:  denied  { send } for  pid=3D0
comm=3D"swapper/0" saddr=3Dhost_ip src=3D4500 daddr=3Dvpnclient_ip dest=3D5=
6602
netif=3Deth0 scontext=3Dsystem_u:system_r:dovecot_t:s0
tcontext=3Dsystem_u:object_r:ipsecnat_server_packet_t:s0 tclass=3Dpacket
permissive=3D0
Dec 31 11:54:54 server audit[9]: AVC avc:  denied  { send } for  pid=3D9
comm=3D"ksoftirqd/0" saddr=3Dhost_ip src=3D4500 daddr=3Dvpnclient_ip
dest=3D56602 netif=3Deth0 scontext=3Dsystem_u:system_r:dovecot_t:s0
tcontext=3Dsystem_u:object_r:ipsecnat_server_packet_t:s0 tclass=3Dpacket
permissive=3D0


Dovecot (reproducible with apache2) tries so send a ipsecnat-server
(ipsecnat_server_packet_t) packet, while it should only send
imaps-server (pop_server_packet_t).
However the initial recv packet for dovecot seems to be labeled correctly.
The source port of these packets is 4500, so I can't match on the source po=
rt.
They are established packets, so the output rule `ct state
established,related meta secmark set ct secmark` is setting the label.


How do I setup an output rule to label these packet as pop_server_packet_t?
(Or is this a kernel issue and the source process context should not
be dovecot_t but rather ipsec_t?)

King regards,
      Christian G=C3=B6ttsche


[1]: https://salsa.debian.org/cgzones-guest/misc-config/blob/master/nftable=
s/nftables.conf

#!/usr/sbin/nft -f

flush ruleset

# commands
#  - list rules:     nft list ruleset
#  - block ip:       nft add element inet filter blacklist4 { IP }
#                    nft add element inet filter blacklist4 { IP timeout 60=
s }
#  - list blacklist: nft list set inet filter blacklist4

define interface_inet =3D eth0
define port_ssh =3D 22
define port_ssh_alias =3D 5222
define port_quassel =3D 4242
define port_monit =3D 2812
define addrv4_vpngateway =3D 172.31.2.1
define addrv4_vpnnet =3D 172.31.2.0/24
#define addrv6_vpngateway =3D REPLACEME
#define addrv6_vpnnet =3D REPLACEME

table inet filter {

set tcp_accepted {
type inet_service;
elements =3D {
$port_ssh,
$port_monit,
$port_quassel,
smtp, submission, imaps, sieve,
http, https
}
}

set udp_accepted {
type inet_service;
elements =3D {
isakmp, ipsec-nat-t
}
}

set blacklist4 { type ipv4_addr; flags timeout; }
set blacklist6 { type ipv6_addr; flags timeout; }

chain blacklist_sink {
counter drop comment "blacklist"
}

chain base_checks {
ip  saddr @blacklist4 counter goto blacklist_sink
ip6 saddr @blacklist6 counter goto blacklist_sink

ct state invalid counter drop comment "invalid state"
ct state { established, related } counter accept comment "established - rel=
ated"

iif lo counter accept comment "loopback"
iif !=3D lo ip  daddr 127.0.0.1/8 counter limit rate 1/second log flags
all prefix "nft_lo4 " drop
iif !=3D lo ip6 daddr ::1/128     counter limit rate 1/second log flags
all prefix "nft_lo6 " drop
}

chain tcp_checks_sink {
counter drop comment "tcp flags check sink"
}

chain tcp_checks {
tcp flags & (syn) !=3D (syn) ct state new
counter goto tcp_checks_sink

tcp flags & (fin|syn)                 =3D=3D (fin|syn)
counter goto tcp_checks_sink
tcp flags & (syn|rst)                 =3D=3D (syn|rst)
counter goto tcp_checks_sink
tcp flags & (syn|urg)                 =3D=3D (syn|urg)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D 0
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (fin|psh|urg)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (fin|syn|rst|psh|ack|urg)
counter goto tcp_checks_sink
tcp flags & (fin|rst)                 =3D=3D (fin|rst)
counter goto tcp_checks_sink
tcp flags & (fin|ack)                 =3D=3D (fin)
counter goto tcp_checks_sink
tcp flags & (ack|psh)                 =3D=3D (psh)
counter goto tcp_checks_sink
tcp flags & (ack|urg)                 =3D=3D (urg)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (syn|fin|psh|urg)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (syn|rst|fin|psh|urg)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (fin|syn|rst|ack)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (syn|psh)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (syn|psh|ack)
counter goto tcp_checks_sink
tcp flags & (fin|psh|urg)             =3D=3D (fin|psh|urg)
counter goto tcp_checks_sink
tcp flags & (fin|syn|rst|psh|ack|urg) =3D=3D (fin)
counter goto tcp_checks_sink
}

set tcp_spam4 { type ipv4_addr; flags dynamic; }
set tcp_spam6 { type ipv6_addr; flags dynamic; }
set ssh_spam4 { type ipv4_addr; flags dynamic; }
set ssh_spam6 { type ipv6_addr; flags dynamic; }

chain tcp_input {
jump tcp_checks

tcp dport { $port_ssh, $port_ssh_alias } add @ssh_spam4 { ip  saddr
limit rate over 3/second } log prefix "nft_sshspam4 " set add ip
saddr timeout 60s @blacklist4 drop
tcp dport { $port_ssh, $port_ssh_alias } add @ssh_spam6 { ip6 saddr
limit rate over 3/second } log prefix "nft_sshspam6 " set add ip6
saddr timeout 60s @blacklist6 drop

tcp dport @tcp_accepted tcp sport 1024-65535 accept

add @tcp_spam4 { ip  saddr limit rate over 3/second } log prefix
"nft_tcpspam4 " set add ip  saddr timeout 60s @blacklist4 drop
add @tcp_spam6 { ip6 saddr limit rate over 3/second } log prefix
"nft_tcpspam6 " set add ip6 saddr timeout 60s @blacklist6 drop

counter limit rate 50/second reject with icmpx type port-unreachable
comment "tcp closed port reject"
counter limit rate 1/second log flags all prefix "nft_tcpchainend " drop
}

set udp_spam4 { type ipv4_addr; flags dynamic; }
set udp_spam6 { type ipv6_addr; flags dynamic; }

chain udp_input {
udp dport @udp_accepted udp sport 1024-65535 accept

add @udp_spam4 { ip  saddr limit rate over 3/second } log prefix
"nft_udpspam4 " set add ip  saddr timeout 60s @blacklist4 drop
add @udp_spam6 { ip6 saddr limit rate over 3/second } log prefix
"nft_udpspam6 " set add ip6 saddr timeout 60s @blacklist6 drop

counter limit rate 500/second reject with icmpx type port-unreachable
comment "udp closed port reject"
counter limit rate 1/second log flags all prefix "nft_udpchainend " drop
}

chain icmpv4_input {
ip protocol icmp icmp type { echo-request, echo-reply, time-exceeded,
parameter-problem, destination-unreachable } counter limit rate
100/second accept comment "icmpv4 accept"

ip protocol icmp icmp type { timestamp-request } drop

counter limit rate 1/second log flags all prefix "nft_icmp4chainend " drop
}

chain icmpv6_input {
ip6 nexthdr icmpv6 icmpv6 type { echo-request, echo-reply,
time-exceeded, parameter-problem, destination-unreachable,
packet-too-big, nd-router-solicit, mld-listener-query } counter limit
rate 100/second accept comment "icmpv6 accept"
ip6 nexthdr icmpv6 icmpv6 type { nd-neighbor-advert,
nd-neighbor-solicit, nd-router-advert } ip6 hoplimit 1 limit rate
100/second accept
ip6 nexthdr icmpv6 icmpv6 type { nd-neighbor-advert,
nd-neighbor-solicit, nd-router-advert } ip6 hoplimit 255 limit rate
100/second accept

counter limit rate 1/second log flags all prefix "nft_icmpv6chainend " drop
}

chain output {
type filter hook output priority 0; policy accept;
}

chain forward {
type filter hook forward priority 0; policy drop;

counter ip saddr $addrv4_vpnnet oif $interface_inet accept comment
"forward ipv4 for net"
#ip6 saddr $addrv6_vpnnet oif $interface_inet accept
counter ip daddr $addrv4_vpngateway oif $interface_inet accept comment
"forward ipv4 to gateway"
#ip6 daddr $addrv6_vpngateway oif $interface_inet accept

ip6 nexthdr icmpv6 icmpv6 type { echo-request } counter limit rate
100/second accept comment "forward icmpv6 accept"

counter limit rate 1/second log flags all prefix "nft_fwdchainend " reject
}

chain input {
type filter hook input priority 0; policy drop;

counter comment "input"

jump base_checks

ip protocol vmap { tcp : goto tcp_input, udp : goto udp_input, icmp
: goto icmpv4_input }
ip6 nexthdr vmap { tcp : goto tcp_input, udp : goto udp_input, icmpv6
: goto icmpv6_input }

ip protocol 4 counter drop comment "drop encapsulated ipv4"
ip protocol 41 counter drop comment "drop encapsulated ipv6"

counter limit rate 1/second log flags all prefix "nft_inputendchain " drop
}
}

table ip nat {
chain prerouting {
type nat hook prerouting priority 0; policy accept;

tcp dport $port_ssh_alias redirect to $port_ssh comment "ipv4 ssh port
redirection for public networks"
}

chain postrouting {
type nat hook postrouting priority 0; policy accept;

ip saddr $addrv4_vpnnet oif $interface_inet counter masquerade
fully-random comment "masquerade ipv4"
}
}

table ip6 nat6 {
chain prerouting {
type nat hook prerouting priority 0; policy accept;

tcp dport $port_ssh_alias redirect to $port_ssh comment "ipv6 ssh port
redirection for public networks"
}

chain postrouting {
type nat hook postrouting priority 0; policy accept;

#ip saddr $addrv6_vpnnet oif $interface_inet counter masquerade
fully-random comment "masquerade ipv6"
}
}

table inet mysecmark {

secmark ssh_server {
"system_u:object_r:ssh_server_packet_t:s0"
}

secmark dns_client {
"system_u:object_r:dns_client_packet_t:s0"
}

secmark http_client {
"system_u:object_r:http_client_packet_t:s0"
}

secmark https_client {
"system_u:object_r:http_client_packet_t:s0"
}

secmark ntp_client {
"system_u:object_r:ntp_client_packet_t:s0"
}

secmark icmp_client {
"system_u:object_r:icmp_client_packet_t:s0"
}

secmark icmp_server {
"system_u:object_r:icmp_server_packet_t:s0"
}

secmark ssh_client {
"system_u:object_r:ssh_client_packet_t:s0"
}

secmark git_client {
"system_u:object_r:git_client_packet_t:s0"
}

secmark quassel_server {
"system_u:object_r:quassel_server_packet_t:s0"
}

secmark http_server {
"system_u:object_r:http_server_packet_t:s0"
}

secmark ircd_client {
"system_u:object_r:ircd_client_packet_t:s0"
}

secmark pop_client {
"system_u:object_r:pop_client_packet_t:s0"
}

secmark mysql_client {
"system_u:object_r:mysqld_client_packet_t:s0"
}

secmark mysql_server {
"system_u:object_r:mysqld_server_packet_t:s0"
}

secmark isakmp_server {
"system_u:object_r:isakmp_server_packet_t:s0"
}

secmark isakmp_client {
"system_u:object_r:isakmp_client_packet_t:s0"
}

secmark ipsecnat_server {
"system_u:object_r:ipsecnat_server_packet_t:s0"
}

secmark ipsecnat_client {
"system_u:object_r:ipsecnat_client_packet_t:s0"
}

secmark pop_server {
"system_u:object_r:pop_server_packet_t:s0"
}

secmark sieve_server {
"system_u:object_r:sieve_server_packet_t:s0"
}

secmark smtp_server {
"system_u:object_r:smtp_server_packet_t:s0"
}

secmark smtp_client {
"system_u:object_r:smtp_client_packet_t:s0"
}

secmark monit_server {
"system_u:object_r:monit_server_packet_t:s0"
}

secmark monit_client {
"system_u:object_r:monit_client_packet_t:s0"
}

secmark spamd_server {
"system_u:object_r:spamd_server_packet_t:s0"
}

secmark spamd_client {
"system_u:object_r:spamd_client_packet_t:s0"
}

map secmapping_in {
type inet_service : secmark
elements =3D {
$port_ssh : "ssh_server",
$port_quassel : "quassel_server",
http : "http_server",
https : "http_server",
mysql : "mysql_server",
isakmp : "isakmp_server",
ipsec-nat-t : "ipsecnat_server",
imaps : "pop_server",
sieve : "sieve_server",
smtp : "smtp_server",
submission : "smtp_server",
$port_monit : "monit_server",
spamd : "spamd_server",
}
}

map secmapping_out {
type inet_service : secmark
elements =3D {
ssh : "ssh_client",
domain : "dns_client",
http : "http_client",
ntp : "ntp_client",
https : "http_client",
git : "git_client",
6665 : "ircd_client",
ircd : "ircd_client",
imaps : "pop_client",
mysql : "mysql_client",
smtp : "smtp_client",
isakmp : "isakmp_client",
ipsec-nat-t : "ipsecnat_client",
submission : "smtp_client",
smtp : "smtp_client",
$port_monit : "monit_client",
spamd : "spamd_client",
}
}

chain input {
type filter hook input priority -225;

# get label for est/rel packets from connection
ct state established,related meta secmark set ct secmark

# label new incoming packets
ct state new meta secmark set tcp dport map @secmapping_in
ct state new meta secmark set udp dport map @secmapping_in
ct state new ip protocol icmp meta secmark set "icmp_server"
ct state new ip6 nexthdr icmpv6 meta secmark set "icmp_server"

# fix loopback labels
iif lo meta secmark set tcp dport map @secmapping_in
iif lo meta secmark set udp dport map @secmapping_in
iif lo meta secmark set tcp sport map @secmapping_out
iif lo meta secmark set udp sport map @secmapping_out
iif lo ip protocol icmp meta secmark set "icmp_client"
iif lo ip6 nexthdr icmpv6 meta secmark set "icmp_client"

# save label onto connection
ct state new ct secmark set meta secmark
#iif lo       ct secmark set meta secmark
}

chain output {
type filter hook output priority 255;

# get label for est/rel packets from connection
ct state established,related meta secmark set ct secmark

# label new outgoing packets
ct state new meta secmark set tcp dport map @secmapping_out
ct state new meta secmark set udp dport map @secmapping_out
ct state new ip protocol icmp meta secmark set "icmp_client"
ct state new ip6 nexthdr icmpv6 meta secmark set "icmp_client"

# fix loopback labels
oif lo meta secmark set tcp dport map @secmapping_out
oif lo meta secmark set udp dport map @secmapping_out
oif lo meta secmark set tcp sport map @secmapping_in
oif lo meta secmark set udp sport map @secmapping_in
oif lo ip protocol icmp meta secmark set "icmp_client"
oif lo ip6 nexthdr icmpv6 meta secmark set "icmp_client"

# save label onto connection
ct state new ct secmark set meta secmark
#oif lo       ct secmark set meta secmark
}

}
