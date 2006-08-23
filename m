From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Wol Magic Packets
Date: Wed, 23 Aug 2006 12:13:16 +0200 (CEST)
Message-ID: <57711.193.173.147.3.1156327996.squirrel@webmail.sterenborg.info>
References: <J4G2J1$BB4B185575FB879FCE2663807D072D7A@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <J4G2J1$BB4B185575FB879FCE2663807D072D7A@libero.it>
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

On Wed, August 23, 2006 11:33, claudio987\@libero\.it wrote:
> exsists a module that can recognize Magic packet used in wake on lan?

No, not specifically.

> I'd like to drop Magic packets

According to http://en.wikipedia.org/wiki/Wake-on-LAN:
"The Magic Packet is a broadcast frame, transmitted over port 7 or 9. It =
can
be sent over a variety of connectionless protocols (UDP, IPX) but UDP is =
most
commonly used. The data that is contained in a Magic Packet is the define=
d
constant as represented in hexadecimal: FF FF FF FF FF FF followed by six=
teen
repetitions of the target computer's MAC address, possibly followed by a =
four
or six byte password."

Port 7/udp being echo and port 9/udp being discard, I don't see why you
couldn't block these ports.


Gr,
Rob



