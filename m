From: Jason Opperisano <opie@817west.com>
Subject: Re: block broadcast traffic
Date: Fri, 04 Mar 2005 10:24:04 -0500
Message-ID: <1109949844.4617.9.camel@hubcap.ljm.dom>
References: <42272AEA.50008@noaa.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42272AEA.50008@noaa.gov>
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

On Thu, 2005-03-03 at 10:19, George Liu wrote:
> I tried to use iptables to block inbound and outbound netbios broadcast 
> announcement traffic of a system with IP 10.1.1.76. It seems iptables 
> doesn't work. 

i'm pretty sure iptables works...maybe just for me though.

are you applying these rules *on* 10.1.1.76 in an attempt to keep it
from sending/receiving netbios packets; or is 10.1.1.76 remote to this
machine with the firewall rules?

if it's the first case--you need to be modifying INPUT and OUTPUT, not
INPUT and FORWARD...(in any case--broadcast packets are not normally
forwarded through routing gateways anyways...)

> Is this a limitation or rule wrong? Thanks.
> 
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :RH-Firewall-1-INPUT - [0:0]
> -A INPUT -j RH-Firewall-1-INPUT
> -A FORWARD -j RH-Firewall-1-INPUT
> 
> -A RH-Firewall-1-INPUT -s 10.1.1.0/22 -p udp -m multiport --ports 
> 135,136,237,138,139,445 -j REJECT
> -A RH-Firewall-1-INPUT -d 10.1.1.0/22 -p udp -m multiport --ports 
> 135,136,237,138,139,445 -j REJECT
> -A RH-Firewall-1-INPUT -p udp -m multiport --ports 
> 135,136,237,138,139,445 -j REJECT

ports 135, 139, and 445 in the context of a microsoft network use TCP,
not UDP; and are unicast, not broadcast based.

the UDP ports used for name and service broadcasts are UDP 137 and 138,
not 237 and 138...

-j

--
"Call this an unfair generalization if you must, but old people are
 no good at everything."
	--The Simpsons


