From: "Jose Luis Hime" <jhime@synchro.com.br>
Subject: RE: Problems with NAT - it worked !
Date: Fri, 30 May 2003 08:33:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c3269f$4c78da30$010319ac@jhime>
References: <001a01c3264f$15bf0d20$fd0aa8c0@winxp>
Reply-To: <jhime@synchro.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001a01c3264f$15bf0d20$fd0aa8c0@winxp>
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
To: 'Matt Hellman' <netfilter@taxandfinance.com>, jhime@synchro.com.br, 'George Vieira' <georgev@citadelcomputer.com.au>, 'Ray Leach' <raymondl@knowledgefactory.co.za>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

This tip worked perfectly! I will do the command:

-t nat -A POSTROUTING -s LAN-A -d LAN-B -j ACCEPT

to every known destination.

Just to finish, I've heard from many people that using SNAT could cause
problems and I better using MASQUERADING...

Is that true ? The NAT how-to says the opposite...

Well, thanks to everyone, specially to George Vieira. I hope he could
finally finish his job after I stopped bothering him!

Jose Hime


-----Original Message-----
From: Matt Hellman [mailto:netfilter@taxandfinance.com]
Sent: Thursday, May 29, 2003 10:59 PM
To: jhime@synchro.com.br; 'George Vieira'; 'Ray Leach'; 'Netfilter
Mailing List'
Subject: RE: Problems with NAT


never tried it, but why couldn't you just add ACCEPT rules in PREROUTING
[before the NAT rule] for each LAN not_to_be_natted?

-t nat -A POSTROUTING -s LAN A -d LAN B -j ACCEPT
-t nat -A POSTROUTING -s LAN A -d LAN C -j ACCEPT
-t nat -A POSTROUTING -s LAN A -d 0/0 -j SNAT --to Firewall_IP_address


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

