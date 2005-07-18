From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: RST packets
Date: Mon, 18 Jul 2005 16:12:53 +0200 (CEST)
Message-ID: <3544.217.166.67.34.1121695973.squirrel@217.166.67.34>
References: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
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

> Hi,
>
>
> a simple question, though I could not clearly read it from the TCP RFC.=
..
> do RST packets always have ACK set?

It seems that isn't so :

(http://www.knowplace.org/netfilter/ip_overview.html)

Resetting a connection

The four-way handshake is not the only way to tear down an established TC=
P
connection. Sometimes, if either hosts need to tear down the connection
quickly (timeout, port or host unreachable, etc.), a RST (Reset) packet i=
s
sent. Note that since a RST packet is not necessarily always part of a TC=
P
connection, it can be sent by itself. RST packets that are part of a TCP
connection is usually accompanied by the ACK flag as well.

Note that RST packets are not acknowledged.



Gr,
Rob



