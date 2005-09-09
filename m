From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Route packets from an interface to another
Date: Fri, 9 Sep 2005 16:36:37 -0500
Message-ID: <200509091636.37287.rob0@gmx.co.uk>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
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
To: netfilter@lists.netfilter.org

On Friday 2005-September-09 14:51, Jonathan wrote:
> I think so. On box1 I type these commands:

You think so, what? Is there some way I should be able to tell what 
you're on about? Please, this top-posting makes it very difficult; show 
some consideration for your readers.

> >> > On 9/9/05, Jonathan <phonic@antisocial.nu> wrote:
> >> >> I have the following interface configuration on two boxes:
> >> >> box1: eth0:5 192.121.234.213 netmask 255.255.255.240 broadcast
> 192.121.234.223
>
> >> >> box2: lo:0 192.121.234.213 netmask 255.255.255.255

lo:0 ?? Don't do this. Why are you trying to bind another IP to lo?

> >> >> between box1 and box2 I have a OpenVPN tunnel (endpoints
> >> >> 10.1.0.1 and 10.1.0.2).

Why these IP's? You could simplify by using the remote static IP as the 
IP for your home endpoint. IINM you wouldn't need NAT at all.

Remote eth0: 192.121.234.212 netmask 255.255.255.240
Remote tun0: 192.121.234.212 netmask 255.255.255.240
Home tun0 192.121.234.213 netmask 255.255.255.240

When something comes in on eth0 with a destination IP of 
192.121.234.213, your kernel knows it needs to go out tun0. If routing 
is enabled and nothing blocking it in table filter chain FORWARD, out 
it goes.

What you are talking about is indeed possible. I did it myself before 
figuring out the better way of doing it. :) You need to do both SNAT 
and DNAT.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

