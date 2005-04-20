From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 11:40:27 -0500
Message-ID: <426685FB.4040607@riverviewtech.net>
References: <1113994155.31280.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113994155.31280.29.camel@localhost.localdomain>
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
To: Anders Fugmann <afu@fugmann.net>
Cc: netfilter@lists.netfilter.org

I don't know of a way to lock IPTables rules in the kernel, but this is my take on what you wrote.

If you did lock IPTables rules in to the kernel the only way to work with them would be to modify the firewall script and reboot the box (which is trivial if you gain root to a box).  This does little more than make it a pain and could easily be scripted.

This is really the reason that firewalls / routers are suppose to be standalone boxen.  The idea behind this is to not run any service(s) on a firewall / router that could be exploitable.  If you do want to have your firewall / router offer services to the world port forward any requests that you want to serve to a system behind the firewll / router in the DMZ which is in and of it's self firewalled from the rest of the network, this prevents this system from having access to the internal LAN if it is breached its self.  By doing this the firewall / router it's self is not offering any exploitable services to the world and thus can not be hacked in to via standard methods.

One solution that sort of applies, in such that it is impossible to modify a running firewall / router, is to run the firewall / router in runlevel 0.  Granted you could not use such a system as a standard server if you did this but it would allow the firewall to be running in production in such a way that it could not be modified or even accessed in any way shape or form remotely.  You would end up havening to reboot the box and send it in to Single user mode to work with things.  I personally have never done this as I have never felt the need to be that paranoid about my firewalls.  Typicaly I will run a firewall with no services listening on the internet side of the box and just SSH listening on the internal side.  If I am even more paranoid I will put the firewall / router physically close to another server and run a serial cable from the server that does have remote access (SSH) to 
 the firewall / router and do everything via serial console.  By using a serial console on
 the router and no services listening on any interface it is virtually impossibly (as far as I'm aware of) to connect to the box and modify any thing.

Honestly in my (humble) opinion go spend $50 on a used system (if you don't have one) drop a couple of NICs in it and set it up as your firewall and port forward the traffic that you want to serve to the world to it.

As far as a way to lock rules in to the kernel I don't know that there is a way to do so nor do I think there should be a way as it would do nothing but slightly (2 - 10 minutes) slow down a good cracker.  Sure it might stop some script kiddies, but if a cracker can do it they can script it too, hens the latter problem.



Grant. . . .

