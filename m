From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 16:10:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c260fa$f0b68860$0801a8c0@s3ac>
References: <20020920224321.VUFI295.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20020920224321.VUFI295.mta06-svc.ntlworld.com@there>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org




> > Just when I thought I understood. So returning masqaraded 
> traffic hits 
> > the input rule set no ?
> 
> No :-)

Dooope !!

> 
> > Then gets routed through POSTROUTING
> 
> No :-)

Doooope !!!
> 
> > is it then routed to the forward ruleset, or is it just sent out.
> 
> Okay - this is how it works:
> 
> The *original* packet (the first one) in what is going to be a natted 
> connection gets to the firewall, enters the PREROUTING chain, and the 
> destination address gets changed.   The packet then goes on 
> to the FORWARD

So it gets nated at the PREROUTING chain oooooooohhhhhhhh ...
> 1. The INPUT chain is *only* for packets which terminate on 
> this machine.
> 
> 2. The FORWARD chain is *only* for packets which are going 
> through this 
> machine.
> 
> 3. The OUTPUT chain is *only* for packets which originate on 
> this machine.


Ooooooooooooohhhhhhhhhhhhhhhhhhhhhhhhh !!

> 
> > Then figure out why exactly my local net machines are accessing my 
> > external IP to exit the net. This confuses me because all these 
> > machines are setup with the gateway being the internal ip
> > (192.168.1.1/255.255.255.0) as the gateway so these 
> machines shouldn't 
> > even know my external ip/interface exists.
> 
> You have physically plugged the internal and external 
> interfaces of your 
> firewall into the same switch / hub, therefore the machines 
> on your internal 
> network are plugged into your external interface, and 
> unfortunately Linux 
> responds to ARP requests in ways you might not expect....  (I 
> think Tom 
> Eastep mentioned this in an earlier posting).
> 
> Connect your external interface to your Internet link, using 
> a switch / hub 
> which also has any other machines with true (non-nat) public IPs.

Oohh ok .. Well

Thank you thank you thank you thank you thank you, for your time I
appreciate that .. Domo arigato genious san.

<action> 
Goes back to my mlafunctioned misconfigured linux box 
</action>


