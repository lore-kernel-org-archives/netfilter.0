From: Azerty Ytreza <007liamg007@gmail.com>
Subject: Problem with log which are corrupted and need help with hitcount and
 FORWARD rules
Date: Sat, 22 Oct 2011 10:43:17 +0200
Message-ID: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=2KsGgQiWxo23NWAajQg5aByZv6w0wE/Q895GNYR5n4o=;
        b=AaXH+ayKCd6N6RT739HAaZy6CIIHxeJV5ttaVEthgn3eD5tCSO9ehRXWp0BqJnD/vu
         7GmhCHeuBK+DYRJcydzVCW9+HhlWcgE//2J9h258OdKibjDxYqyq5tzfQsgsJJNs1zqd
         hKK/pmFtr9i3yXaucTVizQ3FDBapOOQvpwQGY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have a two littles problem with iptables :

First :
*******
My logs are corrupted. Seem to be corrupted since I have installed LXC
but not 100% sure.
But working while a moment and I doesn't have made big change in my rules.

This an exemple of my logs :
***************************************
Oct 16 09:15:52 Linux kernel: 4234990]it:I=t1OT A=05:ad:d0:02:b7:ed:80
R=8..53 S=11.3.1 E=8TS00 RC00 T=1 D52 FPOOTPST22 P=03 IDW89 E=x0SNUG=
<4>[120376.277507] iptables: IN=eth1 OUT=
MAC=00:50:da:de:3d:02:00:23:eb:78:2e:da:08:00 SRC=182.55.136.87
DST=78.15.238.214 LEN=95 TOS=0x00 PREC=0x00 TTL=116 ID=27543 PROTO=UDP
SPT=443 DPT=50135 LEN=75
Oct 16 10:47:53 Linux kernel: [125896.982195] iptables: IN= OUT=eth1
SRC=78.15.238.214 DST=91.204.81.10 LEN=40 TOS=0x00 PREC=0x00 TTL=64
ID=0 DF PROTO=TCP SPT=60875 DPT=80 WINDOW=0 RES=0x00 RST URGP=0
Oct 16 10:55:06 Linux kernel: [126269.328174] iptables: IN= OUT=eh1
SR=11.3.1 S=1248.0LN4 O=x0PE=x0TL6 D0D RT=C P=36 P=0WNO= E=x0RTUG=
=66.2LN41TS00 RC00 T=4I= FPOOUPST577DT467LN41
Oct 16 11:06:19 Linux kernel: [127003.128125] iptables: IN=eth1 OUT=
MAC=00:50:da:de:3d:02:00:23:eb:78:2e:da:08:00 SRC=193.247.250.19
DST=78.15.238.214LEN=56 O=x0PE=x0TL4 D0D RT=D P=79 P=06 E=6
Oct 16 11:06:19 Linux kernel: [127003.364436] iptables: IN=eth1 OUT=
MAC=00:50:da:de:3d:02:00:23:eb:78:2e:da:08:00 SRC=193.247.250.19
DST=78.15.238.214 LEN=56 TOS=0x00 PREC=0x00 TTL=49 ID=0 DF PROTO=UDP
SPT=17390 DPT=50368 LEN=36
Oct 16 11:06:20 Linux kernel: [127004.587493] iptables: IN=eth1 OUT=
MAC=00:50:da:de:3d:02:00:23:eb:78:2e:da:08:00 SRC=193.247.250.19
DST=78.15.238.214 LEN=56 TOS=0x00 PREC=0x00 TTL=49 ID=0 DF PROTO=UDP
SPT=17390 DPT=50368 LEN=36
***************************************

So time of time the logs is 100% correct but a lot of times the log is
totally corrupted and almost unreadable :(
Someone have and idea ?

I load these modules at startup :
***************************************
modprobe iptable_nat
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_tables
modprobe ipt_LOG
modprobe ipt_MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
***************************************

I use Debian Squeeze x86-64 and the kernel version is 2.6.32-5-amd64.
lxc version: 0.7.2

/var/log/message (corrupted)
/var/log/kernel.log (corrupted)

Second :
***********

I use these rules by the past for limit number of connections during
some seconds and block connections if they are too many attempt.

Old rules which work very well :
***************************************
iptables -A INPUT -i eth1 -p tcp --dport 443 -m state --state NEW -m
recent --set
iptables -A INPUT -i eth1 -p tcp --dport 443 -m state --state NEW -m
recent --update --seconds 60 --hitcount 10 -j DROP
#ptables -A INPUT -i eth1 -p tcp --dport 443 -m state --state
NEW,ESTABLISHED -j ACCEPT
***************************************

I have adapted this rules for a FORWARD rules and doesn't work :
***************************************
iptables -A INPUT -i eth1 -p udp -m udp --dport 443 -m state --state
NEW -m recent --set
iptables -A INPUT -i eth1 -p udp -m udp --dport 443 -m recent --update
--seconds 60 --hitcount 10 -j DROP
iptables -A FORWARD -i eth1 -p udp -m udp --dport 443 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p udp -m udp --dport 443 -j
DNAT --to-destination 192.168.1.2:443
***************************************

Someone can explain me why these rules doesn't block request when
hitcount is reached ?
I have try other method and put "hitcount" on the FORWARD rules
directly but it's not work, I have an error from iptables which
doesn't accept "--set" on a FORWARD request. I doesn't remember error
but it's probably not the good method.

I have made a lot of research, I have found an article with LXC bug
because log are centralized and not separated by container. There is a
little patch for that but it's really that ? Because I have separate
iptables log with a comment and log from my host is corrupted too not
only logs from container :(

Thank you in advance for your help !

Best Regards,
David
