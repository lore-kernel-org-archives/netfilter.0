From: Jason Opperisano <opie@817west.com>
Subject: Re: How multiple PCs on private LAN possible if incoming is DNAT'd
	to *same* server *always*?
Date: Thu, 3 Feb 2005 12:35:06 -0500
Message-ID: <20050203173506.GA4619@bender.817west.com>
References: <20050203172500.GB29677@spawar.navy.mil>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050203172500.GB29677@spawar.navy.mil>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Feb 03, 2005 at 09:25:00AM -0800, seberino@spawar.navy.mil wrote:
> I got an iptables script for a NAT-ing firewall that
> forwards packets between Internat and a private LAN.
> 
> All incoming packets are destination NAT'd to end up
> at a single server on the private LAN.

so you have a rule that says:

  iptables -t nat -A PREROUTING -i $EXT_IF \
    -j DNAT --to-destination $SINGLE_SERVER_IP

> **I don't understand how ANY packets can ever arrive
> at ANY other PC on the private LAN since they
> are ALL destination NAT'd to go to same private server IP
> address!?!?**

um--any NEW packets arriving inbound on $EXT_IF would have their
destination IP translated to $SINGLE_SERVER_IP, yes.
 
> If some arbitrary client on private LAN wants to visit
> a web page, somehow his traffic arrives back at himself
> without any specific NAT rules to get packets to him!??

ah--it seems you are confusing DNAT and SNAT.  when a machine on the
inside makes an outbound request (that passes all your filter rules) it
is probably hitting some sort of SNAT rule like:

  iptables -t nat -A POSTROUTING -o $EXT_IF -j SNAT --to-source $EXT_IP

this will create a conntrack entry that will be able to map the reply
packet back to the correct client by matching:

  src_ip,src_port,dst_ip,dst_port

> I know it has something to do with ESTABLISHED,RELATED
> state ACCEPT-ing rules but this has always confused me.

sorta.  keep in mind that rules in "-t nat" are only applied to packets
with state NEW--this is probably the piece you're missing.

> Do you understand the question?

maybe.

-j

--
"Please do not offer my god a peanut"
        --The Simpsons

