From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Best vpn w/ iptables.
Date: Sat, 21 Dec 2002 10:58:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E043B2B.70306@istitutocolli.org>
References: <001201c2a84c$7ec0a350$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c2a84c$7ec0a350$6601a8c0@s3ac>
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

Starting from kernel 2.5.49 IPSec went into the tree: if you need 
encryption and authentication that could be a solution (probably better 
than freeswan, since the later was not considered for inclusion into the 
kernel). I don't need them, so I'm sticking with plain gre tunnels and 
linux-2.4.20

for more information on tunnels and vpn you may have a look at 
http://lartc.org (linux advanced routing and traffic control) and ask in 
their meailing list.
The howto explains in details how to setup a secure vpn using the kernel 
support.
hope this can help.

andrea

Rowan Reid wrote:
> 
> I'm gonna be implimenting a VPN between two offices. Both gateways being
> the Firewall also. Which uses Netfilter I'm looking for secure straight
> forward routable setup and 100% compatability with netfilter ie not
> pptp. It also has to be open source. I know this isn't a vpn group but I
> figured you would have valuable input. Thanks Right now I'm looking at
> freeswan
> 
> 
>  
> Rowan Reid
> Job Captain, 
> Systems Administrator
> STUDIO 3 ARCHITECTS
> 909  982  1717
> 
> 
> 
> 


