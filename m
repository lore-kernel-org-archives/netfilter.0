From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Problems with NAT
Date: Fri, 30 May 2003 08:09:09 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D52@wardrive.citadelcomputer.com.au>
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
To: jhime@synchro.com.br, Ray Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>

What is the IP ranges for the other networks? Are they the same subnet =
or different ones?
Ned more info so we can determine the needs..

PS: Nice drawing ;P

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
From: Jose Luis Hime [mailto:jhime@synchro.com.br]
Sent: Friday, May 30, 2003 3:15 AM
To: 'Ray Leach'; 'Netfilter Mailing List'
Subject: RE: Problems with NAT


The problem is that there are LAN C, LAN D and LAN E in other 3 cities,
also! So, the rule:

-t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to =
Firewall_IP_address

would work for LAN B, but not for the other LANs.

All LANs are connected to the same router.

Thanks again,
Jose Hime


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ray Leach
Sent: Thursday, May 29, 2003 12:55 PM
To: Netfilter Mailing List
Subject: Re: Problems with NAT


