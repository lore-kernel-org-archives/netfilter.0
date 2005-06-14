From: Scott <gneamob@yahoo.com>
Subject: Re: Script review please
Date: Tue, 14 Jun 2005 14:32:33 -0700 (PDT)
Message-ID: <20050614213233.91352.qmail@web54301.mail.yahoo.com>
References: <200506142212.51869.ghenry@suretecsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506142212.51869.ghenry@suretecsystems.com>
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

I would add the following at the end (for safety's
sake):

$t --policy INPUT DROP
$t --policy FORWARD DROP
$t --policy OUTPUT ACCEPT

-Scott

--- Gavin Henry <ghenry@suretecsystems.com> wrote:

> Dear list,
> 
> May I run the following past you to see if I have
> any stupid errors or if you 
> have some good advice?
> 
> (it's very rough with no comments)
> 
> Thanks:
> 
> #!/usr/bin/env bash
> 
> t="/usr/bin/env iptables"
> 
> $t --flush
> $t --table nat --flush
> $t --delete-chain
> $t --table nat --delete-chain
> 
> $t --table nat --append POSTROUTING -s
> 192.168.14.0/24 --out-interface ppp0 -j 
> MASQUERADE
> 
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192.168.14.0/24  --dport 443 -j 
> ACCEPT
> 
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192..168.14.0/24  --dport 110 -j 
> ACCEPT
> 	
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192.168.14.0/24  --dport 25 -j 
> ACCEPT
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192.168.14.0/24  --dport 22 -j 
> ACCEPT
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192.168.14.0/24  --dport 1863 -j 
> ACCEPT
> 	
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192.168.14.0/24  --dport 21 -j 
> ACCEPT
> $t -A FORWARD -p tcp -s 192.168.14.0/24 -d !
> 192.168.14.0/24  --dport 20 -j 
> ACCEPT
> 
> $t --table nat --append PREROUTING -i eth0 -p tcp -d
> ! 192.168.14.0/24 --dport 
> 80 -j REDIRECT --to-port 3128
> 
> # IP Sec Connects and VPN
> $t -A INPUT -p all -s 192.168.0.0/24 -j ACCEPT
> $t -A INPUT  -p udp --dport 500 -j ACCEPT
> $t -A OUTPUT -p udp --dport 500 -j ACCEPT
> $t -A INPUT  -p 50 -j ACCEPT
> $t -A OUTPUT -p 50 -j ACCEPT
> $t -A INPUT -p tcp --dport 500 -j ACCEPT
> 
> 
> $t -A INPUT -p all -s 192.168.14.0/24 -j ACCEPT
> $t -A INPUT -p all -s 192.168.15.0/24 -j ACCEPT
> $t -A INPUT -p all -s 192.168.16.0/24 -j ACCEPT
> $t -A INPUT -p all -s 192.168.17.0/24 -j ACCEPT
> $t -A INPUT -p all -s 127.0.0.0/24 -j ACCEPT
> $t -A INPUT -p all -s 127.0.0.1 -j ACCEPT
> 
> $t -A INPUT -p tcp -i ppp0 --dport 22 -j ACCEPT
> 
> $t -A INPUT -p all -i ipsec0 -j ACCEPT
> $t -A INPUT -p tcp --syn -j DROP
> 
> 
> Thanks again.
> 
> 
> -- 
> Kind Regards,
> 
> Gavin Henry.
> Open Source. Open Solutions(tm).
> 
> http://www.suretecsystems.com/
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

