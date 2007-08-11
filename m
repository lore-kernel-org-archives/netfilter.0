From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: ip_conntrack growing indefinitely
Date: Sat, 11 Aug 2007 11:19:08 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0708111115530.25740@mail3.jubileegroup.co.uk>
References: <200708110801.l7B81Oj2025252@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200708110801.l7B81Oj2025252@mail3.jubileegroup.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

On Sat, 11 Aug 2007 fd4 wrote:

> > For now it has been patched setting ip_conntrack_max to 65536 but
> > connections still grow indefinitely (seems NAT never drops old
> > connections). Any idea of the reasons? Could be related with the
> > kernel version (2 years old) we're running?
>
> I've a similar phenomen using kernel 2.6.18-4-vserver-686 :
> conntrack -L|wc -l
> 3340
> nearly all started at a similar time from two ports to random
>
> example iptstate:
> Source Destination   Proto  State       TTL
> 1.2.3.4:42573 1.2.3.4:842 tcp ESTABLISHED 10:44:43
> 1.2.3.4:42574 1.2.3.4:1501 tcp ESTABLISHED 10:43:51
> 1.2.3.4:42573 1.2.3.4:1392 tcp ESTABLISHED 10:43:20
>
> well :- on my wish list now something like that:
> conntrack -D -s 1.2.3.4 -d 1.2.3.4 -p tcp --orig-port-src 42573 --orig-port-dst *

I don't think it grows indefinitely.  The timeout is five days.

http://lists.netfilter.org/pipermail/netfilter-devel/2005-June/020081.html

--

73,
Ged.

