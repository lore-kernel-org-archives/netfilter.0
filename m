From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: PPTP through iptables FW...
Date: Tue, 2 Jul 2002 07:59:49 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1C2@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: "'Aldo S. Lagana'" <alagana@discmail.com>, netfilter@lists.samba.org

Do what I do.. create a tunnel between the two networks instead of using the
client to make the connection...


client----firewall-------/ internet /-----firewall-----servers
          PPTP------------------------------PPTPD

then you can iptables the client through.. also proxy them in..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Aldo S. Lagana [mailto:alagana@discmail.com]
Sent: Monday, 01 July 2002 11:59 PM
To: netfilter@lists.samba.org
Subject: PPTP through iptables FW...


I haven't looked into this, but is there a method to connect to a pptp
server from behind an iptables firewall?  I have seen glimpses of
persons using something called ip_conntrack_pptp (sp?) and that seems it
will fit the bill...not sure..here is ASCII art:

Client-----IPTABLES Firewall------INTERNET--------Remote PPTP
server------Server

I am currently using IPTables 1.2.5


