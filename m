From: Francis.Sauch@etu.enseeiht.fr
Subject: Problem with ROUTE target
Date: Fri, 24 Mar 2006 11:34:12 +0100 (CET)
Message-ID: <32872.82.234.42.39.1143196452.squirrel@82.234.42.39>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I installed the ROUTE target for ip6tables and I've got a problem.
Whenever I try to create a rule, for example

ip6tables -t mangle -A POSTROUTING -j ROUTE --oif eth0

I've got the message :

unknown error 4294967295

I know some people had the same issue but I didn't find any solution.

I tried to use strace and the result was something like :

socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"mangle\0\301\304e9\300\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"mangle\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [2456]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"mangle\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2668) = -1
ENOENT (No such file or directory)

That was not the exact message (I can't reproduce it right now) but that
was this error (ENOENT)

I really need to use this target so I would really appreciate your help

Than you

