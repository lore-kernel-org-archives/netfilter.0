From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: bootpc
Date: Fri, 6 Jun 2003 12:20:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306061220.57477.pc-secure@home.nl>
References: <3EDF2F41.8080505@ncl.ac.uk> <200306052135.55070.pc-secure@home.nl> <3EE05E4B.7040007@ncl.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EE05E4B.7040007@ncl.ac.uk>
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
To: Matthew Pocock <matthew.pocock@ncl.ac.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>


Sorry to disappoint you , but your comment was that you needed to open port 
boops and bootpc , these protocols are only used for dhcp_discover and reply.
That's why I comment that it should be intiated from inside not from outside.

discover inside (win95 +98 )  , and reply back from outside.

Since you use a bridge you, filtering will be done only on  1 interface. 
the rule a made is based on that.

peronaly I use OpenBSD as Bridge and Iptables for a Router/firewall behind it, 
more stable and has better filtering for bridges,but again this is my 
personal flavour.
 
And  'discover'  for DNS-server should be port 53 .

view the /etc/services;      less /etc/services


Pascal

> I think the PCs here 'discover' the DNS servers. This makes it tricky to
> have a DHCP_SERVER variable in the iptables script. I'm wondering if on
> boot, the pc sends out a broadcast for DHCP servers, and one (or more)
> responds on port 68:69, but that the STATE module doesn't associate the
> response with the broadcast.
>
> Time to read more about dhcp.
>
> Matthew
>
> >I'ts possible ,but a connection orriginating from the outside to boot
> > internal your PC , no way. ??  Request for a DHCP should be orriginating
> > from the inside. (your win95 +98). and reply should come from the
> > outside.
> >
> >No, you don't have to load a module.
> >
> >but your very warm, there should be a rule to track these connections.
> >example:
> >
> >DHCP_SERVER"211.124.45.2"
> >
> >${IPTABLES} -A OUTPUT  -p udp -s 0/0 -d ${DHCP_SERVER} --sport 68 --dport
> > 67 \ -m state --state NEW -j ACCEPT
> >
> >${IPTABLES} -A INPUT  -p udp -s 0/0 -s ${DHCP_SERVER} --sport 67 --dport
> > 68  \ -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> >hmm.. silly NO , silly are the people who don't ask , but just do.
> >
> >Pascal


