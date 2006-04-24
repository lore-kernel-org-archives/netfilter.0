From: Curby <curby.public@gmail.com>
Subject: Re: about dettecting different TTL value
Date: Mon, 24 Apr 2006 03:44:46 -0600
Message-ID: <5d2f37910604240244r3aa5980ere262fa2e766a42c8@mail.gmail.com>
References: <1161.202.22.193.97.1145853396.squirrel@202.22.193.97>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1161.202.22.193.97.1145853396.squirrel@202.22.193.97>
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
To: "isp@cgscomm.net" <isp@cgscomm.net>
Cc: netfilter@lists.netfilter.org

On 4/23/06, isp@cgscomm.net <isp@cgscomm.net> wrote:
> Hello,
>
> I am new here. I am working in an ISP. I like to know that how can I
> prevent user to use multiple computer with single internet connection? I
> have searched on the web and found nothing.
>
> I think it is only possible by detecting different TTL value that comes
> from same IP address. And I didn't get any thing from the web. I like to
> know that is it possible to do with IPTABLES?

It is possible but a flawed solution for several reasons:

1) You can use an iptables patch to mangle/reset the TTL of all
outgoing packets (even those of NATed machines), rendering such a
check useless.

2) Your subscribers could spoof packets with varying TTL values to get
other subscribers in trouble.

3) There are cases where a single computer would send outgoing packets
with varying TTL values: traceroutes, sensitive/custom protocols, etc.

Regarding the "problem" itself, remember that increasingly, more and
more households will have wireless laptops in addition to desktop
computers, separate computers for children, networked gaming consoles,
etc.  IMHO it would be preferable to adjust your pricing so you are
profitable instead of cutting off an ever-growing demographic of
multi-machine households.

--Curby

