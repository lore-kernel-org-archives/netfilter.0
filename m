From: "William L. Thomson Jr." <support@obsidian-studios.com>
Subject: Re: Translation from ipchains to iptables
Date: 10 Apr 2003 15:18:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050002281.900.72.camel@wlt.obsidian-studios.com>
References: <1049914757.1360.10.camel@wlt.obsidian-studios.com> 
	<1049953001.5544.205.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049953001.5544.205.camel@alpha.newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter <netfilter@lists.netfilter.org>

Joel,

On Thu, 2003-04-10 at 01:36, Joel Newkirk wrote:

> > ipchains -A forward -s 192.168.1.0/24 -j MASQ
> 
> The equivalent would be:
> 
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
> 
> but incurs the added overhead of checking the IP of the outbound
> interface all the time.  You can eliminate this by using a SNAT target
> instead, as in:
> 
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth1 -j SNAT --to
> 10.1.0.2

Correct me if I am wrong, but I believe I have to stick with the first.
Unless I can get away with the following?

iptables -t nat -A POSTROUTING -s 192.168.1.1/24 -o eth1 -j SNAT --to 10.1.0.99

Which for some reason I do not think will work? Or I seem to remember it
not working?

If I stick with the one you mentioned than every internal machine's ip
address will get natted to 10.1.0.2. Or the ip of the interface it's
traveling. Which will screw things up for the next hop, which is a
router doing PAT. Again.

In the example commands provided, I only showed one server. In reality I
have a few, and each server has two IP's.

So while there is added overhead, I think it is necessity for what I am
trying to accomplish.
 
> This one would need to be matched to the specific interface and IP you
> would be using for outbound traffic from the LAN, and replicated for
> each one if you use several.  

Maybe it will work since I am giving each interface many IP's. When I
did trial and error before, I do not think I was doing the ip addr
thing. So that could have been my problem with the above then.

> Reply traffic to a DNATted request will automatically be routed back out
> the incoming interface and un-DNATted, so it doesn't affect the
> SNAT/MASQUERADE of new connections initiated from the LAN.

Got it.

> Finally, to make it all come together, you should ACCEPT the traffic in
> FORWARD (ideally with a DROP policy to prevent other traffic, but that's
> not really pertinent to the DNAT traffic in this situation)

No, but should be a part of any standard firewall. First I want to get
things working. Then I will tighten up things. Although at this point
the traffic has already traversed a router, doing PAT. So while I am not
specifically denying requests on ports, you will get no response, and if
you talk to that port, you will only be talking to the router. Which
will not respond.

Thank you very much for your assistance.

It is greatly appreciated.

-- 
Sincerely,
William L. Thomson Jr.
Support Group
Obsidian-Studios, Inc.
3548 Jamestown Ln.
Jacksonville, FL 32223
Phone/Fax  904.260.2445
http://www.obsidian-studios.com


