From: Paulo Andre <pandre@darkstar.nom.za>
Subject: ROUTE problem
Date: Wed, 26 Jul 2006 10:53:22 +0200
Message-ID: <44C72D82.5060404@darkstar.nom.za>
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
To: netfilter <netfilter@lists.netfilter.org>

I have added the following iptables rule for our network,

$iptables -A POSTROUTING -t mangle -d 198.1.y.z -p tcp --dport 80 -j 
ROUTE --gw 196.10.y.z --oif eth2

The fw has two ISP links, default router 196.20.y.z and secondary is 
196.10.y.z
If the above rule is removed, then our network can connect  to the 
198.1.y.z  on port 80 via the default gw 196.20.y.z
When the rule is in , the packet hits the mangle POSTROUTING rule but 
does not leave the fw, anyoine know what I am doing wrong.
Would it be a routing problem? 

Thanks
Paulo


