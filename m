From: Simon Matthews <simon@paxonet.com>
Subject: Re-writing packets
Date: Sat, 17 May 2003 13:43:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4.3.1.2.20030517133514.00e8aa80@coremail>
References: <200305172229320387.009A0DC3@mail.gmx.net>
 <200305172229320387.009A0DC3@mail.gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053186626.795.52.camel@elendil.intranet.cartel-securite.n
 et>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am trying to get Microsoft's MSN messenger working from behind a 
iptables/MASQ firewall. I have installed a SIP proxy and redirected 
outgoing packets to the proxy.

However, before Messenger will allow phone calls, it attempts to see if 
calls ba be placed by connecting to a Microsoft IP address, port 7001.

 From my packet sniffing, it appears that the client (Messenger) send 
packets out to 65.54.240.62, port 7001. However, the replies come back from 
65.54.240.61. The port numbers match, but the IP address is different. The 
client also tries sending packets to  65.54.240.61, but no replies to these 
come back.

So, my question is: is there some way with iptables, to re-write the 
packets returning from 65.54.240.61 so that they have a source address of 
65.54.240.62 AND then have those packets handled by the MASQ code and 
forwarded to the correct client (behind the MASQ firewall)?

Thanks!
Simon


