From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: It seems I've found why conntrack blocks some packets
Date: Wed, 29 Mar 2006 21:13:54 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Carlos Pastorino <carlos.pastorino@gmail.com>, Steven M Campbell <Netfilter@scampbell.net>
Cc: netfilter@lists.netfilter.org

Are you by chance doing any rate limiting actions in your firewall or on
your box?  Is there any type of balanced connection in place?  Port
rewrites, etc?


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Carlos
Pastorino
Sent: Wednesday, March 29, 2006 9:06 PM
To: Steven M Campbell
Cc: netfilter@lists.netfilter.org
Subject: Re: It seems I've found why conntrack blocks some packets


The test showed that blocking pop-ups does not generate the desired
behavior, because the 3-way handshake completes normally, even for the
blocked pop-up.

So I dug a little deeper. I checked other connections from the same
customer, that were also around the same time. They didn't caught my
attention before because there were no packets blocked FROM the
webserver. The problem is, this shows that the problem can be in my
firewall after all. Here are the connections.

First, the blocked packets on the firewall:

Mar 28 14:46:50 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D26 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:46:56 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D26 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:47:08 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D26 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:47:32 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D26 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:48:20 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D26 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:57:34 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D26 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK RST URGP=3D0

and now the tcpdump on the webserver:

14:46:46.153552 customerip.2184 > webserverip.80: S [tcp sum ok]
290916053:290916053(0) win 65535 <mss 1460,nop,nop,sackOK> (DF) (ttl
120, id 41051, len 48)
14:46:46.153561 webserverip.80 > customerip.2184: S [tcp sum ok]
4139392508:4139392508(0) ack 290916054 win 5840 <mss
1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
14:46:50.527630 webserverip.80 > customerip.2184: S [tcp sum ok]
4139392508:4139392508(0) ack 290916054 win 5840 <mss
1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
14:46:56.527621 webserverip.80 > customerip.2184: S [tcp sum ok]
4139392508:4139392508(0) ack 290916054 win 5840 <mss
1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
14:47:08.527607 webserverip.80 > customerip.2184: S [tcp sum ok]
4139392508:4139392508(0) ack 290916054 win 5840 <mss
1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
14:47:32.727574 webserverip.80 > customerip.2184: S [tcp sum ok]
4139392508:4139392508(0) ack 290916054 win 5840 <mss
1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
14:48:20.927521 webserverip.80 > customerip.2184: S [tcp sum ok]
4139392508:4139392508(0) ack 290916054 win 5840 <mss
1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)

As you can see, here even the ACKs that were supposed to complete the
3-way handshake are getting blocked.

What could possibly be the reason for this?

Regards,

Carlos


