From: "Carlos Pastorino" <carlos.pastorino@gmail.com>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Thu, 30 Mar 2006 02:05:42 -0300
Message-ID: <cc4fcc140603292105q99f665r333be54098c943e0@mail.gmail.com>
References: <cc4fcc140603290545q1cfb7c82t6e91ca1801d2dad2@mail.gmail.com>
	<442A9103.10908@SCampbell.net>
	<d72fc30c0603290711t12927540o61a6eb7f74f6ef4d@mail.gmail.com>
	<442AA4F3.1000903@SCampbell.net>
	<cc4fcc140603291004x6e6c59f9xffb077538f053a05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc4fcc140603291004x6e6c59f9xffb077538f053a05@mail.gmail.com>
Content-Disposition: inline
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
To: Steven M Campbell <Netfilter@scampbell.net>
Cc: netfilter@lists.netfilter.org

On 3/29/06, Carlos Pastorino <carlos.pastorino@gmail.com> wrote:
> On 3/29/06, Steven M Campbell <Netfilter@scampbell.net> wrote:
> > Roger Hamilton wrote:
> > > On 29/03/06, Steven M Campbell <Netfilter@scampbell.net> wrote:
> > >> Carlos Pastorino wrote:
> > >>> Hi everyone,
> > >>>
> > >>> I always wondered why conntrack blocked some packets that were
> > >>> supposed to pass through my ESTABLISHED,RELATED rule. Now it seems
> > >>> that I've found the answer.
> > >>>
> > >>> Bear with me, because there will be questions in the end.
> > >>>
> > >>> So, what happens is: from time to time, I see my firewall blocking =
a
> > >>> packet like this:
> > >>>
> > >>> Mar 28 14:48:21 SRVA kernel: FORWARD blocked: IN=3Deth1 OUT=3Deth0
> > >>> SRC=3Dwebserverip DST=3Dcustomerip LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D63 ID=3D0
> > >>> DF PROTO=3DTCP SPT=3D80 DPT=3D10458 WINDOW=3D5840 RES=3D0x00 ACK SY=
N URGP=3D0
> > >>>
> > >>> Well, it does call my attention because it's a blocked packet FROM =
my
> > >>> webserver. In any case, it shouldn't be blocked, because the
> > >>> connection is not even 2 minutes old.
> > >>>
> > >>> But, on the webserver, I was running tcpdump this time, so I could =
see
> > >>> what really happened:
> > >>>
> > >>> 14:46:47.573738 customerip.10458 > webserverip.80: S [tcp sum ok]
> > >>> 23512000:23512000(0) win 65535 <mss 1460,nop,nop,sackOK> (DF) (ttl
> > >>> 120, id 41065, len 48)
> > >>> 14:46:47.573747 webserverip.80 > customerip.10458: S [tcp sum ok]
> > >>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
> > >>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> > >>> 14:46:51.327629 webserverip.80 > customerip.10458: S [tcp sum ok]
> > >>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
> > >>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> > >>> 14:46:57.327623 webserverip.80 > customerip.10458: S [tcp sum ok]
> > >>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
> > >>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> > >>> 14:47:09.327609 webserverip.80 > customerip.10458: S [tcp sum ok]
> > >>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
> > >>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> > >>> 14:47:33.527575 webserverip.80 > customerip.10458: S [tcp sum ok]
> > >>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
> > >>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> > >>> 14:47:34.216642 customerip.10458 > webserverip.80: R [tcp sum ok]
> > >>> 0:0(0) ack 0 win 0 (ttl 26, id 1, len 40)
> > >>> 14:48:21.727515 webserverip.80 > customerip.10458: S [tcp sum ok]
> > >>> 4131634297:4131634297(0) ack 23512001 win 5840 <mss
> > >>> 1460,nop,nop,sackOK> (DF) (ttl 64, id 0, len 48)
> > >>>
> > >>> As you can see, the customer connected with a SYN packet, and my
> > >>> webserver responded with 6 ACK/SYN packets. BUT, before the 6th
> > >>> ACK/SYN response, the customer sent an ACK/RST packet, resetting th=
e
> > >>> connection, and thus the 6th ACK/SYN packet was blocked by the
> > >>> firewall because the connection was no longer in the conntrack. Yes=
,
> > >>> clocks in the firewall and webserver are synchronized.
> > >>>
> > >>> Questions are:
> > >>>
> > >>> 1) Does anyone have seen this happening too?
> > >>>
> > >>> 2) How can I silently drop that package, without compromising the o=
n
> > >>> going connections? I would like to get rid of those "false positive=
s".
> > >>>
> > >>> Thanks,
> > >>>
> > >>> Carlos
> > >>>
> > >> The real question here is what bad thing happened in the the data st=
ream that the customer sent the reset packet?  The answer is not to ignore =
the reset but to find out why it is being sent, the client believes this co=
nnection should be aborted for some reason.
> > >>
> > >>
> > >>
> > > Doesn't this happen if the customer closes the browser/stops the web
> > > page loading before the page has completely loaded? If so then one wa=
y
> > > to ignore these packets is to silently drop ACK/SYN packets
> > > originating from port 80.
> >
> > The original arguement is that conntrack was blocking packets that it's=
 not supposed to block.  It certainly should block packets that are arrivin=
g on a terminated connection.  I don't believe the issue here has anything =
to do with connection tracking being faulty and workarounds to that effect =
are only hidng the real issue.  Why did the customer not see the ack packet=
s and finally send a rst?
> >
> >
>
> Well, actually, before I thought that iptables was blocking packets
> incorrectly that I believed were supposed to be allowed because of
> conntrack.
>
> Now I am sure that iptables is blocking them correctly, because the
> connection has been terminated.
>
> Steven, I have the same doubts as you do: why, in this case, the 3-way
> handshake did not complete?
>
> I mean "in this case" because I have more than 3,000 customers a day,
> and this happens for about 200 times every day.
>
> But Roger may be on to something here: my website has a pop-up. What
> if the customer's browser is configured to block pop-ups? I will
> configure my browser to block pop-ups and test it, and then I will let
> you know.
>
> Regards,
>
> Carlos
>

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
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D26=
 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:46:56 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D26=
 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:47:08 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D26=
 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:47:32 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D26=
 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:48:20 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D26=
 ID=3D1
PROTO=3DTCP SPT=3D2184 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK URGP=3D0
Mar 28 14:57:34 SRVA kernel: FORWARD blocked: IN=3Deth0 OUT=3Deth1
SRC=3Dcustomerip DST=3Dwebserverip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D26=
 ID=3D1
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

