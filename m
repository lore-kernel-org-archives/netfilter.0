From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: FORWARDING and NAT chains
Date: Fri, 30 Jan 2004 07:23:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075465401.1860.4.camel@jasiiitosh.nexusmgmt.com>
References: <001901c3e670$a4bd2250$3d40000a@wisdom>
	 <200401301025.17981.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401301025.17981.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-01-30 at 05:25, Antony Stone wrote:
> On Thursday 29 January 2004 2:02 pm, Srinivasa Hebbar wrote:
> 
> > Hello,
> >
> > I believe that the NAT PREROUTING and POSTROUTING will
> > always takes place for all the incoming/outgoing packets
> > irrespective of whether the packet is destined to the node or not.
> >
> > I have a situvation that if the dest. IP address of the packet is
> > for the local node, then apply NAT rule, otherwise it should simply
> > forward the packet according to the routing table.
> >
> > How can I achive the above?
> 
> Place the destination address in the nat rule, eg:
> 
> iptables -A PREROUTING -t nat -d ! my.ip.add.ress -j DNAT --to a.b.c.d
> 
> This means "destination nat all packets which are not addressed to 
> my.ip.add.ress and send them to a.b.c.d".
> 
> Regards,
> 
> Antony.
This is true but she went on to state in a later e-mail that she has
many interfaces and needs to exclude two.  That's a knarly problem I've
run into many times with the limitation of only being able to specify a
single address/subnet (or a contiguous range with iprange) in
destination and source.  

I suggested using a RETURN target to bypass processing for the two
excluded interfaces although I was surprised to not find RETURN in my
man page. I hope I wasn't having a premature senior moment when I
recalled the RETURN target! Thanks - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


