From: rowdy <rowdy@fishpuppy.com>
Subject: Re: IPSec through my firewall
Date: Wed, 16 Feb 2005 01:29:26 -0800
Message-ID: <200502160129.26423.rowdy@com>
References: <200502151715.j1FHFtfO029324@pepsi.fishpuppy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200502151715.j1FHFtfO029324@pepsi.fishpuppy.com>
Content-Disposition: inline
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

On Tuesday 15 February 2005 09:15, Ola Nilsson wrote:
> I've got problems with getting IPSec (using NAT-T) traffic through my
> Linux 2.6.10 based firewall. I've now changed my iptables script to
> something rather simple:
>
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

I've been struggling with this as well.  Take a look at 
http://www.freeswan.org/freeswan_snaps/CURRENT-SNAP/doc/firewall.html .

I used this query to find this link and a number of others that could be 
helpful: "esp ipsec firewall rule"

I added rules like the following (but to user chains that I then added to the 
input, output and forward chains) to solve my hassles (clipped from the 
freeswan link above):
 
# allow IPsec
#
# IKE negotiations
iptables -I INPUT  -p udp --sport 500 --dport 500 -j ACCEPT
iptables -I OUTPUT -p udp --sport 500 --dport 500 -j ACCEPT
# ESP encryption and authentication
iptables -I INPUT  -p 50 -j ACCEPT
iptables -I OUTPUT -p 50 -j ACCEPT

Good luck.

