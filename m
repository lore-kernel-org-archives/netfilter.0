From: Christian Hammers <ch@westend.com>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: Tue, 14 Jan 2003 16:06:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114150641.GB23431@westend.com>
References: <20030114093711.GC9940@westend.com> <20030114121232.GA3362@westend.com> <1042551825.465.143.camel@xbox>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1042551825.465.143.camel@xbox>
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
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

Hello

On Tue, Jan 14, 2003 at 02:43:45PM +0100, Filip Sneppe wrote:
> On Tue, 2003-01-14 at 13:12, Christian Hammers wrote:
> > I had ipt_conntrack.o loaded (see last mail) and then removed. But still
> > my /proc/net/ip_conntrack got filled up.
> > Then I did "echo '10000' > /proc/sys/net/ipv4/ip_conntrack_max" and it =

> > still raised.
> > Now, after waiting 10min or so the values are slightly falling (I had
> > fear that it crashed when reaching 0xffff)..
> >=20
> > Are the first two events signs for a bug or is it expected behaviour
> > that somehow the conntrack code remains in the kernel even if the module
> > has been removed?
>=20
> You sure it's not due to a typo ? It's ip_conntrack.o, not
> ipt_conntrack. After an rmmod, what does lsmod say ?
Ok, that was just a typo while writing the mail. I always checked with
lsmod as user root. Currently:

/home/ch# lsmod
Module                  Size  Used by    Not tainted
ipt_LOG                 3200   2  (autoclean)
iptable_filter          1760   1  (autoclean)
ip_tables              13184   2  [ipt_LOG iptable_filter]
dummy                   1088   1=20
eepro100               18444   3=20
mii                     2320   0  [eepro100]
unix                   13892  14  (autoclean)

> About the high nuber of tracked connections, are you
> talking about /proc/net/ip_conntrack ?
Yes. As wrote in my previous mail (should have written it here, too),
this router does asymetric routing, i.e. the packets for a connection
come in over it but the answer packets go out via another router.=20
So it will almost never see a real 3way tcp handshake or the like.

Fitting to this explanation, the kind of traffic in the
/proc/net/ip_conntrack is 99.9% "UNREPLIED" but apart from that
absolutely normal traffic (mostly port 80 and usual IPs).

> Regards,
> Filip
bye,

-christian-

--=20
Christian Hammers             WESTEND GmbH  |  Internet-Business-Provider
Technik                       CISCO Systems Partner - Authorized Reseller
                              L=FCtticher Strasse 10     Tel 0241/701333-11
ch@westend.com                D-52064 Aachen              Fax 0241/911879


