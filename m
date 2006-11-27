From: Sebastian Ewert <ewi100@arcor.de>
Subject: invalid ACK/RST droped, strange client, apache
Date: Mon, 27 Nov 2006 18:50:26 +0100
Message-ID: <456B2562.6010706@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm running a webserver using ubuntu 6.06 and apache 2.0.55. I have some problems
with the firewall script I'm using. I logdrop invalid TCP packets and I get a lot
of these ACK/RST entries (I disable the linebreak; because I hope in this case
it's easier to read the log entries; please say so if you don't like that):

1.)
Nov 27 14:12:24 mybox kernel: [1356791.030622] JuraFW TCPINV: IN=eth0 OUT= MAC=00:30:05:98:af:6c:00:08:e2:a5:d0:80:08:00 SRC=y.y.y.y DST=x.x.x.x LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=0 DF PROTO=TCP SPT=4812 DPT=80 WINDOW=5840 RES=0x00 ACK RST URGP=0
Nov 27 14:13:12 mybox kernel: [1356839.085322] JuraFW TCPINV: IN=eth0 OUT= MAC=00:30:05:98:af:6c:00:08:e2:a5:d0:80:08:00 SRC=y.y.y.y DST=x.x.x.x LEN=52 TOS=0x00 PREC=0x00 TTL=60 ID=0 DF PROTO=TCP SPT=4812 DPT=80 WINDOW=5840 RES=0x00 ACK RST URGP=0

where y.y.y.y is a client and x.x.x.x is my server. TCPINV means, as you might
have already figured out, that it is TCP and that it got filtered because it
was invalid.

I used tcpdump and I got for the connection with soure port 4812 the following:

2.)
14:11:38.699725 IP y.y.y.y.4812 > x.x.x.x.80: S 3111320446:3111320446(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.699740 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:42.257588 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:48.258279 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:12:00.259378 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:12:00.259772 IP y.y.y.y.4812 > x.x.x.x.80: R 1:1(0) ack 0 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:12:24.461169 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:12:24.461663 IP y.y.y.y.4812 > x.x.x.x.80: R 1:1(0) ack 0 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:13:12.665278 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:13:12.665677 IP y.y.y.y.4812 > x.x.x.x.80: R 1:1(0) ack 0 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>

This happens for quite a bunch of almost simultaneously arriving connections
request; connection 4812 is part of this:

3.)
14:11:38.692137 IP y.y.y.y.4810 > x.x.x.x.80: S 2075556557:2075556557(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.692154 IP x.x.x.x.80 > y.y.y.y.4810: S 4250627716:4250627716(0) ack 2075556558 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:38.696228 IP y.y.y.y.4811 > x.x.x.x.80: S 3208586648:3208586648(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.696243 IP x.x.x.x.80 > y.y.y.y.4811: S 4247076123:4247076123(0) ack 3208586649 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:38.699725 IP y.y.y.y.4812 > x.x.x.x.80: S 3111320446:3111320446(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.699740 IP x.x.x.x.80 > y.y.y.y.4812: S 4256143609:4256143609(0) ack 3111320447 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:38.705707 IP y.y.y.y.4813 > x.x.x.x.80: S 2614796699:2614796699(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.705722 IP x.x.x.x.80 > y.y.y.y.4813: S 4250163527:4250163527(0) ack 2614796700 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:38.709209 IP y.y.y.y.4814 > x.x.x.x.80: S 2542936973:2542936973(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.709223 IP x.x.x.x.80 > y.y.y.y.4814: S 4263734367:4263734367(0) ack 2542936974 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:38.713217 IP y.y.y.y.4815 > x.x.x.x.80: S 3684602729:3684602729(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.713232 IP x.x.x.x.80 > y.y.y.y.4815: S 4258749467:4258749467(0) ack 3684602730 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>

All of the connections in this block show the same behaviour as you can
see in (2).
But besides these strange connection requests, there are of course normal
connections from y.y.y.y that look like taken directly from the rfc:

14:11:38.217767 IP y.y.y.y.4803 > x.x.x.x.80: S 2773573065:2773573065(0) win 64240 <mss 1380,nop,wscale 0,nop,nop,sackOK>
14:11:38.217808 IP x.x.x.x.80 > y.y.y.y.4803: S 4261102855:4261102855(0) ack 2773573066 win 5840 <mss 1460,nop,nop,sackOK,nop,wscale 2>
14:11:38.281833 IP y.y.y.y.4803 > x.x.x.x.80: . ack 1 win 64860
14:11:38.306105 IP y.y.y.y.4803 > x.x.x.x.80: P 1:506(505) ack 1 win 64860
14:11:38.306120 IP x.x.x.x.80 > y.y.y.y.4803: . ack 506 win 1728
14:11:38.306312 IP x.x.x.x.80 > y.y.y.y.4803: . 1:1381(1380) ack 506 win 1728
14:11:38.306325 IP x.x.x.x.80 > y.y.y.y.4803: . 1381:2761(1380) ack 506 win 1728
14:11:38.394137 IP y.y.y.y.4803 > x.x.x.x.80: . ack 2761 win 64860
14:11:38.394155 IP x.x.x.x.80 > y.y.y.y.4803: . 2761:4141(1380) ack 506 win 1728
14:11:38.394164 IP x.x.x.x.80 > y.y.y.y.4803: . 4141:5521(1380) ack 506 win 1728
14:11:38.394170 IP x.x.x.x.80 > y.y.y.y.4803: . 5521:6901(1380) ack 506 win 1728
14:11:38.476462 IP y.y.y.y.4803 > x.x.x.x.80: . ack 4141 win 64860
14:11:38.476477 IP x.x.x.x.80 > y.y.y.y.4803: . 6901:8281(1380) ack 506 win 1728
14:11:38.476486 IP x.x.x.x.80 > y.y.y.y.4803: . 8281:9661(1380) ack 506 win 1728
14:11:38.486346 IP y.y.y.y.4803 > x.x.x.x.80: . ack 6901 win 64860
14:11:38.486361 IP x.x.x.x.80 > y.y.y.y.4803: P 9661:11041(1380) ack 506 win 1728
14:11:38.486370 IP x.x.x.x.80 > y.y.y.y.4803: . 11041:12421(1380) ack 506 win 1728
14:11:38.486376 IP x.x.x.x.80 > y.y.y.y.4803: . 12421:13801(1380) ack 506 win 1728
14:11:38.558038 IP y.y.y.y.4803 > x.x.x.x.80: . ack 8281 win 64860
14:11:38.558058 IP x.x.x.x.80 > y.y.y.y.4803: . 13801:15181(1380) ack 506 win 1728
14:11:38.558067 IP x.x.x.x.80 > y.y.y.y.4803: FP 15181:16391(1210) ack 506 win 1728
14:11:38.580397 IP y.y.y.y.4803 > x.x.x.x.80: . ack 11041 win 64860
14:11:38.584146 IP y.y.y.y.4803 > x.x.x.x.80: . ack 13801 win 64860
14:11:38.640735 IP y.y.y.y.4803 > x.x.x.x.80: . ack 15181 win 64860
14:11:38.645117 IP y.y.y.y.4803 > x.x.x.x.80: . ack 16392 win 63650
14:11:38.648634 IP y.y.y.y.4803 > x.x.x.x.80: F 506:506(0) ack 16392 win 63650
14:11:38.648645 IP x.x.x.x.80 > y.y.y.y.4803: . ack 507 win 1728

So my question is:
What is going on here? I get quite a lot of these ACK RST packets logdropped in
my logs, so it's not a crack attempt or something.

Why is a client sending 6 or more simultaneous connection requests (3), is
then not able to ACK my SYN/ACK (as you can see the SYN/ACK is resend several
times), but is able to send a ACK/RST (1 and 2)?

The apache logs tell me, that this happens with firefox as well as IE. I don't have
a significant fraction of linux clients (below 1% is using linux); so an idea was, that
it has something to do with this grant idea MS had, to limit the number of halfopen
connections Windows XP SP2 can have. So if the client is using some sort of download
accelerator and this download accelerator is opening many connections at once, windows
might not accept my SYN/ACK. But that's just an idea and I tell you because I don't
have any other idea for this.

That is the strange thing about the client, but there is also my server. As you can
see in (2) my server is still sending SYN/ACK although it already received a RST.
Why is this happening?

Quite a long mail. Sorry for that. Can anybody confirm this or tell me something about
it? I searched the archive of this list as well as the net, but didn't find a satisfying
answer.

So thanks in advance for every hint. If you want more info, please tell me.

Sebastian Ewert


