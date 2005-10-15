From: Daniel Ivanov <sertys@supportivo.org>
Subject: iptables & squid
Date: Sat, 15 Oct 2005 16:54:04 +0300
Message-ID: <435109FC.7000903@supportivo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I could finally manage to bump packets from a bsd box to my squid and 
thanks to ipfw they come un-rewritten in the form
{internal_net_ip} -> {destination_ip}
This is ok. I set a simple redirect rule in the prerouting:
iptables -t nat -A PREROUTING -p tcp --dport 80 -s internal_net/mask -j 
REDIRECT --to-ports 80

Packets jump to my proxy and pass through.
But i get them returned in the form:
{squid_box} -> {ip_from_internal_network}
 This way they are impossible for shaping. How would i make such a packet
{destination_ip} -> {internal_net_ip}
by means of iptables.

Would a DNAT do the trick and will it be hit if a have a REDIRECT target 
already in the PREROUTING.
Otherwise the REDIRECT is also available in the OUTPUT chain of the nat 
table.

