From: "Abe Froman" <abe__froman@hotmail.com>
Subject: re: ./runme extra doesnt prompt me for MATCH_STRING
Date: Sun, 19 Jun 2005 18:14:02 -0400
Message-ID: <BAY101-F25DA94F3010A86E9076E33B0F60@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>>since you don't specify; i will defer to the tea leaves, and the leaves
>>say you are running a 2.6 kernel...and the string match is 2.4-only.

When will a version that will work with 2.6 Kernel be released?

How do you know it wont work with 2.6?  According to the site it works with 
2.4 and 2.6 except 2.4.9:
iptables string match
Author: Emmanuel Roger <winfield@freegates.be>
Status: Working, not with kernel 2.4.9
This patch adds CONFIG_IP_NF_MATCH_STRING which allows you to
match a string in a whole packet.
THIS PATCH DOES NOT WORK WITH KERNEL 2.4.9 !!!



