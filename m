From: Max Yin <max.yin@msa.hinet.net>
Subject: Port range forwarding
Date: Mon, 12 Jan 2004 20:43:16 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E4DB60AD-44FC-11D8-842F-000A95DA9C9A@msa.hinet.net>
Mime-Version: 1.0 (Apple Message framework v609)
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
I'm not sure if this question is already been asked before or not, 
because I can't find any discussion before.

I want to setup a port forwarding rule that will translate a specified 
port range to another port range, for example:

iptables -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --dport 3100:3500 
--to-destination \
192.168.2.60:2100-2500

But I found that all connections from 3100 to 3500 will be mapped to 
2100 port only, not 3100 to 2100, 3101 to 2101, etc.

So, how can I make it? or is it possible ?

Thanks
Max


