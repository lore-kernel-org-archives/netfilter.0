From: "Kellogg, Chris" <Chris.Kellogg@dyncorp.com>
Subject: Answer to DNAT / OUTPUT chain question.
Date: Tue, 11 Jun 2002 08:10:45 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <BC6421B0F2CC4C43897842092E0E00A94C14AE@TX1EX1NT.dyncorp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Hi, everyone.

First, I'd like to thank Antony for putting my head back on straight.

The OUTPUT chain, as we should know (oopsie), is used to handle packets
sourced from the Firewall system outbound to a network.  What I wanted to do
was change packets that were being routed by the firewall, not created by
it, so I needed to be using the PREROUTING chain, on the nat table.

I wanted to redirect an IP subnet to a single webserver with an acceptable
use policy when a client on that subnet tried to access a "restricted"
webserver, without stopping these clients from accessing acceptable servers.
My method to do this is as follows:

iptables -t nat -A PREROUTING -s restrictednet -d acceptedhost -p tcp
--dport 80 -j RETURN
...repeat as needed...
iptables -t nat -A PREROUTING -s restrictednet -p tcp --dport 80 -j DNAT
--to-destination policyweb:80

I'm sure there are other ways to do this, however I've tested this method
and it works rather well.

Thanks for everyone's help.

Cheers,

Chris.

