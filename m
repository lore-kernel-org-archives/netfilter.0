From: <misiu_@gmx.de>
Subject: AW: IPTables, Linksys BEFSR41 and PCAnywhere
Date: Sat, 17 Jan 2004 10:37:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NAENJKNIDEBCFOJEICJKMEMBCAAA.misiu_@gmx.de>
References: <000401c3db95$9d0a8bf0$0f00a8c0@tandem>
Reply-To: <misiu_@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c3db95$9d0a8bf0$0f00a8c0@tandem>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "A. Clausen" <techlists@alberni.net>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

Hi,

I don't know if it helps you, but I tryed this @ work.
Ich had the following setup

myworkstation ---->> PCwithIPTABLES ---->Corporate LAN ----->>> LAPTOP

I made Masquerading for myworkstation and 'casuse I had 2 adresses I made
a static nat corporateip-----NAT---->>>myworkstation_myadressrange

PC-Anywhere works fine. So ot should not be the IPTABLES.

hope that helps
misiu
-----Urspr=FCngliche Nachricht-----
Von: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]Im Auftrag von A. Clausen
Gesendet: Donnerstag, 15. Januar 2004 19:30
An: 'Netfilter Mailing List'
Betreff: Re: IPTables, Linksys BEFSR41 and PCAnywhere



----- Original Message -----
From: "Alexis" <alexis@attla.net.ar>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, January 15, 2004 10:18
Subject: Re: IPTables, Linksys BEFSR41 and PCAnywhere


> youre right, just dont forget that pc anywhere uses 2 ports, that i
> think they are 5631 and 5631 tcp
>
> the linksys is with nat enabled? (its just to know, forwarding the ports
> is enough to work)

That's good to hear.  The problem is that it was another company that
administrates their network and some specialized software, and he's
insisting that the Linksys won't do this, when I've seen D-links and
Livingstons work quite well.  I did research, and PCAnywhere works fine
through NAT networks, and I thought the claim pretty dubious, but sometimes
dubious claims are right.

--
A. Clausen

techlists@alberni.net




