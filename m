From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Kernel IPSec, routing, iptables and ebtables.
Date: Thu, 17 Jun 2004 12:05:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406171205.44176.gdh@acentral.co.uk>
References: <200406170852.08831.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406170852.08831.gdh@acentral.co.uk>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 17 June 2004 08:52, Gavin Hamill wrote:
> Hello :)

Just a followup, I got the problem half-solved...

The new incantation is:

/sbin/ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-dst 213.2.4.32/27 -j 
redirect --redirect-target DROP

The purpose of this line is to forcibly ROUTE anything destined for the remote 
LAN rather than just letting the kernel bridge it.

I still have a problem where by traceroute across the IPSec tunnel fails, but 
I have more tests to run. In the meantime, UDP, TCP and ICMP traffic all 
traverses correctly in encrypted format - hurrah! :)

Cheers,
Gavin.

