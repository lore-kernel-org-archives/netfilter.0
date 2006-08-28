From: "claudio987\@libero\.it" <claudio987@libero.it>
Subject: RE: Wol Magic Packets
Date: Mon, 28 Aug 2006 21:45:47 +0200
Message-ID: <J4Q48B$49CD3A0E96B6FF69053333AC1EFEF19C@libero.it>
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
To: netfilter <netfilter@lists.netfilter.org>

---------- Initial Header -----------

From      : netfilter-bounces@lists.netfilter.org
To          : "netfilter" netfilter@lists.netfilter.org
Cc          : 
Date      : Mon, 28 Aug 2006 18:25:41 +0200
Subject : RE: Wol Magic Packets







> "claudio987@libero.it" wrote:
> > Rob Sterenborg... Can you answer me please?
> 
> Ah, right. Last time you answered "ok, I'm sorry, I haven't red your
> message at all." so then I thought "what's the use to answer"..
> 
> If WOL packets really *do* enter your network then I don't know how to
> block them.
> 
> According to the AMD whitepaper a WOL packet is sent using a subnet
> directed broadcast to pass through routers. If you search around the
> internet, you find that directed broadcasts can be blocked by using:
> "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts".
> But, that's ICMP and UDP seems (commonly) to be used for WOL packets so=

> this would not help you.
> 
> 
> Gr,
> Rob
> 
> 
> 
packet enters only if I send it to a port opened into the router...: for =
example: if I forward port 30 tcp\udp to 192.168.0.2 (pc of my lan) and I=
 send a wol packet for another internet address out of my lan to poty 30 =
of external ppp0 interface of my router, pc 192.168.0.2 turns on=0A=0A=0A=
___________________________________________________________________=0APre=
stiti da 15 istituti. Tan dal 5,90% per richieste entro il 31 Agosto. Ser=
vizio gratuito.=0Ahttp://click.libero.it/mutuionline1=0A


