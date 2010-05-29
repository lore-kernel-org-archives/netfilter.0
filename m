From: John Lauro <johnalauro@gmail.com>
Subject: Fwd: Squid + Tproxy + Bridge on Kernel 2.6.34 - Workaround
Date: Sat, 29 May 2010 10:43:57 -0400
Message-ID: <AANLkTind3vU51kFAzKCWZa0aLzKLgX-9NXfV4M_2971W@mail.gmail.com>
References: <AANLkTinxuSAEQdBC-CV3Yq3C5tAqT-HgS16Yidu_D5Qo@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5/K9HAIKGKCIuQ3QGBwQYG22H0RxLnw/gM/IqLFMX/E=;
        b=kLlPZYkgfvmMo/hVqPXecxoA77tTiP6p/zAEYdhnqwjaVG+/HtZOI0bd1EPAI7Syc3
         AZV+grFl4KDdxouzItQHpL+6LMhjjXv4z+qjYA8aG1YXkzP+uFe5TNkwQtyz5LAwjcXo
         9pNfti2p5bQdVZAt/Be176af20WOLvo9Kluus=
In-Reply-To: <AANLkTinxuSAEQdBC-CV3Yq3C5tAqT-HgS16Yidu_D5Qo@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, senthilkumaar2021@gmail.com

(Resending as plain text)
Any help would be appreciated.  Thanks.

---------- Forwarded message ----------
=46rom: John Lauro <johnalauro@gmail.com>
Date: Sat, May 29, 2010 at 10:40 AM
Subject: Re: Squid + Tproxy + Bridge on Kernel 2.6.34 - Workaround
To: netfilter@vger.kernel.org, senthilkumaar2021@gmail.com


I am having a similar problem and have not been able to get Tproxy to
work with any kernel > 2.6.29 and the workaround isn't working for me.

Upgraded most of the utils.
iptables v1.4.8
ebtables v2.0.9-2

I have a slightly more complicated setup in that I am also using
haproxy for all ports forwarding 80 to squid.
after the normal scripts, I tried manually running
ip rule add dev eth0 fwmark 1 lookup 100
along with eth2 and br0 and it didn't help.

Are there any things that I could be missing in /proc?=A0 Does
/proc/sys/net/ipv4/conf/*/src_valid_mark need to be set?=A0 (I seen
mention of that in the kernel archives somewhere but didn't completely
understand).


Here is the scripts I am using in case there is something basic that
is wrong that I am just lucky is working with older kernel:
#! /bin/ksh

=2E ./netset

ifconfig eth0 down
ifconfig eth2 down

ifconfig eth0 0.0.0.0 up
ifconfig eth2 0.0.0.0 up

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth2

ifconfig br0 $MYIP netmask $MYMASK
route add default gw $MYGW

brctl stp br0 off


ebtables -t broute -F
ebtables -t nat -F
ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
--ip-dport 80 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -i eth0 -p ipv4 --ip-proto tcp
--ip-sport 80 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp --ip-dport 3129
-j redirect --redirect-target DROP

ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp -j
redirect --redirect-target DROP
#ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp -j redirect
--redirect-target DROP

ebtables -t nat -A PREROUTING -p ipv4 --ip-proto tcp --ip-dport 80 -j
redirect --redirect-target ACCEPT
ebtables -t nat -A PREROUTING -p ipv4 --ip-proto tcp --ip-sport 80 -j
redirect --redirect-target ACCEPT

ebtables -t nat -A PREROUTING -p ipv4 --ip-proto tcp -j redirect
--redirect-target ACCEPT

cd /proc/sys/net/bridge/.
for i in *
=A0=A0 do
=A0=A0 echo 1 > $i
=A0=A0 done

bridge-nf-call-arptables=A0 bridge-nf-call-iptables
bridge-nf-filter-vlan-tagged
bridge-nf-call-ip6tables=A0 bridge-nf-filter-pppoe-tagged

iptables -F
iptables -t nat -F
iptables -t mangle -F

cd /proc/sys/net/ipv4/conf/all
echo 1 >forwarding
echo 1 >../../ip_forward

iptables -t mangle -N DIVERT
iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT

#do not mess with local ips
for ip in `ip addr | grep " inet " | awk '{ print $2 }' | awk -F/ '{
print $1 }'` ; do iptables -t mangle -A PREROUTING -p tcp -d $ip -j
DIVERT ; done
for ip in `ip addr | grep " inet " | awk '{ print $2 }' | awk -F/ '{
print $1 }'` ; do iptables -t mangle -A PREROUTING -p tcp -s $ip -j
DIVERT ; done

iptables -t mangle -A PREROUTING -i eth2 -p tcp --dport 80 -j TPROXY
--tproxy-mark 0x1/0x1 --on-ip $MYIP --on-port 5680
iptables -t mangle -A PREROUTING -i eth2 -p tcp -j TPROXY
--tproxy-mark 0x1/0x1 --on-ip $MYIP --on-port 5678

iptables -t mangle -A DIVERT -j MARK --set-mark 1
iptables -t mangle -A DIVERT -j ACCEPT

ip rule add fwmark 1 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100



ping and udp route through as expected.=A0 TCP is not working, and
doesn't even register as a SYN received although all the proper rules
seem to be triggering.
As mentioned, works with 2.6.29.6 (which isn't really a good version
for other reasons).
