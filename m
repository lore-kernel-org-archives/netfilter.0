From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
Subject: Re: ipsec & nat
Date: 11 Dec 2002 21:39:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039639156.25020.3.camel@nxitmirms1>
References: <CAFAAEC91CC8D511952000062938C6F12ECD92@ozlan.fcdomain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <CAFAAEC91CC8D511952000062938C6F12ECD92@ozlan.fcdomain.net>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi Doug,
i think your supposition is right, that's too general. Every packet
going out on eth0 will be natted and this is not what you want in case
of ipsec. Packet going out on the newly established vpn tunnel should
NOT be natted in any way. I can suggest you to nat what you really need
to nat so in this way you will get benefits on security side too.
If you know wich ip address will be assigned or are assigned on the
other side of the tunnel you can explicit disable nat on that
destination.

			Marcello


Il mer, 2002-12-11 alle 06:03, Simpson, Doug ha scritto:
> I have a redhat 7.3 box that is dualhomed.  It is my firewall and vpn
> server.  I can successfully vpn (with IPSEC) into it.  If I use the
> following command "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" I
> cannot use VPN, but my internal network can only receive email (POP3) and
> telnet after I use this command.
> I have set up squid so I proxy my www traffic.
> Can I NAT my pop3 and my telnet, and still VPN (IPSEC)?  
> I am guessing my command is too general and I need to be more specific -
> ports, source, etc defined.
> Thanks,
> Doug
-- 
Marcello Scacchetti <marcello.scacchetti@nextrem.it>

