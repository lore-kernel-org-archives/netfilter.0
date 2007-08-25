From: KARIM SATTAR <karimas@kfupm.edu.sa>
Subject: Iptables List operation
Date: Sun, 26 Aug 2007 02:27:32 +0300 (AST)
Message-ID: <4957697.1188084452277.JavaMail.karimas@kfupm.edu.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hi
I am working on some performance measures of the IPtables these days. I 
want to know; Is it possible that output of iptables list command i.e. 
iptables -L with -n -v can be changed so that I can view  my variables 
along with the other chains. I have tried to find out; but i am still 
in searching.

My work is related to protocols and is therefore I want to print output 
along with the list of rules. Since the rules in each chain has been 
implemented in the link list format; it is very difficult to print 
variables through proc filesystem due to the variability nature of the 
link list.

I have tried with strace to find which module does this operation 
calls; and I have come with libipt_standard.so library file. I have 
seen the code; but didnt find which function is processing the list 
request.

Regards


