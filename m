From: Patrick Turley <pturley@rocksteady.com>
Subject: Re: mac-source matching
Date: Mon, 26 Apr 2004 13:45:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408D58B2.1040201@rocksteady.com>
References: <1083003321.408d51b9cea5e@webmail.bme.med.ualberta.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083003321.408d51b9cea5e@webmail.bme.med.ualberta.ca>
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
To: netfilter@lists.netfilter.org

Beau Sapach wrote:
> Hello everyone,
> 
> I have a system running redhat with kernel 2.4.26 and iptables 1.2.1a that is a 
> routing firewall.  If I use the mac-source extension to match packets from the 
> internal network (a workstation for which this system is the gateway) it works 
> fine, but it won't match packets originating from the outside world.  The rule 
> I use is this:
> 
> iptables -A FORWARD -m mac --mac-source 00:00:00:00:00:00 -j ACCEPT
> 
> It could be me, I may be completely misunderstanding how this is supposed to 
> work.  I am by no means a guru.... any help would be appreciated, thanks!

Please excuse me if I've misunderstood what you're doing, but this is 
what occurs to me first...

You say that your machine is running a firewall? That means it's 
filtering traffic arriving from the outside world, which I presume means 
that it's connected to a cable modem/DSL/T-1/etc.

MAC addresses (almost) never survive more than one hop. If a packet is 
traveling to your LAN from a server on the other side of the country, 
the MAC address of that server will never be observed at your firewall. 
In fact, it's probably the case that *ALL* the packets arriving at your 
firewall have the same source MAC address - the MAC address of the first 
router upstream from you.

So, it's certainly possible for your firewall to match incoming traffic 
by MAC address, but it is also almost certainly useless to do so.

I hope that helps.

