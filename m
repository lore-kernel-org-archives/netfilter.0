From: KARIM SATTAR <karimas@kfupm.edu.sa>
Subject: Initialization of local variable in a iptables datastructure
Date: Fri, 07 Sep 2007 05:50:13 +0300 (AST)
Message-ID: <1253262.1189133413006.JavaMail.karimas@kfupm.edu.sa>
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
I have introduced a variable in xt_counters data structure of type 
uint_64t to be used as a counter in ipt_entry data structure. I have 
installed iptable new version source code from its website. In this 
userspace, I am printing the variable with other packet and byte 
counters. Till now iptables are working fine and every thing is all 
right -- except with the problem that the variable which I introduced 
is showing garbage values mostly 0's ( when print several times with 
iptables -L command). I have initialized the variable on the location 
where its required but I am not getting a constant value which is in my 
case should be only 0 (during testing). Can any one puts a light on 
this. I didnt know what the Linux kernel might do if its encounter an 
uninitialized variable.

Also since I am printing the counters with the help of iptables-save -c 
and iptables -L -n -v and in both cases I am getting this non-obvious 
results; there fore I had also tried with initiailizing the variable in 
ipt_do_table function under the do_while loop and make the variable 
initialized always to 0, but this also not useful as I am still viewing 
the same results.



Regards
Karim Asif Sattar

