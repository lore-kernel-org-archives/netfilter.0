From: "j davis" <davis_compz@hotmail.com>
Subject: Re: thanks for the help (netfilter)
Date: Tue, 02 Jul 2002 07:38:36 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F68LmvUk7rWY7xnZRXm00003f4c@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org




i sent this already but it bounced

Hello,

The thing that has helped me the most when trying new firewall rules
is logging. When you put a log rule before the drop rule you will get
all the info you need. I see that your deafult polices are accept..
i hope this is for testing...here are some other things...

    #Forward ssh to internal host
iptables -t nat -A PREROUTING -p tcp -d $extip --dport 300 -j DNAT --to
192.168.0.8
is your sshd listening on port 300 on ip 192.168.0.8 if not add this
instead of 192.168.0.8>>>  192.168.0.8:22

also maybe your problem is in prerouting...Dnat rule  need
"--to-destination"
ex..

iptables -t nat -A PREROUTING -p tcp -d $webip --dport 80 -j DNAT
--to-destinaion\
192.168.0.8

notice the " \ " allows you to continue a rule on the next line without
BASH freaking out. Hope this helps if you would like I can send you my
script it has examples of making custom chains, i like using custom chains
it makes for easier rule writing when you split up the default chains
(FORWARD,INPUT,OUTPUT) into smaller more specific chains like...
INTERNET_to_LAN
LAN_to_INTERNET
FIREWALL_TO_LAN
LAN_TO_FIREWALL
etc...etc...

also here is a example of a log rule..log then drop...logged stuff
shows up in /var/log/messages

iptables -A INPUT -d 10.0.0.2 -p udp --dport 137:139 -j LOG
--log-prefix=3D"SMB\ INPUT:"
iptables -A INPUT -d 10.0.0.2 -p udp --dport 137:139 -j DROP


hope this helps
jd
http://www.taproot.bz/


>From: "outspoken" <outspoken@gru.net>
>To: "j davis" <davis_compz@hotmail.com>
>Subject: Re: thanks for the help (netfilter)
>Date: Tue, 2 Jul 2002 03:29:51 -0400
>MIME-Version: 1.0
>Received: from grucom2.gru.net ([209.251.129.7]) by hotmail.com with=20
>Microsoft SMTPSVC(5.0.2195.4905); Tue, 2 Jul 2002 00:29:13 -0700
>Received: from [65.33.189.93] by grucom2.gru.net (NTMail=20
>7.02.3028/NU4112.00.c8d0dec5) with ESMTP id ervcpbaa for=20
>davis_compz@hotmail.com; Tue, 2 Jul 2002 03:30:12 -0400
>Message-ID: <002001c2219a$411d88d0$0200a8c0@SILVERBEAST>
>References: <F197IU1Gj03oHMwVN7m000039db@hotmail.com>
>X-Priority: 3
>X-MSMail-Priority: Normal
>X-Mailer: Microsoft Outlook Express 6.00.2600.0000
>X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
>X-AuthenticatedSender: outspoken@gru.net
>Return-Path: outspoken@gru.net
>X-OriginalArrivalTime: 02 Jul 2002 07:29:13.0759 (UTC)=20
>FILETIME=3D[2A443AF0:01C2219A]
>
>oh, btw.. i made a LOG for port 80 here is the info from the external IP
>
>WEB INPUT:IN=3Deth1 OUT=3D MAC=3Dblah.blah.blah SRC=3D192.168.0.2
>DST=3Dexternal.ip.here LEN=3D46 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D2458=
1 DF=20
>PROTO=3DTCP
>SPT=3D2426 DPT=3D110 WINDOW=3D64225 RES=3D0x00 ACK PSH URGP=3D0
>
>
>
>----- Original Message -----
>From: "j davis" <davis_compz@hotmail.com>
>To: <outspoken@gru.net>
>Sent: Monday, July 01, 2002 8:09 PM
>Subject: Re: thanks for the help (netfilter)
>
>
> >
> > Hello,
> >
> >   The thing that has helped me the most when trying new firewall rules
> > is logging. When you put a log rule before the drop rule you will get
> > all the info you need. I see that your deafult polices are accept..
> > i hope this is for testing...here are some other things...
> >
> > >#Forward ssh to internal host
> > >iptables -t nat -A PREROUTING -p tcp -d $extip --dport 300 -j DNAT --to
> > >192.168.0.8
> > is your sshd listening on port 300 on ip 192.168.0.8 if not add this
> > instead of 192.168.0.8>>>  192.168.0.8:22
> >
> > also maybe your problem is in prerouting...Dnat rule  need
> > "--to-destination"
> > ex..
> >
> > iptables -t nat -A PREROUTING -p tcp -d $webip --dport 80 -j DNAT
> > --to-destinaion\
> > 192.168.0.8
> >
> > notice the " \ " allows you to continue a rule on the next line without
> > BASH freaking out. Hope this helps if you would like I can send you my
> > script it has examples of making custom chains, i like using custom=20
>chains
> > it makes for easier rule writing when you split up the default chains
> > (FORWARD,INPUT,OUTPUT) into smaller more specific chains like...
> > INTERNET_to_LAN
> > LAN_to_INTERNET
> > FIREWALL_TO_LAN
> > LAN_TO_FIREWALL
> > etc...etc...
> >
> > also here is a example of a log rule..log then drop...logged stuff
> > shows up in /var/log/messages
> >
> > iptables -A INPUT -d 10.0.0.2 -p udp --dport 137:139 -j LOG
> > --log-prefix=3D"SMB\ INPUT:"
> > iptables -A INPUT -d 10.0.0.2 -p udp --dport 137:139 -j DROP
> >
> >
> > hope this helps
> > jd
> > http://www.taproot.bz/
> > >From: "outspoken" <outspoken@gru.net>
> > >To: <davis_compz@hotmail.com>
> > >Subject: thanks for the help (netfilter)
> > >Date: Mon, 1 Jul 2002 16:09:10 -0400
> > >MIME-Version: 1.0
> > >Received: from grucom2.gru.net ([209.251.129.7]) by hotmail.com with
> > >Microsoft SMTPSVC(5.0.2195.4905); Mon, 1 Jul 2002 13:08:48 -0700
> > >Received: from [65.33.189.93] by grucom2.gru.net (NTMail
> > >7.02.3028/NU4112.00.c8d0dec5) with ESMTP id xyqapbaa for
> > >davis_compz@hotmail.com; Mon, 1 Jul 2002 16:09:29 -0400
> > >Message-ID: <004301c2213b$2a0ff0b0$0200a8c0@SILVERBEAST>
> > >X-Priority: 3
> > >X-MSMail-Priority: Normal
> > >X-Mailer: Microsoft Outlook Express 6.00.2600.0000
> > >X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
> > >X-AuthenticatedSender: outspoken@gru.net
> > >Return-Path: outspoken@gru.net
> > >X-OriginalArrivalTime: 01 Jul 2002 20:08:48.0527 (UTC)
> > >FILETIME=3D[1C8831F0:01C2213B]
> > >
> > >i was working on this for a few hours now, all the suggestions you gave
>me.
> > >and here is what i have so far in my script:
> > >thanks for the "modprobe" instead of insmod, it works much better. but=
=20
>i
> > >still can't get to my internal server for apache/mysql
> > >i added the other 3 lines you posted to the listserv.
> > >
> > >sorry for emailing you directly, but since its been a while i didn't=20
>want
> > >this to pass you by.
> > >
> > >i turned off the services on the firewall machine and also stopped=20
>them,
> > >they are all running on the internal machine and i can see them running
> > >locally but not from the internet.
> > >
> > >
> > >#!/bin/bash
> > >
> > >echo "[-----firewall module init-----]"
> > >cd /lib/modules/2.4.10-4GB/kernel/net/ipv4/netfilter
> > >modprobe ip_tables
> > >modprobe ip_conntrack
> > >modprobe ipt_state
> > >modprobe ipt_limit
> > >modprobe iptable_filter
> > >modprobe iptable_mangle
> > >modprobe ipt_LOG
> > >modprobe ipt_MASQUERADE
> > >modprobe ipt_REDIRECT
> > >modprobe ipt_REJECT
> > >modprobe iptable_nat
> > >
> > >echo "[-----clearing firewall rulesets-----]"
> > >iptables -F INPUT
> > >iptables -F FORWARD
> > >iptables -F OUTPUT
> > >iptables -P INPUT ACCEPT
> > >iptables -P FORWARD ACCEPT
> > >iptables -P OUTPUT ACCEPT
> > >
> > >echo "[-----network address translation---]"
> > >
> > >extif=3Deth0
> > >intif=3Deth1
> > >
> > >extip=3Dxxx.xxx.xxx.xxx
> > >intip=3D192.168.0.1
> > >webip=3D192.168.0.8
> > >
> > >iptables -t nat -F
> > >iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> > >echo 1 > /proc/sys/net/ipv4/ip_forward
> > >
> > >echo "[-----enabling spoof protection-----]"
> > >
> > >for blah in /proc/sys/net/ipv4/conf/*/rp_filter; do
> > >echo "1" > $blah
> > >done
> > >
> > >echo "[-----setting external rulesets-----]"
> > >iptables -A INPUT -i eth0 -f -j DROP
> > >iptables -A INPUT -i eth0 -p TCP --syn -m limit --limit 1/s -j ACCEPT
> > >iptables -A INPUT -i eth0 -p TCP --tcp-flags SYN,ACK,FIN,RST RST -m=20
>limit
> > >--limit 1/s -j ACCEPT
> > >iptables -A INPUT -i eth0 -p TCP --dport 32768:61000 -m state --state
> > >ESTABLISHED -j ACCEPT
> > >iptables -A INPUT -i eth0 -p ICMP --icmp-type echo-reply -j ACCEPT
> > >iptables -A INPUT -i eth0 -p TCP -s 192.168.0.2/255.255.255.255 --dport
>22
> > >-m state --state NEW,ESTABLISHED -j ACCEPT
> > >iptables -A INPUT -i eth0 -p TCP --dport 137 -j DROP
> > >iptables -A INPUT -i eth0 -p UDP --dport 137 -j DROP
> > >iptables -A INPUT -i eth0 -p TCP --dport 138 -j DROP
> > >iptables -A INPUT -i eth0 -p UDP --dport 138 -j DROP
> > >iptables -A INPUT -i eth0 -p TCP --dport 139 -j DROP
> > >iptables -A INPUT -i eth0 -p UDP --dport 139 -j DROP
> > >iptables -A INPUT -i eth0 -p TCP --dport 32768:61000 -m state --state
> > >ESTABLISHED -j ACCEPT
> > >iptables -A INPUT -i eth0 -p TCP --sport 32768:61000 --dport 22 -m=20
>state
> > >--state NEW,ESTABLISHED -j ACCEPT
> > >
> > >echo "[-----setting internal rulesets-----]"
> > >iptables -A FORWARD -i eth1 -d 10.0.0.0/8 -j DROP
> > >iptables -A FORWARD -i eth1 -d 127.0.0.0/8 -j DROP
> > >iptables -A FORWARD -i eth1 -p igmp -j DROP
> > >iptables -A FORWARD -i eth1 -p TCP --syn -m limit --limit 10/s -j=20
>ACCEPT
> > >iptables -A FORWARD -i eth1 -p TCP --tcp-flags SYN,ACK,FIN,RST RST -m
>limit
> > >--limit 10/s -j ACCEPT
> > >
> > >iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 80 -j
>DNAT --to
> > >192.168.0.8
> > >
> > >iptables -A FORWARD -d 192.168.0.8 -p tcp --dport 80 -j ACCEPT
> > >iptables -A FORWARD -s 192.168.0.8 -m state --state
>RELATED,ESTABLISHED -j
> > >ACCEPT
> > >
> > >#Forward web services to internal host
> > >iptables -t nat -A PREROUTING -p tcp -d $extip --dport 80 -j DNAT --to
> > >192.168.0.8
> > >
> > >#Forward ssh to internal host
> > >iptables -t nat -A PREROUTING -p tcp -d $extip --dport 300 -j DNAT --to
> > >192.168.0.8
> > >
> > >#Forward mysql to internal host
> > >iptables -t nat -A PREROUTING -p tcp -d $extip --dport 3306 -j DNAT=20
>--to
> > >192.168.0.8
> > >
> > ># Remember to shut off the above services on your firewall box. And=20
>when
> > >you change your default FORWARD policy to DROP, you will have to add an
> > ># explicit -j ACCEPT before each above port forward rule in the FORWARD
> > >chain.
> > >
> > >iptables -A INPUT -i eth1 -p TCP -s 0/0 -d 0/0 --dport 22 -m
>state --state
> > >NEW,ESTABLISHED -j ACCEPT
> > >
> > >echo "[-----setting internal rulesets-----]"
> > >iptables -A INPUT -i lo -j ACCEPT
> > >iptables -A FORWARD -i eth1 -p ICMP -s 192.168.0.0/24 -j ACCEPT
> > >
> > >echo "[-----setting forward rulesets-----]"
> > >iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -p TCP -j
> > >ACCEPT
> > >iptables -A INPUT -i eth1 -s 192.168.0.0/24 -d 192.168.0.0/24 -p UDP -j
> > >ACCEPT
> > >
> > >echo "[-----firewall.NAT.gateway.DONE-----]"
> >
> >
> > thanks,
> > jd
> >
> > jd@taproot.bz
> > http://www.taproot.bz
> >
> > _________________________________________________________________
> > MSN Photos is the easiest way to share and print your photos:
> > http://photos.msn.com/support/worldwide.aspx
> >


thanks,
jd

jd@taproot.bz
http://www.taproot.bz

thanks,
jd

jd@taproot.bz
http://www.taproot.bz

thanks,
jd

jd@taproot.bz
http://www.taproot.bz

_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com


