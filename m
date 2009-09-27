From: patriceetstephanie@free.fr
Subject: Question about IPTABLES and NETBIOS
Date: Sun, 27 Sep 2009 14:11:24 +0200
Message-ID: <1254053484.4abf566cc0ed2@imp.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I have for my work a PC with 3 network cards:
the first is used to grant access to port 80 on an IIS server (connected to the
third card), the second for access to port 80, 137:139, 445 (to update the site)
and port SQL (for connecting to SQL Server) on the IIS server.

For resuming:
Card 1: 192.168.5.254 (not implemented at this time)
Card 2: 192.168.1.2544
Card 3: 192.168.3.254/32 (Windows Server 2008 with IIS and SQL Server IP of this
server: 192.168.3.1)

The first card is not yet implemented. My problem is the second card (access
from the local network should forward ports 80,137:139 and 445.

I tried to do in my PREROUTING iptables rules to redirect port 80 to port 80 of
the third card. I did the same for ports 137 to 139 and 445 and also the port of
SQL Server.

The problem when I use the PREROUTING is that the network is very slow. If I
transfer a file from one computer on the network 192.168.1.0/24 to
192.168.3.0/24, I have access, but it's slow. If two stations using this
partition at the same time, then the first cut which is transferred and an error
message appears in Windows.

So I tried to use the masquerade on the third card (192.168.3.0/24) and make a
road on my network 192.168.1.0/24. The connection is much faster, but like when
I use the PREROUTING, when I do a transfer on 2 machines simultaneously via
ports 137:139, the transfert cut on the first machine and an error appair.

I can send you the script iptables application.

What can I do to resolve my concerns?

For information, I tried to open all ports but the problem persists. The
ip_forward is 1.

Thank you in advance for your help.

Sorry for my english

Patrice.
