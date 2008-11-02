From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Sun, 02 Nov 2008 13:06:09 -0600
Message-ID: <490DFA21.3050906@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <013f01c93d0c$f4a47410$dded5c30$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/2/2008 11:03 AM, Rob Sterenborg wrote:
> 192.168.x.x is private space IP. You cannot route private space IP's 
> on the internet: you need NAT to give internet access to your clients 
> (or a proxy if you only need protocols for which proxies are 
> available). This can be done with SNAT, MASQUARADE (some people need 
> this instead of SNAT) and I've read somewhere it can also be done 
> using "ip" but I'm not familiar doing that.

You have to have some form of NAT for the aforementioned reason. 
However it is possible to do this on a layer 2 device via EBTables / 
IPTables with bridged netfilter traffic enabled.

It is my (mis)understanding that Cisco PIX /Firewalls/ (All /PIX/es are 
firewalls NOT routers) do the ""routing with the layer 2 NATing and thus 
appearing as routers.

In essence from L2 you watch for any traffic coming from the L3 IP 
address space in question and then NAT the L3 addresses with (on L2) to 
be the actual L3 address you want to appear as.  The same thing happens 
in reverse and you tend to have what appears to be a L3 ""router, but in 
actuality it's purely an L2 device pretending to be / doing the function 
of an L3 router.

(Though at this point it is debatable what it actually is.  I choose to 
say it's an L2 device b/c it operates on L2 and looks to higher layers 
in the stack where as normal L3 routers operate on L3 and /may/ look 
down if at all.)

IPTables uses what is considered /stateful/ NAT.  Remember when IPTables 
introduced connection tracking and the state match extension in 2.4 
years ago?  Previously IPChains did not have such state.  The (older ?) 
installs of the IP (ip) command could do /stateless/ NAT.  I say older 
because I'm not sure that the stateless NAT provided by IP exists any 
more. ... (checking) ...  According to the IP man page, stateless NAT is 
no longer supported:  "Warning: Route NAT is no longer supported in 
Linux 2.6."



Grant. . . .
