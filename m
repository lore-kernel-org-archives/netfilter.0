From: David Collodel <dave@crawlspaceradio.com>
Subject: [Fwd: Re: DMZ trouble!]
Date: 09 Jan 2003 10:34:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042126468.1331.10.camel@jimmy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I wasn't sure how much of it would affect what would cause the problems,
so I included the whole thing minus some stuff like the module loading. 

I built this script based on a couple others I found through Google.
I've not yet figured out enough of IPTables to lock down the servers as
tightly as I'd like without breaking everything. I'm still relying on
local ipchains on each server to keep them safe until I get my head
around IPTables well enough.

Anyway, I'll definitely take all your advice under consideration. At
least now I've got an idea of what I need to do. I don't fully get how
the DNAT and SNAT work, but at least I've got a direction to be looking.

Thanks a lot for your help. :)

On Thu, 2003-01-09 at 02:58, Joel Newkirk wrote:
> On Thursday 09 January 2003 12:34 am, David Collodel wrote:
> 
> {Very heavily snipped}
> 

<snipped most>

> > # 3.2 PREROUTING chain
> 
> > # 3.2.3 DMZ DNAT
> > #
> >
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> > --dport 80 -j DNAT --to-destination $DMZ_HTTP_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> > --dport 22 -j DNAT --to-destination $DMZ_HTTP_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> > --dport 443 -j DNAT --to-destination $DMZ_HTTP_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> > --dport 8000 -j DNAT --to-destination $DMZ_HTTP_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> > --dport 8001 -j DNAT --to-destination $DMZ_HTTP_IP
> >
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> > 53 -j DNAT --to-destination $DMZ_DNS_IP
> > $IPTABLES -t nat -A PREROUTING -p UDP -i $EXT_IFACE -d $DNS_IP --dport
> > 53 -j DNAT --to-destination $DMZ_DNS_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> > 443 -j DNAT --to-destination $DMZ_DNS_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> > 22 -j DNAT --to-destination $DMZ_DNS_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> > 25 -j DNAT --to-destination $DMZ_DNS_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> > 995 -j DNAT --to-destination $DMZ_DNS_IP
> 
> Hmmm.  Well, this is the answer to your 'real' question.  I don't see ANY 
> rules in PREROUTING to DNAT connections from the LAN. Those would be 
> addressed -d $DNS_IP, but would be -i $LAN_IFACE.
> 
> You should seriously reconsider what communications the firewall box 
> itself requires, and what traffic the LAN is allowed to conduct.
> 
> j

-- 
David Collodel <dave@crawlspaceradio.com>


