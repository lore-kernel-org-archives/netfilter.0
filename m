From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerade (Newbie)
Date: Sun, 9 Jun 2002 22:26:13 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206092126.g59LQEA23512@Networker.rockstone.co.uk>
References: <200206091647.32562.richard.downing@bcs.org.uk> <200206091621.g59GLrA06315@Networker.rockstone.co.uk> <200206092118.53543.richard.downing@bcs.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206092118.53543.richard.downing@bcs.org.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Sunday 09 June 2002 9:18 pm, Richard A Downing wrote:

> ifconfig ppp0
> ppp0      Link encap:Point-to-Point Protocol
>           inet addr:213.104.157.9  P-t-P:62.255.122.225 
>
> root:/usr/lib/iptables$: iptables -t nat -F
> root:/usr/lib/iptables$: iptables -t nat -A POSTROUTING -o ppp0 -j
> MASQUERADE
> iptables: No chain/target/match by that name

Okay.   I still do not know why you cannot use the MASQUERADE target, but I 
do not use modules - I have everything compiled-in to the kernel, so I don't 
know what you need to look for to find out why that command isn't working.   
Hopefully someone else can help on that one ?

However, the ppp0 info you posted tells me that your local address is 
213.104.157.9, so this is the address you should be using in your SNAT rule 
as a workaround.

The 62.255.122.225 address is the other end of the link, which your machine 
is routing to, therefore you shouldn't be trying to masquerade your outgoing 
packets on this address.
 
 
 
Antony.

