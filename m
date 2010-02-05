From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 20:37:37 +0100
Message-ID: <201002052037.37572.christoph.paasch@gmail.com>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com> <1265394296.3910.19.camel@casper.meteor.dp.ua> <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=65juZLb78504vyly0mtut3Keh67s8MNteCLfFyqbUOk=;
        b=f2Nfb2iKyoxKtm35qosd+ChTT4nKZcITZ0V7DZ0kZPyHdQV9hwr2oKEojCKQg5KcXV
         IU9yPD/cJXTWScd6xq8jQVkr9WEyYdkXM5iXUILIa9wXtoETRemnGVSmU/P0c2yIbBWW
         FUZ3915rQg4pNCCpV5uZoDUGFsUKHsvC6/ClA=
In-Reply-To: <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dan Daugherty <rescue@ddaniscool.com>
Cc: =?utf-8?b?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>, netfilter@vger.kernel.org

Hi,

looks like the packets are not hitting the POSTROUTING-Hook. 

Are you sure that you have forwarding enabled in your kernel?
Check /proc/sys/net/ipv4/ip_forward

Or an iptables rule in the forwarding-chain?

Regards,
Christoph

On Fri 5 February 2010 wrote Dan Daugherty:
> I had to make some changes to the ultimate destination since the
> machine I am trying to get to didn't have tcpdump and getting it for
> solaris isn't worth it to me.  Since I know this is an iptables issue,
> I'm good with using a different destination to test and then change it
> in production.
> 
> Dictionary:
> err.sfa.com is the machine from which I am testing. ip of 6.149
> sethra is the router. ip of 1.205
> vlad is the destination machine. ip of 1.206
> 
> 
> Commands used on sethra:
> iptables -F
> iptables -F -t nat
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1521 -j LOG
> --log-prefix '**LOG PRE** '
> iptables -t nat -A POSTROUTING -o eth0 -p tcp  -j LOG --log-prefix
> '**LOG POST** '
> 
> iptables -t nat -A PREROUTING -p tcp --dport 1521 -i eth0 -j DNAT --to
> 10.117.1.206:1521
> iptables -t nat -A POSTROUTING -o eth0 -d 10.117.1.206 -p tcp --dport
> 1521 -j SNAT --to-source 10.117.1.205
> 
> err:~ dan$ telnet 10.117.1.205 1521
> Trying 10.117.1.205...
> telnet: connect to address 10.117.1.205: Operation timed out
> telnet: Unable to connect to remote host
> 
> packet counts
> [root@sethra ~]# iptables -t nat -nvL
> Chain PREROUTING (policy ACCEPT 35405 packets, 42M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>    22  1152 LOG        tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp dpt:1521 LOG flags 0 level 4 prefix `**LOG
> PRE** '
>    22  1152 DNAT       tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp dpt:1521 to:10.117.1.206:1521
> 
> Chain POSTROUTING (policy ACCEPT 428 packets, 39754 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 LOG        tcp  --  *      eth0    0.0.0.0/0
> 0.0.0.0/0           LOG flags 0 level 4 prefix `**LOG POST** '
>     0     0 SNAT       tcp  --  *      eth0    0.0.0.0/0
> 10.117.1.206        tcp dpt:1521 to:10.117.1.205
> 
> Chain OUTPUT (policy ACCEPT 471 packets, 48328 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 
> 
> Kernel logs:
> Feb  5 14:01:27 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=64 TOS=0x10 PREC=0x00 TTL=64 ID=13244 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:28 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=64 TOS=0x10 PREC=0x00 TTL=64 ID=1431 DF PROTO=TCP
> SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:29 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=64 TOS=0x10 PREC=0x00 TTL=64 ID=21407 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:30 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=44931 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:31 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=17401 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:32 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=23430 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:34 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=34207 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:38 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=7366 DF PROTO=TCP
> SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:01:46 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=36068 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:02:02 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=32933 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> Feb  5 14:02:34 sethra kernel: **LOG PRE** IN=eth0 OUT=
> MAC=00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=10.117.6.149
> DST=10.117.1.205 LEN=48 TOS=0x10 PREC=0x00 TTL=64 ID=32389 DF
> PROTO=TCP SPT=62981 DPT=1521 WINDOW=65535 RES=0x00 SYN URGP=0
> 
> TPCDUMP sethra
> [root@sethra ~]# tcpdump -i eth0 'port 1521'
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> 14:01:27.126210 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,nop,wscale
> 3,nop,nop,timestamp 635091437 0,sackOK,eol>
> 14:01:28.107814 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,nop,wscale
> 3,nop,nop,timestamp 635091446 0,sackOK,eol>
> 14:01:29.108654 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,nop,wscale
> 3,nop,nop,timestamp 635091456 0,sackOK,eol>
> 14:01:30.109676 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:31.110723 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:32.111917 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:34.113682 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:38.117485 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:46.125289 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:02:02.139805 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:02:34.169506 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 
> 11 packets captured
> 11 packets received by filter
> 0 packets dropped by kernel
> 
> TCPDUMP vlad
> [root@vlad ~]# tcpdump -i eth0 'port 1521'
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
Christoph Paasch

Alcatel-Lucent
IP Development

www.rollerbulls.be
--
