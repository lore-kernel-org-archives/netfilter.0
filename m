From: "HareRam" <hareram@sol.net.in>
Subject: ilimit problem
Date: Fri, 4 Oct 2002 18:36:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <021501c26ba6$e113a760$7cfcc5cb@humanpc>
References: <200210041218.26636@.> <200210040947.g949lgL10535@vulcan.rissington.net> <200210041648.00792@.>
Reply-To: "HareRam" <hareram@sol.net.in>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all

iam trying to use iplimit in iptables, iam getting the below problem
can any one help what is the caused problem

[root@cache root]# iptables -A INPUT -p tcp --syn --dport http -m
iplimit --iplimit-above 4 -j REJECT
iptables: No chain/target/match by that name


thanks in advanced

hare


