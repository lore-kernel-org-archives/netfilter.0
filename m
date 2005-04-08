From: "Ilo Lorusso" <sneak@ipnoc.co.za>
Subject: Redirecting mail
Date: Fri, 8 Apr 2005 12:26:37 +0200
Message-ID: <003301c53c25$72c951e0$648045ac@sneak>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Ive got a mailserver sitting on a network with a ip address =
172.20.128.56 which its internet line is very congested, now on another =
network i have a another linux box 192.168.16.56 with a default route =
which goes out another internet line..

Now what i would like to know is there a way I could route all out going =
mail from 172.20.128.56
to 192.168.16.56 using iptables DNAT.

First of all, is it possible to do what I want to do? and would I use =
iptables or iptables with something else?

This is what ive tried...

on 172.20.128.56 (Red Hat Linux release 7.3)
i issue the command  :=20
iptables -t nat -A OUTPUT -p tcp -m multiport --dports smtp -j DNAT =
--to-destination 192.168.12.56

now when im on 192.168.12.56 (Red Hat Linux release 9 (Shrike) )
and do a tcpdump greping for smtp I see connections from 172.20.128.56
but not exactly sure what its doing.. but what i know, from  =
172.20.128.56 I cant make smtp connections out to the internet..

tcpdump: listening on eth0
16:07:03.867918 172.20.128.56.56476 > 192.168.12.56.smtp: S =
2918215293:2918215293(0) win 5840 <mss 1380,sackOK,timestamp 10220283 =
0,nop,wscale 0> (DF)
16:07:03.868077 192.168.12.56.smtp > 172.20.128.56.56476: S =
546916583:546916583(0) ack 2918215294 win 5792 <mss =
1460,sackOK,timestamp 180210285 10220283,nop,wscale 0> (DF)
16:07:06.864296 172.20.128.56.56476 > 192.168.12.56.smtp: S =
2918215293:2918215293(0) win 5840 <mss 1380,sackOK,timestamp 10220583 =
0,nop,wscale 0> (DF)
16:07:06.864362 192.168.12.56.smtp > 172.20.128.56.56476: S =
546916583:546916583(0) ack 2918215294 win 5792 <mss =
1460,sackOK,timestamp 180210585 10220283,nop,wscale 0> (DF)
16:07:08.261244 192.168.12.56.smtp > 172.20.128.56.56476: S =
546916583:546916583(0) ack 2918215294 win 5792 <mss =
1460,sackOK,timestamp 180210725 10220283,nop,wscale 0> (DF)
16:07:12.863062 172.20.128.56.56476 > 192.168.12.56.smtp: S =
2918215293:2918215293(0) win 5840 <mss 1380,sackOK,timestamp 10221183 =
0,nop,wscale 0> (DF)
16:07:12.863131 192.168.12.56.smtp > 172.20.128.56.56476: S =
546916583:546916583(0) ack 2918215294 win 5792 <mss =
1460,sackOK,timestamp 180211185 10220283,nop,wscale 0> (DF)
16:07:14.261232 192.168.12.56.smtp > 172.20.128.56.56476: S =
546916583:546916583(0) ack 2918215294 win 5792 <mss =
1460,sackOK,timestamp 180211325 10220283,nop,wscale 0> (DF)
16:07:15.006377 172.20.128.56.56531 > 192.168.12.56.smtp: S =
2944177066:2944177066(0) win 5840 <mss 1380,sackOK,timestamp 10221397 =
0,nop,wscale 0> (DF)
16:07:15.006502 192.168.12.56.smtp > 172.20.128.56.56531: S =
552052850:552052850(0) ack 2944177067 win 5792 <mss =
1460,sackOK,timestamp 180211399 10221397,nop,wscale 0> (DF)


