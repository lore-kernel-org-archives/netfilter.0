From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 09:16:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C86D4C.20101@pbl.ca>
References: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Peter Marshall wrote:
> Hi guys,
> 
> I am sure someone has been faced with this problem, and I was just wondering
> what the possible solutions are.  A city wide free wireless network has just
> expanded to cover the area encompassing our building.  The provider of this
> is also the provider of our Internet (via fiber).  It was decided that it
> would be advantageous for some of our employees to be able to use this
> wireless network when we bring in clients etc.  This of course opens a large
> possibility of problems concerning crap getting onto our network (especially
> if they are connected to wireless and plugged into the network).
> 
> We have made it a policy that a personal firewall be installed on all
> firewalls, and that at no time is a wireless card to be plugged into a
> laptop while connected to our LAN.  This of course does not do much for
> internal cards ....
> 
> Is there anyway at all that I can firewall this ?  Or is there a way o
> prevent the two networks from being active at the same time .. I am at a bit
> of a loss here.

I guess that machines that will be plugged to both wired and wireless 
networks are going to be Windows boxes?  I'm affraid you can't do much 
more that you already did.  Turn off IP forwarding in each of those 
Windows boxes (so they can't route traffic into your network), and turn 
on firewall on wireless interface.  Depending on how are those Windows 
boxes managed, you should be able to make policies that will prevent 
users from changing those settings.  But still, computers with wireless 
access will be the very weak spot on your network (for example, they 
will bypass any anti-virus you might have installed centrally).  IMHO, 
from security point of view, allowing such wireless access is very bad 
idea.  I'd probably put all those clients on separate physical network 
behind firewall, and would trust that network the same as I trust Internet.

If they must have wireless access, build your own wireless network that 
you controll.  If they must use public wireless network, put a wireless 
card in the firewall and remove wireless cards from the clients.  If 
they need both, make a combination of this two.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

