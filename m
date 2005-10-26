From: "Sylvan Andrew" <sylvan_nids@norfolk.nf>
Subject: --state NEW -j DROP (would be great)
Date: Wed, 26 Oct 2005 17:07:42 +1130
Message-ID: <001501c5d9ef$62a26c30$0510a8c0@cornerpc>
Reply-To: Sylvan Andrew <sylvan_nids@norfolk.nf>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello,

 Could somebody please explain the  'iptables -A INPUT -eth0 -m 
state --state NEW -j DROP' a bit more for me ?  I understand that it won't 
allow any outside initiated inbound connections into a network. However 
occasionally if I'm doing a tcpdump we see things like:

21:04:48.935367 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935447 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935455 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935537 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935545 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935629 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935637 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935812 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.935821 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.936045 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.936053 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0
21:04:48.936153 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
win 0

What is that and shouldn't it be dropped ? Or is the : R 0:0(0) ack 1 win 0 
part of it a already establish connection ? Although that's one of our IP's 
it's not active on our network.

Any ideas / advice  would be greatly appreciated !

Regards

Sylvan 


