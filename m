From: "Simpson, Doug" <DSimpson@friedmancorp.com>
Subject: ipsec & nat
Date: Tue, 10 Dec 2002 23:03:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CAFAAEC91CC8D511952000062938C6F12ECD92@ozlan.fcdomain.net>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I have a redhat 7.3 box that is dualhomed.  It is my firewall and vpn
server.  I can successfully vpn (with IPSEC) into it.  If I use the
following command "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" I
cannot use VPN, but my internal network can only receive email (POP3) and
telnet after I use this command.
I have set up squid so I proxy my www traffic.
Can I NAT my pop3 and my telnet, and still VPN (IPSEC)?  
I am guessing my command is too general and I need to be more specific -
ports, source, etc defined.
Thanks,
Doug

