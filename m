From: "Tomek Macioszek" <tomekm@cea.pl>
Subject: Fw: Problem with CONNMARK
Date: Fri, 29 Oct 2004 07:37:07 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <002701c4bd79$589838c0$2a245cc2@cea05>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Netfilter <netfilter@lists.netfilter.org>

Hi!
I have problems with use target CONNMARK. When I type command :
iptables -j CONNMARK -h
output gives me  information that iptables is compiled with this options, 
but when I use command like this i.e.:
iptables -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
system couldn't do this. It write to me :
iptables: No chain/target/match by that name

My system: FEDORA 2
KERNEL: 2.6.5 ( compiled with target CONNMARK)
IPTABLET: v 1.2.9.
What is wrong wiht it??
Sorry for my English
Best regards
Tomek 


