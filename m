From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: What ICMP packets does state RELATED allow?
Date: Thu, 6 Jun 2002 13:34:51 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020606173451.GA1551@cannon.eng.us.uu.net>
References: <Pine.LNX.4.33.0206061348270.2335-100000@blackhole.kfki.hu> <NJEFLNJDIFFNMHDEBKMJAEFPDOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJAEFPDOAA.jpatterson@asgardgroup.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Patterson <jpatterson@asgardgroup.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

On Thu, Jun 06, 2002 at 09:55:09AM -0400, Joe Patterson wrote:

> That's interesting...  I guess it could make sense... sort of...
> 
> but, to be really obnoxious about it, I would think it would make sense to
> have rules such as:
> 
> for IF in `ifconfig | cut -d " " -f 1 | grep -v ^$`; do
> 	$IPT -A INPUT -p icmp --icmp-type 5 -m state --state RELATED -i $IF -s `ip
> addr ls dev $IF | grep inet | cut -d " " -f 6` -j ACCEPT
> done
> 
> and
> 
> $IPT -A FORWARD -p icmp --icmp-type 5 -j DROP
> 
> on the basis of my belief that you should never ever have a redirect
> crossing a router, but you *may* want to accept redirects from local
> gateways...
> 
> Any thoughts?

You're absolutely right. An ICMP redirect is sent from one interface
to another interface on the _same_ subnet. In some ways it should be
seen as something like an ARP which has a layer 2 significance. However,
proxying ARP make sense but proxying (or forwarding in general) of an
ICMP redirect does not make sense at all. Whether it could be seen as
RELATED or not is sort of philosophical matter as ICMP redirect is meant
to _notify_ a forwarding entity of the existence of a better next-hop on
the _same_ subnet. So, is this kind of thing RELATED? Yes, in the sense
that it is caused by the forwarding of _that_ packet and no, in the sense
that the same redirect could get triggered by lots of other non related
conn's and besides ignoring these redirects would not harm the communication
at all.

Ramin

> 
> -Joe

