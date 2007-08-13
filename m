From: Blake Patton <pattonb@network1.ca>
Subject: trying to block an internal ip
Date: Sun, 12 Aug 2007 21:15:52 -0600
Message-ID: <46BFCCE8.7000300@network1.ca>
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


-- 
I have been trying to block all traffic from an internal ip address, and packets are still going out, (seen with tcpdump) I don't see any traffic coming in for that ip. here are the rukles I have put in place.

/sbin/iptables -A INPUT -i $CLEANIF1 -s 192.168.31.208 -j DROP
/sbin/iptables -A INPUT -i $CLEANIF1 -d 192.168.31.208 -j DROP

I thought this would shut down 192.168.31.208, however that is not the case. any advice would be appreciated.






