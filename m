From: "Omar Castaneda Acosta" <omar@idea.com.mx>
Subject: RE: (SOLVED) URGENT: Some TCP connection halting at SYN
Date: Tue, 11 Jun 2002 13:51:32 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3A5DC36EC1506C40825C05BE65E62AEF0E8B2E@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Class: urn:content-classes:message
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
To: Omar Castaneda Acosta <omar@idea.com.mx>, netfilter@lists.samba.org

I was selecting:

CONFIG_IP_ADVANCED_ROUTER
CONFIG_IP_PNP
CONFIG_IP_MROUTE
CONFIG_INET_ECN
CONFIG_SYN_COOKIES

on my kernel setup, just disabled those and it's working now. Guess I'll
need to test one by one (most of them weren't needed after all)

It's working now.

Thanks everyone!

-----Original Message-----
From: Omar Castaneda Acosta=20
Sent: Tuesday, June 11, 2002 12:58 PM
To: netfilter@lists.samba.org
Subject: URGENT: Some TCP connection halting at SYN

Hello, I've been running a iptables + NAT firewall for some time now,
suddenly, some of my most common e-mail destinations are not working, I
go and check on another host I have directly on the internet and I can
connect with no trouble at all to those sites, if I check on my netstat
-at (on the firewall) the connections stay at SYN State all the time.

Anybody experienced anything like this before?

Thanks in advance for any help or suggestions.

Regards,
Omar

