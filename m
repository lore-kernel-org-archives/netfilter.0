From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Problems with NAT
Date: Fri, 30 May 2003 12:30:47 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D64@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Matt Hellman <netfilter@taxandfinance.com>, jhime@synchro.com.br, Ray Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>

SNAT should not be used for MASQUERADING.. it's not advised anyway but =
still works but who knows what possible problems it may cause.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Matt Hellman [mailto:netfilter@taxandfinance.com]
Sent: Friday, May 30, 2003 11:59 AM
To: jhime@synchro.com.br; George Vieira; 'Ray Leach'; 'Netfilter Mailing
List'
Subject: RE: Problems with NAT


never tried it, but why couldn't you just add ACCEPT rules in PREROUTING
[before the NAT rule] for each LAN not_to_be_natted?

-t nat -A POSTROUTING -s LAN A -d LAN B -j ACCEPT
-t nat -A POSTROUTING -s LAN A -d LAN C -j ACCEPT
-t nat -A POSTROUTING -s LAN A -d 0/0 -j SNAT --to Firewall_IP_address

