From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: How can I configure my firewall to access voice chat with MSN 
	messenger 6.2?
Date: Wed, 04 Aug 2004 12:51:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091634664.14988.6.camel@aflores>
References: <006c01c47a35$02e03540$0201a8c0@MagicwindLaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006c01c47a35$02e03540$0201a8c0@MagicwindLaptop>
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
To: MagicWind <magicwind@citiz.net>
Cc: netfilter@lists.netfilter.org

	Hello there,

	Voice/video on MSN doesn't work behind firewall/nat. The negotiation of
the void/video connection is done in the payload of the packet.
	Take a look at linux-igd:
	http://linux-igd.sourceforge.net/
	It's working for me.

Regards,
Alejandro Flores

> I have a linux server which is configured as a router connecting my
> internal network and the internet.  using the following iptables
> rules:
>  
> iptables -A FORWARD -i eth0 -o eth1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> iptables -A FORWARD -j LOG
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>  
> where eth0 is the netword adapter linking to the internet and the eth1
> is the adapter linking to the internal network.
> It seems the network works quite well, except for the voice connection
> of MSN messenger 6.2.  I can't either initial a voice chat or accept a
> voice chat.
>  
> I've got absolutely no idea how to make it work.  Any ideas?
>  

