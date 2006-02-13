From: David Vogt <mail@davidvogt.de>
Subject: Re: state new with SYN not set
Date: Mon, 13 Feb 2006 15:29:42 +0100
Message-ID: <859616420602130629m1ad6aeb9m@mail.gmail.com>
References: <43F050AA.3050602@krediidiinfo.ee>
	<80d7e4090602130454l41a7eb03pef73e7f49ef21916@mail.gmail.com>
	<43F0950F.4060304@krediidiinfo.ee>
Reply-To: David Vogt <mail@davidvogt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43F0950F.4060304@krediidiinfo.ee>
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
To: Aleksander <aleksander@krediidiinfo.ee>
Cc: netfilter@lists.netfilter.org

Maybe there is a problem with the network hardware? I don't really
know a lot about iptables, just crossed my mind while reading this.

David

2006/2/13, Aleksander <aleksander@krediidiinfo.ee>:
> Stephen J. Smoogen wrote:
>
> >Many times this is because of late packets getting to your server. It
> >might be because the server has finished the session (it saw a FIN or
> >RST on its side) and so has closed down the session.. or it might be
> >that the client didn't get the servers RST/FIN and is sending a second
> >ACK/PSH/FIN to make sure the session is closed.
> >
> >There are probably other reasons for this, but this has been my
> >biggest number. There are some probe tools that just send ACK-PSH-FIN
> >packets to see what they get back from firewalls.
> >
> >
> >
> >--
> >Stephen J Smoogen.
> >CSIRT/Linux System Administrator
> >
> Thanks for the explanation!
>
> I got another one:
> Feb 13 15:39:10 myyr kernel: BAD PACKET syn+ack: IN=3Deth0 OUT=3Deth1
> SRC=3D192.168.111.34 DST=3D1.2.3.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D=
63 ID=3D0 DF
> PROTO=3DTCP SPT=3D80 DPT=3D4081 WINDOW=3D5840 RES=3D0x00 ACK SYN URGP=3D0
>
>  From my web server to a client, matched from:
> ${IPTABLES} -t filter -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK
> SYN,ACK -m state --state NEW -j DROP
>
> I guess this can be ignored as well, it's just that it's originating
> from my web server on the LAN. I can't imagine any packets being caught
> by the firewall but then being lost on the way to the webserver. It's a
> decent 100Mbit link with only one switch on the way. There's not much
> network load either.
>
> Alex
>
>

