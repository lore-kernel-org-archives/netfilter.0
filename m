From: "Jose Luis Hime" <jhime@synchro.com.br>
Subject: RE: Problems with NAT
Date: Thu, 29 May 2003 20:02:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004701c32636$640deeb0$010319ac@jhime>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D52@wardrive.citadelcomputer.com.au>
Reply-To: <jhime@synchro.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0048_01C3261D.3EC0B6B0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D52@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'George Vieira' <georgev@citadelcomputer.com.au>, jhime@synchro.com.br, 'Ray Leach' <raymondl@knowledgefactory.co.za>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0048_01C3261D.3EC0B6B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The addresses are the following:

LAN A: 172.25.0.0 / 255.255.0.0
LAN B: 172.28.0.0 / 255.255.0.0
LAN C: 10.0.0.0 / 255.0.0.0
LAN D: 159.254.172.0 / 255.255.255.0
LAN E: 164.137.0.0 / 255.255.0.0

LANs A and B are from the company I work for.
LANs C, D and E are from custommers of ours.

Thanks,
Jose Hime

-----Original Message-----
From: George Vieira [mailto:georgev@citadelcomputer.com.au]
Sent: Thursday, May 29, 2003 7:09 PM
To: jhime@synchro.com.br; Ray Leach; Netfilter Mailing List
Subject: RE: Problems with NAT


What is the IP ranges for the other networks? Are they the same subnet or different ones?
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
 

-----Original Message-----
From: Jose Luis Hime [mailto:jhime@synchro.com.br]
Sent: Friday, May 30, 2003 3:15 AM
To: 'Ray Leach'; 'Netfilter Mailing List'
Subject: RE: Problems with NAT


The problem is that there are LAN C, LAN D and LAN E in other 3 cities,
also! So, the rule:

-t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to Firewall_IP_address

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

------=_NextPart_000_0048_01C3261D.3EC0B6B0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
AAABAAAAAAAAAB4ACoAIIAYAAAAAAMAAAAAAAABGAAAAADiFAAABAAAAAQAAAAAAAAALAAyACCAG
AAAAAADAAAAAAAAARgAAAAAGhQAAAAAAAAMADYAIIAYAAAAAAMAAAAAAAABGAAAAAAGFAAAAAAAA
CwAOgAggBgAAAAAAwAAAAAAAAEYAAAAADoUAAAAAAAADAA+ACCAGAAAAAADAAAAAAAAARgAAAAAR
hQAAAAAAAAMAEIAIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAAAgH4DwEAAAAQAAAAGH71EpLP
KE+miixFYez6PQIB+g8BAAAAEAAAABh+9RKSzyhPpoosRWHs+j0CAfsPAQAAAHYAAAAAAAAAOKG7
EAXlEBqhuwgAKypWwgAAbXNwc3QuZGxsAAAAAABOSVRB+b+4AQCqADfZbgAAAEM6XERvY3VtZW50
cyBhbmQgU2V0dGluZ3NcamhpbWVcTXkgRG9jdW1lbnRzXG91dGxvb2tcbWFpbGJveC5wc3QAAAAD
AP4PBQAAAAMADTT9NwAAAgF/AAEAAAAxAAAAMDAwMDAwMDAxODdFRjUxMjkyQ0YyODRGQTY4QTJD
NDU2MUVDRkEzREE0MjE0QzAwAAAAAAMABhDcD+12AwAHEOkEAAADABAQAAAAAAMAERAAAAAAHgAI
EAEAAABlAAAAVEhFQUREUkVTU0VTQVJFVEhFRk9MTE9XSU5HOkxBTkE6MTcyMjUwMC8yNTUyNTUw
MExBTkI6MTcyMjgwMC8yNTUyNTUwMExBTkM6MTAwMDAvMjU1MDAwTEFORDoxNTkyNTQxNwAAAADg
Og==

------=_NextPart_000_0048_01C3261D.3EC0B6B0--


