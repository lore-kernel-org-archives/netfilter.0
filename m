From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: MSN access with a webcam
Date: Thu, 12 Aug 2004 08:54:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092311672.29929.5.camel@aflores>
References: <1811517141.20040811222046@openware.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1811517141.20040811222046@openware.nl>
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
To: "linux@openware" <linux@openware.nl>
Cc: netfilter <netfilter@lists.netfilter.org>

	Hello there,

	Webcam and Voice connections trough MSN doesn't use a fixed port. These
negotiations are done in the payload, so iptables doesn't know about
this new connection to treat is as related or established.
	You'll have to use an UPNP implementation for Linux.
	http://sourceforge.net/projects/linux-igd/
	It will set up new iptables rules for each connection of voice or
webcam.

Regards,
Alejandro Flores

> Hello listmembers,
> 
> I build myself a firewall on a gateway Suse 9.1 server
> 
> eth0 = DSL(WAN)
> eth1 = LAN
> net-lan = 192.168.0.1/24
> 
> On the LAN 3 Windowsclients are talking to Internet via a switch.
> 
> I can use Microsoft's MSN(chat) but using a webcam wont work.
> 
> Here's a part listings of my firewall MSN rules:
> 
> echo "MSN Messenger..."
> iptables -t filter -A FORWARD -i $lan -o $wan -p tcp --dport 1863 -s $net_lan -j ACCEPT
> iptables -t filter -A FORWARD -i $wan -o $lan -p tcp --sport 1863 -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -t filter -A FORWARD -i $lan -o $wan -p tcp --dport 443 -s $net_lan -j ACCEPT
> iptables -t filter -A FORWARD -i $wan -o $lan -p tcp --sport 443 -m state --state ESTABLISHED,RELATED -d $net_lan -j ACCEPT
> 
> Is a webcam using another TCP port?
> 
> 

