From: "Matt Hellman" <netfilter@taxandfinance.com>
Subject: RE: Problems with NAT
Date: Thu, 29 May 2003 21:01:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c3264f$69e6a160$fd0aa8c0@winxp>
References: <004701c32636$640deeb0$010319ac@jhime>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004701c32636$640deeb0$010319ac@jhime>
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
To: jhime@synchro.com.br, 'George Vieira' <georgev@citadelcomputer.com.au>, 'Ray Leach' <raymondl@knowledgefactory.co.za>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

Doh! I mean POSTROUTING. Also just noticed I sent this to more than just the
list.  My apologies.

>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org 
>[mailto:netfilter-admin@lists.netfilter.org] 
>Sent: Thursday, May 29, 2003 6:03 PM
>To: 'George Vieira'; jhime@synchro.com.br; 'Ray Leach'; 
>'Netfilter Mailing List'
>Subject: RE: Problems with NAT
>
>
>The addresses are the following:
>
>LAN A: 172.25.0.0 / 255.255.0.0
>LAN B: 172.28.0.0 / 255.255.0.0
>LAN C: 10.0.0.0 / 255.0.0.0
>LAN D: 159.254.172.0 / 255.255.255.0
>LAN E: 164.137.0.0 / 255.255.0.0
>
>LANs A and B are from the company I work for.
>LANs C, D and E are from custommers of ours.
>
>Thanks,
>Jose Hime
>
>-----Original Message-----
>From: George Vieira [mailto:georgev@citadelcomputer.com.au]
>Sent: Thursday, May 29, 2003 7:09 PM
>To: jhime@synchro.com.br; Ray Leach; Netfilter Mailing List
>Subject: RE: Problems with NAT
>
>
>What is the IP ranges for the other networks? Are they the 
>same subnet or different ones?
>Ned more info so we can determine the needs..
>
>PS: Nice drawing ;P
>
>Thanks,
>____________________________________________
>George Vieira
>Systems Manager
>georgev@citadelcomputer.com.au
>
>Citadel Computer Systems Pty Ltd
>http://www.citadelcomputer.com.au
>
>Phone   : +61 2 9955 2644
>HelpDesk: +61 2 9955 2698
> 
>
>-----Original Message-----
>From: Jose Luis Hime [mailto:jhime@synchro.com.br]
>Sent: Friday, May 30, 2003 3:15 AM
>To: 'Ray Leach'; 'Netfilter Mailing List'
>Subject: RE: Problems with NAT
>
>
>The problem is that there are LAN C, LAN D and LAN E in other 3 cities,
>also! So, the rule:
>
>-t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to 
>Firewall_IP_address
>
>would work for LAN B, but not for the other LANs.
>
>All LANs are connected to the same router.
>
>Thanks again,
>Jose Hime
>
>
>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org
>[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ray Leach
>Sent: Thursday, May 29, 2003 12:55 PM
>To: Netfilter Mailing List
>Subject: Re: Problems with NAT
>


