From: Ulrich Weber <uw@imos.net>
Subject: ICMP TTL=255
Date: Wed, 05 Mar 2003 14:32:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E65FC55.9050400@imos.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I don't think that it's iptables fault, but I don't know where to ask else.
ICMP Ping ignores the TTL value of net/ipv4/ip_default_ttl and use 255.

All other traffic use the net/ipv4/ip_default_ttl value.

Greets
  Ulrich


