From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: help
Date: Wed, 11 Jun 2003 08:15:14 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E1B@wardrive.citadelcomputer.com.au>
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
To: dawn lin <alantisjun@hotmail.com>, netfilter@lists.netfilter.org

You have not mentioned anything about IPs so I assume they are on the =
same subnet. In that case, use a bridge which proxies the ARP requests =
and MAC addresses on each side of the firewall. Otherwise this won't =
work without routing.

A and C will see each other via B when B is setup as a bridge. You may =
need some patching on the kernel for iptables to work on a bridge.. not =
sure, brain dead this morning.. ;)

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
From: dawn lin [mailto:alantisjun@hotmail.com]
Sent: Thursday, June 05, 2003 7:19 PM
To: netfilter@lists.netfilter.org
Subject: help


hi,

i have 3 computers A, B and C.
i need A to talk to C through B(not a router)

I was hoping iptables will help me do mac filtering.

is it possible?

What i need is A is able to talk B only and B is to resend A's message =
to B.
Which is in a way where A wants to talk to C but it can only go through =
B to=20
talk to C.
Can anyone advice me how i can use iptables for that?

one senerio:
A send packets to C-> packet info shows MAC source=3DA, MAC dest=3DB,IP=20
source=3DA,IP dest=3DC
When packet reaches B-> packet info shows MAC source=3DB,MAC dest=3DC,IP =

source=3DA,IP dest=3DC

is that possible?

_________________________________________________________________
Download Norah Jones, Eminem and more! http://www.msn.com.sg/ringtones/



