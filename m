From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IP alias and NAT
Date: Wed, 29 Jan 2003 21:04:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301292104.59028.netfilter@newkirk.us>
References: <001e01c2c5f8$bc5d7d40$0bc8c80a@dolphin> <1043672915.15779.16.camel@elendil.intranet.cartel-securite.net> <006c01c2c74b$7f1b37c0$0bc8c80a@dolphin>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006c01c2c74b$7f1b37c0$0bc8c80a@dolphin>
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
To: Jet <yenjet.chan@eglobal.com.my>
Cc: netfilter@lists.samba.org

On Tuesday 28 January 2003 11:04 pm, Jet wrote:
> Hi,
>
> > To get packets NATed as you want them to, they have to reach
> > PREROUTING chain on the firewall. That means when access router
> > wants to forward theses packets, it must get an ARP reply for their
> > destination IP. If NATed IPs were not aliased on firewall, then
> > nobody would answer access router's ARP requests, and connections
> > would not get established.
>
> I don't totally agree on this. How about POST ROUTING?
>
> > The only thing you have to keep in mind is that packets you want to
> > NAT have to reach the firewall. As they're not destined to, you have
> > to force them a bit ;)
>
> Can anyone explain why we don't have to do the same for POSTROUTING?

At POSTROUTING the packet is already IN the firewall box, and is about to=
=20
pass back out.  The issue mentioned above is trying to get an access=20
router to recognize that the box is an appropriate destination for a=20
given packet, so that the packet will be sent to it to begin with. If=20
and when it does so, the packet first appears in the PREROUTING=20
chain(s).

j

> - Jet


