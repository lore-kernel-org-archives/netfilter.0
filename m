From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: MASQ problem
Date: Tue, 10 Jun 2003 20:09:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306102009.49102.pc-secure@home.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

Op dinsdag 10 juni 2003 06:30, schreef B H R Balaji:
> HI
>
> i have 20 alias interface, iam not able to MASQ using that interface, is
> this iptables supports this option
>
> [root@netxpress root]# iptables -I FORWARD -i eth0:1  -s
> 92.168.100.0/24  -j MASQUERADE
> Warning: wierd character in interface `eth0:1' (No aliases, :, ! or *).
> iptables: Target problem
>
>
> hare

hello

first of all:
Masquerading is done on the POSTROUTING chain.    NOT on the FORWARD chain.

interface_alias in that form is not allowed ,however , you could extract the  
ip_address and use that instead        like;

EXT_IF #external interface
ETH0_1_IP="`/sbin/ifconfig eth0:1 | grep 'inet addr' | awk '{print $2}' | sed 
-e 's/.*://'`"  

 iptables -I POSTROUTING -i eth0:1  -s  92.168.100.0/24  -o $ETH0_1_IP -j 
MASQUERADE

Watch the syntax 
I have used " -o OUT ETH0_1_IP " and not  " -i  ETH0_1_IP"  this is relevant.

Pascal

