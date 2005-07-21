From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: RST packets
Date: Thu, 21 Jul 2005 09:42:10 +0200 (CEST)
Message-ID: <3565.161.85.127.140.1121931730.squirrel@161.85.127.140>
References: <Pine.LNX.4.61.0507210838001.19151@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507210838001.19151@yvahk01.tjqt.qr>
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
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

> |Sometimes, if either hosts need to tear down the connection quickly
> (timeout,
> |port or host unreachable, etc.), a RST (Reset) packet is sent. Note th=
at
> |since a RST packet is not necessarily always part of a TCP connection,=
 it
> can be
> |sent by itself. RST packets that are part of a TCP connection is usual=
ly
> |accompanied by the ACK flag as well.
>
> What would be the use of RST if it is not part of a connection?
> Is it...vv?
>   A and B are connected
>   A crashes
>   B tries to send
>   A sends RST,!ACK

Your scenario seems clear to me.. ;-)

If A crashes, to A there is no connection anymore.
If B sends data to A and A thinks no SYN/ACK has occurred for that
connection, IMHO A should send RST without ACK because according to A
there _is_ no connection to send ACK for.
Anyway, I didn't test it but it would make sense to me.


Gr,
Rob



