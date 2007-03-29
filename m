From: Martijn Lievaart <m@rtij.nl>
Subject: Re: nubee ++ using iptables to block bit torrent ..
Date: Fri, 30 Mar 2007 01:12:05 +0200
Message-ID: <460C47C5.1020104@rtij.nl>
References: <30200a940703270610u2d75f17cra4620615ea53a388@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <30200a940703270610u2d75f17cra4620615ea53a388@mail.gmail.com>
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
To: Gregory Machin <gregory.machin@gmail.com>
Cc: netfilter@lists.netfilter.org

Gregory Machin wrote:
> Hi
> I have a routing / firewall box that provides routing for the lan, dmz
> some routed vpn, and the internet..
>
> I have been asked to block all traffice going from that lan,then give
> limited ip's full access to the internet and other limited access, via
> certian ports for say mail and http..
>
> and this seems to be working fine, execpt that, bit torrent and msn
> and google talk seem the be slipping by ...
>
> by my understanding everything should be locked down ... appart from
> the http/s going via squid, which i'll tackel next ..

That's your problem. MSN, Kazaa, whatever, all tunnel over port 80 if no 
other means to communicate is found (i.e. direct ports open). You need 
content inspection to block that.

HTH,
M4


