From: Guido Lorenzutti <guido@lorenzutti.com.ar>
Subject: travelling the tables and chains...
Date: Sun, 03 Apr 2005 23:25:42 -0300
Message-ID: <4250A5A6.6040509@lorenzutti.com.ar>
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

Hi people, i would like to clean up my firewall script by creating new 
chains in the filter table. Like this:

iptables -N FORWARD_WAN_TO_LAN

Then, call the traffic in the FORWARD chain:

iptables -A FORWARD -i $WAN -o $LAN -j FORWARD_WAN_TO_LAN

Now how can i discriminate the DNATed packets from that rule? It's OK if 
i MARK them in the PREROUTING chain and create a rule BEFORE in the 
FORWARD chain to check if the packet im MARKed then -j DNATED_WAN_TO_LAN?

Any better ideas?

