From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Creating a variable for multiple IP addresses?
Date: Fri, 13 Jan 2006 13:16:15 -0500
Message-ID: <03bb01c6186d$71558610$b000a8c0@cybergeneration.com>
References: <B584AAC32ED8DE49A8EAD2CF3D847FE0021717FB@auth-fl-mail1.commandsoftware.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Arthur DiSegna <adisegna@authentium.com>
Cc: netfilter@lists.netfilter.org


Hello

You may use this method to add each IP to
a rule :

for ip in $NOC; do
  iptables -A SOME_CHAIN -p tcp -s $ip --dport 139 -m state --state NEW -j
ACCEPT
  <other rules for Samba>
done

The loop will read each IP and add them to rules one by one.

HTH

Maxime Ducharme

----- Original Message ----- 
From: "Arthur DiSegna" <adisegna@authentium.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 13, 2006 1:00 PM
Subject: Creating a variable for multiple IP addresses?


Hi,

What is correct syntax to have one variable equal more than one ip
address (not in order)? Is is possible or do I have to create a
different rule for each IP.

For example I want to enable Samba on a Linux server but only want a few
members of network operations to have access to the server.

NOC="192.168.0.1 192.168.0.2 192.168.0.25"


Thanks in advance




