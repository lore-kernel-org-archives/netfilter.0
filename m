From: "Robert" <mlody@elpec.com>
Subject: dstlimit patch
Date: Thu, 27 Oct 2005 20:22:46 +0200
Message-ID: <000301c5db23$7a7bf710$02050c0a@robee>
Reply-To: Robert <mlody@elpec.com>
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

i'm trying to use the dstlimit patch on netfilter pom-ng. is

iptables -I FORWARD -d IP_address -m dstlimit  --dstlimit 50 --dstlimit-mode 
dstip --dstlimit-name somehost -j ACCEPT

the a good idea?



robert 


