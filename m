From: Ben Yerushalmi <beny@pd.verio.net>
Subject: Redirect ports on localhost
Date: Tue, 23 Mar 2004 13:10:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406099AD.2070403@verio.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

I'm trying to redirect traffic on my DNS server. I have bind listening 
on port 5300 (UDP) instead of 53. I've got it working from the internal 
network but seem to have problem on redirecting localhost traffic. I've 
tried changing both PREROUTING and OUTPUT chains in the nat table but it 
doesn't seem to help.

iptables -A PREROUTING -t nat -p udp -i lo --dport domain -j REDIRECT 
--to-ports 5300

and

iptables -A OUTPUT -t nat -p udp -d localhost  --dport domain -j 
REDIRECT --to-ports 5300


Anyone have luck doing this? What am I missing?

Thanks,
Ben



