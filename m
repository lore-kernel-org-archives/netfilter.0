From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: nmap protection rules
Date: Thu, 30 Dec 2004 07:18:28 -0500
Message-ID: <1104409107.2011.119.camel@grendel>
References: <41D2F4DE.11586.29F761B5@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41D2F4DE.11586.29F761B5@localhost>
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
To: jagrelo@novadevices.com
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-12-29 at 18:18, Jorge Agrelo wrote:
> Does anyone can help me to write iptables rules to?:
> 
> * block IP protocol scans (nmap -sO)

When performing a protocol scan, nmap sends an IP packet with no
transport header. So for example to check for AH support, byte 9 in the
IP header is set to "51" but no AH header is included in the packet. The
concept is a system which supports AH will ignore the packet and not
respond. A system that does not support AH will return an ICMP type 3
code 2 (protocol unreachable).

So, provided your iptables default policy is "deny all", you should be
fine.

> * block UDP scans (nmap -sU)

nmap spews out packets to multiple UDP ports. This time it looks for
returning ICMP type 3 code 3 (port unreachable) packets to indicate
which ports are closed. Posts that do not respond are flagged as open.
Again, your best bet is a default "deny all" rule.

> * block identification via TCP/IP fingerprinting (nmap -O)

nmap needs access to one open TCP port, and both a closed TCP and UDP
port to perform a fingerprint attempt. Do not permit access to closed
ports on your system and you should be fine. Again, the default "deny
all" rule is your friend. Only let though the services you plan to
support.

HTH,
Chris



