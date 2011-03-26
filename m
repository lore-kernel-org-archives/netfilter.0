From: "cc" <cc@kdtc.net>
Subject: Re: netfilter pecularities Part 2
Date: Sat, 26 Mar 2011 12:58:39 +0800
Message-ID: <20110326045811.M78147@kdtc.net>
References: <20110325090527.M18530@kdtc.net> <1301076174.2891.114.camel@andybev>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1301076174.2891.114.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I took the advice of Andrew Beverley and changed the commands
to log.  I also added another command:

$IPT -A FORWARD -i $INET_IF -o $DMZ_IF -p tcp --dport $SMTP \
          -j LOG --log-prefix="FORWARD :"

as well as 

$IPT -t nat -A PREROUTING -p tcp -i $INET_IF -d $INET_IP \
           --dport $SMTP -j LOG --log-prefix="SMTPcross :"

And I get the following:

Mar 26 12:35:05 flame kernel: SMTPcross:IN=eth1 OUT= MAC=00:02:b3:0b:62:e8:00
:02:85:1a:73:60:08:00 SRC=211.44.183.97 DST=<INET_IP> LEN=60 TOS=0x00 PREC=0x
00 TTL=50 ID=64270 DF PROTO=TCP SPT=38358 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0

Mar 26 12:35:05 flame kernel: FORWARD :IN=eth1 OUT=eth0 SRC=211.44.183.97 DST
=<SMTP_IP> LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=64270 DF PROTO=TCP SPT=38358 D
PT=25 WINDOW=5840 RES=0x00 SYN URGP=0
Mar 26 12:35:05 flame kernel: FORWARD :IN=eth1 OUT=eth0 SRC=211.44.183.97 DST
=<SMTP_IP> LEN=52 TOS=0x00 PREC=0x00 TTL=49 ID=64271 DF PROTO=TCP SPT=38358 D
PT=25 WINDOW=46 RES=0x00 ACK URGP=0
Mar 26 12:35:08 flame kernel: FORWARD :IN=eth1 OUT=eth0 SRC=211.44.183.97 DST
=<SMTP_IP> LEN=52 TOS=0x00 PREC=0x00 TTL=49 ID=64272 DF PROTO=TCP SPT=38358 D
PT=25 WINDOW=46 RES=0x00 ACK URGP=0


In the first instance, it does show the correct SRC and DST
IPs.  Then the FORWARD comes along and the DNAT rule has
changed the DST IP to SMTP_IP.

However, if I do a tcpdump (on Flame):

12:35:05.521870 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], proto: TCP (6)
, length: 60) <SMTP_IP>.smtp > flame.dmznet.38358: S 3798765348:37
98765348(0) ack 2410447416 win 5792 <mss 1460,sackOK,timestamp 23906935[|tcp]>
12:35:08.645534 IP (tos 0x0, ttl  64, id 17841, offset 0, flags [DF], proto: TCP
 (6), length: 77) <SMTP_IP>.smtp > flame.dmznet.38358: P 1:26(25)
ack 1 win 91 <nop,nop,timestamp 23907715 271743407>

then on <SMTP_IP> I get the following dump:

12:35:05.444308 IP (tos 0x0, ttl  49, id 64270, offset 0, flags [DF], proto: TCP
 (6), length: 60) flame.38358 > <smtp_name>.smtp: S, cksum 0x6c13 (correct), 2410
447415:2410447415(0) win 5840 <mss 1460,sackOK,timestamp 271743289 0,nop,wscale
7>
12:35:05.444308 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], proto: TCP (6)
, length: 60) smtp_name.smtp > flame.38358: S, cksum 0x2ebe (correct), 37987653
48:3798765348(0) ack 2410447416 win 5792 <mss 1460,sackOK,timestamp 23906935 271
743289,nop,wscale 6>
12:35:05.560327 IP (tos 0x0, ttl  49, id 64271, offset 0, flags [DF], proto: TCP
 (6), length: 52) flame.38358 > smtp_name.smtp: ., cksum 0x7385 (correct), 1:1(
0) ack 1 win 46 <nop,nop,timestamp 271743407 23906935>
12:35:08.564830 IP (tos 0x0, ttl  64, id 17841, offset 0, flags [DF], proto: TCP
 (6), length: 77) smtp_name.smtp > flame.38358: P, cksum 0x941d (incorrect (->
0x42bf), 1:26(25) ack 1 win 91 <nop,nop,timestamp 23907715 271743407>
12:35:08.684850 IP (tos 0x0, ttl  49, id 64272, offset 0, flags [DF], proto: TCP
 (6), length: 52) flame.38358 > smtp_name.smtp: ., cksum 0x642c (correct), 1:1(
0) ack 26 win 46 <nop,nop,timestamp 271746531 23907715>

While the names have been changed, the data haven't.  What I'm hoping is
that my attempt at syncronizing capturing at one goal produces some sort
of consistent log.  (I judged by the timestamp, fwiw).

Now on my smtp server, IPtables isn't being used.  So from my not so
experienced look, between the tcpdump log from flame, to the log
in smtp_name,  the Src IP is changed from <some external IP> to 
<flame>.  

If I remember correctly, prior to 11th March, the mail headers are
consistent with what is shown in the flame's tcpdump log; that is,
the Connection is from the external IP.  HOwever after 11th March,
the connection IP is changed to my firewall's ip.  Unfortunately,
between the 11th and two days ago, I wasn't in the office so I
really have no idea what happened.  :(

As an example: prior to 11th March, the securityfocus e-mail
received header was:

 Received: from outgoing3.securityfocus.com (outgoing.securityfocus.com 
             [205.206.231.27])	by <company.com> (8.14.4/8.14.2) with 
             ESMTP id p21HqxDF008772	for <my@email.com>; Wed, 
             2 Mar 2011 01:53:02 +0800
             
After 11th March, I get the following:

 Received: from outgoing3.securityfocus.com (flame [flame_ip])	
             by <company.com> (8.14.4/8.14.2) with ESMTP 
             id p2LHBBDj005406	for <my@email.com>; Tue, 22 
             Mar 2011 01:11:15 +0800
             
This is the first Received line of the e-mail.  

So clearly *something* is changing the IP from the external
incoming IP to my internal dmz firewall ip.   I'm completely
stumped.  Now I'm looking over the logs and checking for
signs of entry. :(

Any help really appreciated.

Ed
