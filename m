From: Matthew Pocock <matthew.pocock@ncl.ac.uk>
Subject: Re: bootpc
Date: Fri, 06 Jun 2003 10:26:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE05E4B.7040007@ncl.ac.uk>
References: <3EDF2F41.8080505@ncl.ac.uk> <200306052135.55070.pc-secure@home.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306052135.55070.pc-secure@home.nl>
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
To: Pascal Italiaander <pc-secure@home.nl>
Cc: netfilter@lists.netfilter.org

Thanks Pascal,

I think the PCs here 'discover' the DNS servers. This makes it tricky to 
have a DHCP_SERVER variable in the iptables script. I'm wondering if on 
boot, the pc sends out a broadcast for DHCP servers, and one (or more) 
responds on port 68:69, but that the STATE module doesn't associate the 
response with the broadcast.

Time to read more about dhcp.

Matthew

>I'ts possible ,but a connection orriginating from the outside to boot internal 
>your PC , no way. ??  Request for a DHCP should be orriginating from the 
>inside. (your win95 +98). and reply should come from the outside.
>
>No, you don't have to load a module.
>
>but your very warm, there should be a rule to track these connections.
>example:
>
>DHCP_SERVER"211.124.45.2"
>
>${IPTABLES} -A OUTPUT  -p udp -s 0/0 -d ${DHCP_SERVER} --sport 68 --dport 67 \ 
>-m state --state NEW -j ACCEPT
>
>${IPTABLES} -A INPUT  -p udp -s 0/0 -s ${DHCP_SERVER} --sport 67 --dport 68  \ 
>-m state --state ESTABLISHED,RELATED -j ACCEPT
>
>hmm.. silly NO , silly are the people who don't ask , but just do.
>
>Pascal
>
>
>
>
>
>
>  
>



