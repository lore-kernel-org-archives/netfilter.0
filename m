From: "hare ram" <hareram@sol.net.in>
Subject: Problem with string
Date: Thu, 27 Feb 2003 19:21:08 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <087d01c2de67$5461f9a0$13fcc5cb@Housecall>
References: <20030225215326.GA30804@first.knowledge.no> <20030227123531.GA26259@first.knowledge.no>
Reply-To: "hare ram" <hareram@sol.net.in>
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
i have redhat 8.0 and upgraded to latest kernel
with the following information
Linux inca 2.4.18-24.8.0custom #4 Thu Feb 27 14:14:50 IST 2003 i686 i686
i386 GNU/Linux

and patched with string and iptable 1.2.7a

when i try to excute the command

[root@inca extra]# iptables -I INPUT -m string --string 'cmd.exe' -j QUEUE
iptables v1.2.7a: Couldn't load match
`string':/usr/local/lib/iptables/libipt_string.so: cannot open shared object
file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.
---


when i check with modprob its accepting the module

what could be the problem

thanks
hare


