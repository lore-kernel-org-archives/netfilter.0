From: Ard van Breemen <ard@telegraafnet.nl>
Subject: Re: Too many ARP entries and Re: sendto: No buffer space available
Date: Wed, 4 Dec 2002 16:23:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021204152320.GE23341@telegraafnet.nl>
References: <571705138.20021202111645@pobox.com> <14127620470.20021202182836@pobox.com> <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net> <875890239.20021203122724@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <875890239.20021203122724@pobox.com>
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
Content-Transfer-Encoding: 7bit
To: Andre Docena Correa <andre.docena@pobox.com>
Cc: Cedric Blancher <blancher@cartel-securite.fr>, netfilter@lists.netfilter.org

On Tue, Dec 03, 2002 at 12:27:24PM -0200, andre.correa@pobox.com wrote:
> We   see   my   linux  box  asking  for MAC addresses of hosts outside
> its "local" network and my gateway, a Cisco 2621 answering those
> broadcasts with its own MAC address.
> 
> For  what  I know, both are doing wrong. My box is not supposed to ask
> for those MACs and the Cisco is not supposed to answer.
Your cisco is configured to do proxy-arp. This might be a policy
decision. I have proxy-arp on, because I have very small subnets,
but pretend to be a /24 to the customers. Nobody notices it.

The only fault in your setup is that you probably have:
ip route add default dev <internetdev>

Be aware that ip route show might not show you the details.
If you do for example this:
ip route add 172.16.0.1/32 dev eth0
ip route add default via 172.16.0.1
ip route del 172.16.0.1/32 dev eth0
you would see a natural "gatewayed" route, but with something
peculiar: 172.16.0.1 was local at the time of addition, so it
will send everything to the interface as local traffic, not
gatewayed!

route -n will tell you the real routing. Eh, but only for the
main routing table... :-).
Anyway: fix your default gateway.
-- 
procedure signature;
begin  { telegraaf.com
} writeln('<ard@telegraafnet.nl> SMA-IS | Geeks don't get viruses');
end

