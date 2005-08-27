From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Monitoring a TARPIT
Date: Fri, 26 Aug 2005 17:56:34 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829074EB@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: "curby ." <curby.public@gmail.com>, =?iso-8859-1?Q?Gottmar_Krak=E9liusz?= <ulan.bator@hotmail.com>
Cc: netfilter@lists.netfilter.org

I tried that.  We have a rule setup for ports 445 and 135-139. Let's =
just say that since this last round of viruses here is what tarpit has =
to say.

-rw-------   1 root   root    489043093 Aug 26 19:49 messages
-rw-------   1 root   root    787713009 Aug 26 04:47 messages.1

Luckily the firewall has 250gb drives.

With that in mind, you might want to rate limit your logging on this.

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of curby .
> Sent: Friday, August 26, 2005 2:56 PM
> To: Gottmar Krak=E9liusz
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Monitoring a TARPIT
>=20
> On 8/25/05, Gottmar Krak=E9liusz <ulan.bator@hotmail.com> wrote:
> > Hi!
> > I use the TARPIT target to delay those brute force attacks on my SSH
> port.
> > Now I wonder if there is a way of getting some statistics on how =
many,
> which
> > IP:s and for how long they are caught.
> > AFAIK, I cant get ALL this by simply logging?
>=20
> If you put your logging rule right before the TARPIT rule, it should
> log everything that would get to TARPIT.  This will show you IPs that
> get TARPIT-ed, and with some log analysis you could also find when,
> how many, etc.


