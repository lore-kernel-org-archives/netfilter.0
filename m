From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: ipv4 and ipv6 tables
Date: Fri, 27 Aug 2004 17:08:20 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412FB0D4.8080303@pbl.ca>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Ok, if I have good old ipv4 packet, or good new ipv6 packet they will go 
through respective chains in respective tables (either for ipv4 or 
ipv6).  But how about ipv6-in-ipv4 packets?  How is this handled when 
packet is forwarded (especially by ipv6 enabled host)?  How does the 
packet traverse tables and chains once it reach destination and is 
unwrapped from its ipv4 wrapper (does it go through both ipv4 and ipv6 
tables and chains)?  Any other special cases to watch for to prevent 
packets that should be blocked to go through ipv6 back door?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

