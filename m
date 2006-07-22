From: James Marcinek <jmarc1@jemconsult.biz>
Subject: Re: Help with IPtables and NAT
Date: Sat, 22 Jul 2006 10:38:10 -0400
Message-ID: <44C23852.3060802@jemconsult.biz>
References: <44C16109.20704@jemconsult.biz>
	<44C1E06F.1080803@free-4ever.net>	<44C1FE22.70209@plouf.fr.eu.org>
	<44C2096D.2050602@free-4ever.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C2096D.2050602@free-4ever.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org, doug <doug@mimicit.com>

Thanks for responding everyone. I am hopefully very close to=20
implementing these rules. Here is my proposed set of rules. I have a=20
couple of concerns but please feel free to leave input:

# First drop everything (lets you open what you want)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
=20
# PREROUTING chain rules
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 443 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 21 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 22 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 25 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 953 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 993 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT=20
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT=20
--to-dest 192.168.0.2
=20
# User-defined chain for ACCEPTed TCP packets
iptables -N okay
iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP
=20
# INPUT chain rules
iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.2 -j ACCEPT
iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
=20
# Rules for incoming packets from the Internet
=20
# Packets for established connections
iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
=20
# NOT SURE IF I NEED THIS AS IT'S AN INPUT???
# iptables -A INPUT -p ALL -d 172.10.10.2 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
=20
# TCP rules
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
=20
# UDP rules
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j ACCEPT
=20
# ICMP rules
=20
# FORWARD chain rules
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
=20
# - FORWARDS to server
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 953-j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 993 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.0.2 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -i etho -d 192.168.0.2 -p udp --dport 953-j ACCEPT
=20
# iptables -A FORWARD -i eth0 -d 192.168.0.2 -j ACCEPT
=20
# OUTPUT chain rules
iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
=20
# NOT SURE IF THIS IS CORRECT OR NEEDED???
 iptables -A OUTPUT -p ALL -s 172.10.10.2 -j ACCEPT
=20
# POSTROUTING
iptables -t nat -A POSTROUTING -s 192.168.0.2 -j SNAT --to-source=20
172.10.10.2
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1

Guillaume wrote:
> Pascal Hambourg a =E9crit :
>> Guillaume a =E9crit :
>>>
>>> I think you 2 problems in your rules:
>>>  - The chains in NAT table must not be set to drop. NO filtering in=20
>>> nat table.
>>>  - You forgot to add the rules to autorise traffic coming from=20
>>> eth0:0 to your internal host. After a DNAT rule, you need to=20
>>> explicitely autorise the corresponding traffic.
>>> Ab i think, I've don't read any rule related to that.
>>>
>>> For example, you set this rule:
>>> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j=20
>>> DNAT --to-dest 192.168.0.2
>>> You must set this rule:
>>> iptables -t filter -A FORWARD -i eth0:0 -p tcp -d 192.168.0.2=20
>>> --dport 80 -j ACCEPT
>>> And the same for all incoming traffics.
>>
>> This is correct except for one detail : the interface eth0:0 does not=20
>> exist. It is only an alias and is not used by either the routing nor=20
>> iptables. You muse use the real interface name, eth0.
>>
>
> hhhmmm
> Ok :-)
>
> I never use alias on interface... :-)
>
> Thx for correcting me
>
> Guillaume
>
>


