From: Rajesh Pethe <rajesh_pethe2003@yahoo.com>
Subject: Problem configuring masquerading Gateway on RedHat 9.0...
Date: Thu, 5 Aug 2004 23:44:04 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040806064404.96275.qmail@web50209.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Dear Sirs,

As mentioned in the 'NAT-HOWTO' I've done the
following to configure my Linux box as masquerading
gateway for internal network :
#iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
and
#echo 1 > /proc/sys/net/ipv4/ip_forward

The problem is I can ping or telnet a remote host from
an internal network but browsers say 'unknown host'
when I try to load a remote site.

Please help me with this problem.

Regards
Rajesh



		
_______________________________
Do you Yahoo!?
Express yourself with Y! Messenger! Free. Download now. 
http://messenger.yahoo.com

