From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: bootpc
Date: Thu, 5 Jun 2003 21:35:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306052135.55070.pc-secure@home.nl>
References: <3EDF2F41.8080505@ncl.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EDF2F41.8080505@ncl.ac.uk>
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

Op donderdag 5 juni 2003 13:53, schreef Matthew Pocock:
> Hi,
>
> I've set up my bridge+firewall, and everything is hunkeydory. I am doing
> statefull filtering. I let all traffic out, and all related/established
> traffic in. Then, I only allow new icmp & tcp:ssh connections in.
>
> To get windows 95 & 98 PCs on the inside to boot & join the network, I
> had to open up udp ports bootps & bootpc for new connections
> orriginating from the outside. I don't know the finer details about how
> these protocols work, but presumably they are connecting to the booting
> PC in response to some DHCP request it has made. Is there some module I
> should have loaded that would flag these connections as RELATED to some
> outgoing connection? Have I done something silly? Is this even possible?
>
> Thanks,
>
> Matthew

I'ts possible ,but a connection orriginating from the outside to boot internal 
your PC , no way. ??  Request for a DHCP should be orriginating from the 
inside. (your win95 +98). and reply should come from the outside.

No, you don't have to load a module.

but your very warm, there should be a rule to track these connections.
example:

DHCP_SERVER"211.124.45.2"

${IPTABLES} -A OUTPUT  -p udp -s 0/0 -d ${DHCP_SERVER} --sport 68 --dport 67 \ 
-m state --state NEW -j ACCEPT

${IPTABLES} -A INPUT  -p udp -s 0/0 -s ${DHCP_SERVER} --sport 67 --dport 68  \ 
-m state --state ESTABLISHED,RELATED -j ACCEPT

hmm.. silly NO , silly are the people who don't ask , but just do.

Pascal




