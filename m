From: <bmcdowell@coxhealthplans.com>
Subject: RE: mangle + TCP Flags
Date: Thu, 11 Dec 2003 09:57:46 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731012C61E7@coxhpexg.coxhp.com>
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
To: netfilter@lists.netfilter.org


Now that is a truly interesting question, if a bit off-topic.  What is =
the best way to handle recon?  Is it best to comply and hope your =
network looks un-interesting?  Is it best to try and make scanning as =
costly as possible (aka Tarpitting)?  Is it best to make everything =
appear open, thereby polluting the results of the scans?

Personally, I go for a mix of the latter two.  I'd like to make recon =
take absolutely forever AND return false information.  Particularly =
randomly false information - to make the prospect of rescanning =
unpalatable.

One down side is, I wind up making my network more 'interesting' than my =
neighbors.  I'm not quite sure if it is worth the extra interest...


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Thursday, December 11, 2003 9:44 AM
To: netfilter@lists.netfilter.org
Subject: Re: mangle + TCP Flags


On Thursday 11 December 2003 3:32 pm, Jean-Marie Orset wrote:

> > Well, you could just:
> > -p tcp -j REJECT --reject-with tcp-reset (uses tcp rst)
> > -p udp -j REJECT (uses icmp port-unreach)
> >That makes nmap say: ports closed.
>
> Yes, that's what I should do but My idea was to answer false SYN,ACK
> even if the ports are closed. In that way a scan would declare all my =
ports
> open but in reality, they would be closed.

Why is that better for security?

Antony.

--=20
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) =
N(-) o?=20
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? =
5?=20
!X- !R K--?

                                                     Please reply to the =
list;
                                                           please don't =
CC me.


