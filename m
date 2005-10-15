From: amit pasari <amit@xsinfoways.com>
Subject: removing duplicate rules
Date: Sun, 16 Oct 2005 03:00:06 +0530
Message-ID: <6.2.1.2.0.20051016030004.030e32a0@147.202.41.46>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



hello,
i have been using iptables for quite sometime , Now my problem is , if by 
make i add multiple type of same rule in iptables it accepts N number of 
entries . So can any body tell me how to aviod that or can i check the same 
rule exists before Appending it into the table.
Eg : iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
i have add the above rules 10 times 20 times but the system never says the 
above rule exist . Can anybody tell me how can i check or aviod .

thanks in advance .

amit




