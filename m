From: px <px5150@yahoo.com>
Subject: maximum number of iptables rules?
Date: Wed, 12 Nov 2003 15:18:12 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB2BFB4.2000105@yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: dom@fea.net

Hi, me and a buddy of mine are working on a perl script to automate 
blocking of about 3000 IP addresses.
The script works fine on his box, x86.  But on my box, sparc, I seem to 
have a limitation of 854 rules before I start to get errors and am 
unable to add anymore rules.
Is there a maximum number of rules per chain? or overall?
 

Here is the information on my Sparc box.

> null:~# iptables -t filter -I INPUT 1 -s 66.28.224.0/19 -p all -j blockme
> iptables: Memory allocation problem


> null:~# iptables -t filter -I INPUT 1 -s 1.2.3.4/19 -p all -j blockme
> iptables: Memory allocation problem
> null:~# uname -a
> Linux null 2.4.21 #1 Thu Aug 7 20:30:12 EDT 2003 sparc64 GNU/Linux
> null:~#

> null:~# iptables -L blockme
> Chain blockme(854 references)
> target     prot opt source               destination
> DROP       all  --  anywhere             anywhere


Here is the info about my buddy's. x86 box

>  root@darkside:/etc/rc.d# uname -a; iptables -L blockme; iptables 
> --version
>  Linux darkside 2.5.50-ac1 #3 SMP Sun Feb 9 10:21:53 PST 2003 i686 
> unknown
>  Chain blockme(3966 references)
>  target     prot opt source               destination          
>  DROP       all  --  anywhere             anywhere            
>  iptables v1.2.7a



Any help is greatly appreciated.
-r0b



