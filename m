From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Why would anyone want to SNAT a remote connection to the
	external ip address?
Date: Mon, 7 Mar 2005 09:04:55 +0000
Message-ID: <200503070904.56038.gdh@acentral.co.uk>
References: <20050307014917.28759.qmail@web30505.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050307014917.28759.qmail@web30505.mail.mud.yahoo.com>
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

On Monday 07 March 2005 01:49, P Moyst wrote:
> Hi

Hello Mr. Moyst! That's not something I get the chance to say in public very 
often =)


> $iptables -t nat -A POSTROUTING -o eth1 -j SNAT
> --to-source $external_ip
>
> where... eth1 is the interface on the linux box for
> the internal network and eth0 is the interface for the
> internet.
>
> What is the reason for this?

As with any more complex network, there are always ways and reasons for weird 
stuff like this...

e.g. the iptables machine might be doing IP-Masq on one interface, but require 
anything going out on eth1 to have the source address rewritten to a 
completely different IP address (one perhaps which will get routed 
differently on the inbound return-path by another router)... 

Or more simply perhaps if this rewriting was not done, then the return-address 
would be that of the iptables machine which may not be desirable :)

A general question gets a general answer =)

Cheers,
Gavin.

