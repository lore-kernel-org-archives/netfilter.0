From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time yet?
Date: Wed, 8 Jul 2020 12:48:36 +0200
Message-ID: <09384244-dcac-57f5-5ccd-93648f615faf@thelounge.net>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
 <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
 <a140ef1f-b238-3c8b-d8ec-3e266a893aea@thelounge.net>
 <874kqih2ca.fsf@goll.lan>
 <44067eef-0cfe-ac29-f3e6-463c20d8e38d@thelounge.net>
 <20200708103656.GA22743@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200708103656.GA22743@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "Trent W. Buck" <trentbuck@gmail.com>, netfilter@vger.kernel.org



Am 08.07.20 um 12:36 schrieb Pablo Neira Ayuso:
> On Wed, Jul 08, 2020 at 12:16:18PM +0200, Reindl Harald wrote:
>>
>>
>> Am 08.07.20 um 09:51 schrieb Trent W. Buck:
>>> Reindl Harald <h.reindl@thelounge.net> writes:
>>>
>>>> Am 03.07.20 um 09:04 schrieb G.W. Haywood:
>>>>> On Fri, 3 Jul 2020, Timo Sigurdsson wrote:
>>>>>
>>>>>> ... I use ipsets for blacklisting.
>>>>>>     I fetch blacklists from various sources
>>>>>> ... This approach has worked for me for quite some time.
>>>>>> ... some of my blacklists may contain the same addresses or ranges,
>>>>>>     I use ipsets' -exist switch when loading
>>>>>> ... I don't think that the use case is that extraordinary ...
>>>>>
>>>>> +6
>>>>>
>>>>> FWIW I'll be following this thread very closely.
>>>>
>>>> it turned out at least with recent kernel and recent userland
>>>> "iptables-nft" can fully replace "iptables" and continue to use "ipset"
>>>> unchanged
>>>
>>> I tested this and you're right - it is working.  This surprised me!
>>>
>>> I saw these "commented out" rules in iptables-translate, where
>>> I (wrongly) assumed that meant the rule was completely inactive.
>>
>> "iptables-translate" comments out much more than just upset related
>> stuff, in my case xt_recent and connlimit rules are also just comments
> 
> If you could post what kind of rule examples are commented out, it
> would help us keep this in the radar.
> 
> It is not too hard to add new translations, there is a _xlate()
> function under iptables/extensions/libxt_*.c that provides the
> translation. The important thing is to validate that the translation
> is semantically equivalent, or if not possible, provide a close
> translation.

[root@firewall:~]$ iptables-restore-translate
--file=/etc/sysconfig/iptables | grep "^#"
# Translated by iptables-restore-translate v1.8.3 on Wed Jul  8 12:47:31
2020
# -t nat -A PREROUTING -d 172.17.0.0/24 -i wan -p icmp -m set
--match-set EXCLUDES_IPV4 src -m icmp --icmp-type 8 -j DNAT
--to-destination 172.16.0.1
# -t nat -A PREROUTING -d 172.17.0.0/24 -j NETMAP --to 172.16.0.0/24
# -t nat -A POSTROUTING -s 172.16.0.0/24 -o wan -j NETMAP --to
172.17.0.0/24
# -t nat -A POSTROUTING -o lan -m iprange --src-range
172.16.0.2-172.16.0.254 -m iprange --dst-range 172.16.0.2-172.16.0.254
-j NETMAP --to 172.17.0.0/24
# -t mangle -A PREROUTING -i wan -m set  --match-set EXCLUDES_IPV4 src
-j INBOUND
# -t mangle -A LD_SCAN -j SET --add-set BLOCKED_DYNAMIC_PORTSCAN_IPV4
src --exist
# -t mangle -A IN_DNS -m connlimit --connlimit-above 50 --connlimit-mask
32 --connlimit-saddr -j LD_C_ALL
# -t mangle -A IN_DNS -m recent --update --seconds 2 --reap --hitcount
60 --name dns --mask 255.255.255.255 --rsource -j LD_R_ALL
# -t mangle -A IN_DNS -m recent --set --name dns --mask 255.255.255.255
--rsource
# -t mangle -A IN_FTP -m recent --update --seconds 2 --reap --hitcount
20 --name ftp --mask 255.255.255.255 --rsource -j LD_R_ALL
# -t mangle -A IN_FTP -m recent --set --name ftp --mask 255.255.255.255
--rsource
# -t mangle -A IN_SSH -m recent --update --seconds 60 --reap --hitcount
15 --name ssh --mask 255.255.255.255 --rsource -j LD_R_ALL
# -t mangle -A IN_SSH -m recent --set --name ssh --mask 255.255.255.255
--rsource
# -t mangle -A IN_TCP -p tcp -m tcpmss --mss 1:500 -j DROP
# -t mangle -A IN_TCP -m set --match-set BLOCKED_DYNAMIC_MAIL_IPV4 src
-m set --match-set PORTS_MAIL dst -j DROP
# -t mangle -A IPST_ALL -j SET --add-set BLOCKED_DYNAMIC_IPV4 src --exist
# -t mangle -A INBOUND -m set --match-set PORTSCAN_PORTS dst -m set
--match-set HONEYPOT_IPS_IPV4 dst -j LD_SCAN
# -t mangle -A INBOUND -m recent --rcheck --seconds 2 --hitcount 200
--name all --mask 255.255.255.255 --rsource -j IPST_ALL
# -t mangle -A INBOUND -m recent --update --seconds 2 --hitcount 150
--name all --mask 255.255.255.255 --rsource -j LD_R_ALL
# -t mangle -A INBOUND -m recent --set --name all --mask 255.255.255.255
--rsource
# -t mangle -A INBOUND -m connlimit --connlimit-above 250
--connlimit-mask 24 --connlimit-saddr -j LD_C_ALL
# -t mangle -A INBOUND -m connlimit --connlimit-above 120
--connlimit-mask 32 --connlimit-saddr -j LD_C_ALL
# -t mangle -A INBOUND -m connlimit --connlimit-above 500
--connlimit-mask 16 --connlimit-saddr -j LD_C_ALL
# -t mangle -A INBOUND -m set --match-set DNS_PORTS dst -j IN_DNS
# -t raw -A IN_TCP -p tcp -m tcp --dport 21 -j CT --helper ftp
# -t raw -A INBOUND -m set --match-set BLOCKED_MERGED_IPV4 src -j DROP
# -t raw -A INBOUND -m set --match-set BLOCKED_DYNAMIC_PORTSCAN_IPV4 src
-j DROP
# -t filter -A INPUT -p tcp -m tcp --dport 10022 -m set --match-set
ADMIN_CLIENTS_IPV4 src -j ACCEPT
# -t filter -A INPUT -p tcp -m tcp --dport 5201 -m set --match-set
IPERF_IPV4 src -j ACCEPT
# -t filter -A INPUT -p icmp -m icmp --icmp-type 3/4 -m limit --limit
50/sec -j ACCEPT
# -t filter -A FORWARD -p icmp -m icmp --icmp-type 3/4 -m limit --limit
50/sec -j ACCEPT
# -t filter -A LD_SCAN -m set --match-set EXCLUDES_IPV4 src -j DROP
# -t filter -A LD_SCAN -j SET --add-set BLOCKED_DYNAMIC_PORTSCAN_IPV4
src --exist
# -t filter -A RESTRICT -s 172.16.0.253/32  -p icmp -m time --timestart
00:00:00 --timestop 05:30:00 --datestop 2038-01-19T03:14:07 -j DROP
# -t filter -A RESTRICT -p icmp -m icmp --icmp-type 3/4 -m limit --limit
50/sec -j ACCEPT
# -t filter -A RESTRICT -m set  --match-set PORTS_RESTRICTED dst -j LD_RST
# -t filter -A HONEYPOT -m connlimit --connlimit-upto 5 --connlimit-mask
24 --connlimit-saddr -m limit --limit 5/sec -m set --match-set
HONEYPOT_PORTS dst -j ACCEPT
# -t filter -A OUTBOUND -m set --match-set RESTRICTED_IPV4 src -j RESTRICT
# -t filter -A OUTBOUND -m set --match-set OUTBOUND_BLOCKED_PORTS dst -j
LD_OUT
# -t filter -A OUTBOUND -m set --match-set OUTBOUND_BLOCKED_SRC_IPV4 src
-j LD_OUT
# -t filter -A INTERNAL -m set --match-set RESTRICTED_IPV4 src -j RESTRICT
# -t filter -A INTERNAL -d 172.16.0.253/32 -m set --match-set
ADMIN_CLIENTS_IPV4 src -j ACCEPT
# -t filter -A IPST_MAIL -j SET --add-set BLOCKED_DYNAMIC_MAIL_IPV4 src
--exist
# -t filter -A LD_R_MAIL -m recent --rcheck --seconds 600 --reap
--hitcount 150 --name mail_ipset --mask 255.255.255.255 --rsource -j
IPST_MAIL
# -t filter -A LD_R_MAIL -m recent --set --name mail_ipset --mask
255.255.255.255 --rsource
# -t filter -A LD_R_MX -m recent --rcheck --seconds 60 --hitcount 50
--name mail_ipset --mask 255.255.255.255 --rsource -j IPST_MAIL
# -t filter -A LD_R_MX -m recent --set --name mail_ipset --mask
255.255.255.255 --rsource
# -t filter -A VPN -i lan -o vpn -m set --match-set
LAN_VPN_FORWARDING_IPV4 src -j ACCEPT
# -t filter -A VPN_IN -m set  --match-set INFRASTRUCTURE_IPV4 dst -j ACCEPT
# -t filter -A VPN_IN -m set --match-set ADMIN_CLIENTS_IPV4 src -j ACCEPT
# -t filter -A RL_MAIL -m connlimit --connlimit-above 75
--connlimit-mask 32 --connlimit-saddr -j LD_C_MAIL
# -t filter -A RL_MAIL -p tcp -m multiport --dports 25,465,587 -m recent
--update --seconds 300 --hitcount 80 --name mail_mta --mask
255.255.255.255 --rsource -j LD_R_MAIL
# -t filter -A RL_MAIL -p tcp -m multiport --dports 25,465,587 -m recent
--update --seconds 1800 --reap --hitcount 100 --name mail_mta --mask
255.255.255.255 --rsource -j LD_R_MAIL
# -t filter -A RL_MAIL -p tcp -m multiport --dports 25,465,587 -m recent
--set --name mail_mta --mask 255.255.255.255 --rsource
# -t filter -A RL_MAIL -p tcp -m multiport --dports 110,143,993,995 -m
recent --update --seconds 300 --hitcount 150 --name mail_mua --mask
255.255.255.255 --rsource -j LD_R_MAIL
# -t filter -A RL_MAIL -p tcp -m multiport --dports 110,143,993,995 -m
recent --update --seconds 1200 --reap --hitcount 250 --name mail_mua
--mask 255.255.255.255 --rsource -j LD_R_MAIL
# -t filter -A RL_MAIL -p tcp -m multiport --dports 110,143,993,995 -m
recent --set --name mail_mua --mask 255.255.255.255 --rsource
# -t filter -A RL_MX -m connlimit --connlimit-above 10 --connlimit-mask
32 --connlimit-saddr -j LD_C_MX
# -t filter -A RL_MX -m recent --update --seconds 2 --hitcount 5 --name
mail_mx --mask 255.255.255.255 --rsource -j LD_R_MX
# -t filter -A RL_MX -m recent --update --seconds 1800 --reap --hitcount
80 --name mail_mx --mask 255.255.255.255 --rsource -j LD_R_MX
# -t filter -A RL_MX -m recent --set --name mail_mx --mask
255.255.255.255 --rsource
# -t filter -A HST_05 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_05_RL
# -t filter -A HST_05_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_05_RL -m recent --update --seconds 2 --reap
--hitcount 100 --name proxy --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_05_RL -m recent --set --name proxy --mask
255.255.255.255 --rsource
# -t filter -A HST_11 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_11_RL
# -t filter -A HST_11_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_11_RL -m recent --update --seconds 2 --reap
--hitcount 100 --name arrakis --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_11_RL -m recent --set --name arrakis --mask
255.255.255.255 --rsource
# -t filter -A HST_04 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_04_RL
# -t filter -A HST_04_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_04_RL -m recent --update --seconds 2 --reap
--hitcount 100 --name proxy --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_04_RL -m recent --set --name proxy --mask
255.255.255.255 --rsource
# -t filter -A HST_06 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_06_RL
# -t filter -A HST_06_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_06_RL -m recent --update --seconds 2 --reap
--hitcount 100 --name arrakis --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_06_RL -m recent --set --name arrakis --mask
255.255.255.255 --rsource
# -t filter -A HST_15 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_15_RL
# -t filter -A HST_15 -p tcp -m tcp --dport 588 -m set --match-set
EXCLUDES_IPV4 src -j ACCEPT
# -t filter -A HST_15_RL -m set --match-set PORTS_MAIL dst -j RL_MAIL
# -t filter -A HST_17 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_17_RL
# -t filter -A HST_17_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_17_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name caladan --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_17_RL -m recent --set --name caladan --mask
255.255.255.255 --rsource
# -t filter -A HST_17_RL -m set --match-set PORTS_MAIL dst -j RL_MAIL
# -t filter -A HST_19 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_19_RL
# -t filter -A HST_19 -p tcp -m tcp --dport 443 -m set --match-set
BAYES_SYNC_IPV4 src -j ACCEPT
# -t filter -A HST_21 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_21_RL
# -t filter -A HST_20 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_20_RL
# -t filter -A HST_30 -p tcp -m multiport --dports 5222,5269 -m set
--match-set JABBER_IPV4 src -j ACCEPT
# -t filter -A HST_30 -p tcp -m tcp --dport 873 -m set --match-set
RBL_SYNC_IPV4 src -j ACCEPT
# -t filter -A HST_30 -p tcp -m multiport --dports 5201,12865 -m set
--match-set IPERF_IPV4 src -j ACCEPT
# -t filter -A HST_10 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_10_RL
# -t filter -A HST_10_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_10_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name arrakis --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_10_RL -m recent --set --name arrakis --mask
255.255.255.255 --rsource
# -t filter -A HST_08 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_08_RL
# -t filter -A HST_08_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_08_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name arrakis --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_08_RL -m recent --set --name arrakis --mask
255.255.255.255 --rsource
# -t filter -A HST_09 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_09_RL
# -t filter -A HST_09_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_09_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name arrakis --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_09_RL -m recent --set --name arrakis --mask
255.255.255.255 --rsource
# -t filter -A HST_35 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_35_RL
# -t filter -A HST_35_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_35_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name thebe --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_35_RL -m recent --set --name thebe --mask
255.255.255.255 --rsource
# -t filter -A HST_34 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_34_RL
# -t filter -A HST_34_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_34_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name thebe --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_34_RL -m recent --set --name thebe --mask
255.255.255.255 --rsource
# -t filter -A HST_38 -i wan -m set  --match-set EXCLUDES_IPV4 src -j
HST_38_RL
# -t filter -A HST_38_RL -m connlimit --connlimit-above 50
--connlimit-mask 32 --connlimit-saddr -j LD_C_HST
# -t filter -A HST_38_RL -m recent --update --seconds 2 --reap
--hitcount 50 --name thebe --mask 255.255.255.255 --rsource -j LD_R_HST
# -t filter -A HST_38_RL -m recent --set --name thebe --mask
255.255.255.255 --rsource
# -t filter -A HST_03 -p tcp -m tcp --dport 22 -m set --match-set
SFTP_22_IPV4 src -j ACCEPT
# Completed on Wed Jul  8 10:47:31 2020
[root@firewall:~]$
