From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: connection problem
Date: Thu, 5 Dec 2002 08:58:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212050858.18788.netfilter@newkirk.us>
References: <BDEFKJOAPEBPJCGDAGMFOEICCAAA.nigel@forever-networks.com> <1039095334.308.3.camel@bigblue>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039095334.308.3.camel@bigblue>
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
To: Paulo Andre <pandre@darkstar.nom.za>, Nigel Clarke <nigel@forever-networks.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thursday 05 December 2002 08:35 am, Paulo Andre wrote:
> On Thu, 2002-12-05 at 16:56, Nigel Clarke wrote:
> > Paulo,
> >
> > >I have a problem where a router reboots every evening. I do not
> > > have control of this router.

> > As far as the issue with IPTABLES....this might be an issue with the
> > ARP cache on the firewall. What kind of
> > network card are you using? What kernel version?

> I will look at that , the old network card, but the funny thing is
> that I have to change the IP address on the card to another and then
> back to the original for it to work.

Next time try "arp -d <hostname>" to flush the arp cache, and see if that=
=20
does it, instead of cycling the IP.

j


