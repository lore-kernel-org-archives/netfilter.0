From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Masquerading connections terminated inside on both ends
Date: 29 Jun 2003 23:45:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056944742.27451.4.camel@alpha.newkirk.us>
References: <87k7b44kb7.fsf@stark.dyndns.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87k7b44kb7.fsf@stark.dyndns.tv>
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
To: Greg Stark <gsstark@mit.edu>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-06-29 at 17:59, Greg Stark wrote:
> I imagine this is a FAQ but I haven't seen it discussed. I have a server and a
> client machine both on the inside of my masquerading router. I can access the
> server from the outside fine, and i can access the internet fine from the
> client. But I'm not clear how to arrange things so I can reach the server from
> the client. 

> If I write the rules to masquerade anything with a destination address of my
> external ip address then it tries to DNAT the packets which is great, except
> it doesn't do SNAT as well so the source address is still the internal address
> on which interface the machine isn't expecting packets.
> 
> So I guess what I want the router to do for such connections is to do both
> SNAT and DNAT. It should rewrite the packets coming from the client->router to
> be from router->server and the return packets to be from router->client.

Precisely.

> Is this even possible? What would the rules look like? 

iptables -t nat -A PREROUTING -d $PPPIP -p dnat --to $SERVERIP
iptables -t nat -A POSTROUTING -d $SERVERIP -p snat --to $FIREWALLIP

Presuming that $FIREWALLIP is defined as the local IP of the NATting
box, and the others are logically defined as well.

This way the packet gets DNATted to the server, then SNATted before it
leaves the firewall box to ensure it comes back to the firewall box for
unDNATting and unSNATting before proceeding back to the client.  You can
add "-s $LOCALIPRANGE" to the SNAT rule if you don't want to bother
SNATting external client connections.

j



