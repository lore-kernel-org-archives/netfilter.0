From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Re: Nat problem with GRE
Date: Wed, 4 Jun 2003 08:10:57 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005901c32a2d$c661d0e0$fd00a8c0@homes>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D9F@wardrive.citadelcomputer.com.au>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: George Vieira <georgev@citadelcomputer.com.au>, Esteban <esteban@alstec.fr>, netfilter@lists.netfilter.org

George, et al.

I actually have the same problem. I successfully patched my kernel(2.4.20)
with ip_pptp_conntrack (P-O-M) but after recompiling my kernel, iptables
doesnt recognize  NAT  anymore. How could this happen?

TIA
Pol

----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Esteban" <esteban@alstec.fr>; <netfilter@lists.netfilter.org>
Sent: Wednesday, June 04, 2003 6:12 AM
Subject: RE: Nat problem with GRE


No offence but for the <insert large number here>th time use pptp helper in
p-o-m.. ;)
GRE is connectionless and also has no ports so connection tracking cannot
map the port used to connect so it doesn't know which user behind the
firewall to relay the packets to.

So you need the patch-o-matic patch and select the PPTP helper to most
likely fix your problem.

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
From: Esteban [mailto:esteban@alstec.fr]
Sent: Tuesday, June 03, 2003 9:35 PM
To: netfilter@lists.netfilter.org
Subject: Nat problem with GRE


Hi there,

I have some troubles to NAT GRE traffic.
On my LAN, some users have to connect to an external PPTP server.
The connection success for the first user who connect the PPTP server.
But it fails for the others, when there is already a user connected to
the server.
I looked with tcpdump, and it seem that the GRE traffic of the second
client is droped (TCP 1723 connection is OK)

Actualy, I accept all the traffic destinated to the PPTP server (so tcp
1723 and gre traffic may be accepted).

Does anybody know what I am doing wrong ?

Thank you very much.


--
Esteban
esteban@epita.fr





