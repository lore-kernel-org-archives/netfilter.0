From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: ICMP and connection tracking
Date: Thu, 20 May 2004 10:06:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ACC986.8060103@pbl.ca>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Are ICMP packets related to new and established TCP connections and UDP 
traffic considered to be part of them, or do I need to have explicit 
rules like

    -A INPUT -p icmp -m state --state RELATED -j ACCEPT

for things like path MTU discovery, traceroute, ICMP port unreachables, 
and so on to work properly?

Any downsides of using generic rule like above (if it is needed)?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

