From: "hard__ware" <hard__ware@hotmail.com>
Subject: RE: Deleting iptable-extended rule
Date: Fri, 6 Dec 2002 14:35:47 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE16oxiNLqjsh28fnnE0000b12a@hotmail.com>
Reply-To: "hard__ware" <hard__ware@hotmail.com>
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
To: brk_lists@yahoo.com
Cc: netfilter <netfilter@lists.netfilter.org>

>Hi!

Gday

>I am using iptables-1.2.7a. 
>works fine when I use it while adding new rules,
>something like
>iptables -A INPUT -m coustom --ip-id -j DROP. 
>I am able to delete the rule using the rule number,
>but I am not able to remove it using the rule specifed
>iptables -D INPUT -m coustom --ip-id -j DROP

I have found using the CVS version of IPTables 
(currently im using iptables-1.2.8-20020825) That it does not 
have  this problem , i can remove rules just as i added them by 
Replacing the -A with -D ...

Hope this helps 
......
HW  


