From: "Josh Larocque" <joshlarocque@technologist.com>
Subject: Re: Customizing LOG output
Date: Tue, 25 Jan 2005 19:53:50 -0600
Message-ID: <20050126015350.47754CD9F8@ws1-2a.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

Thanks Samuel, I'll give it a shot!

----- Original Message -----

>=20
> Josh Larocque wrote:
> > Is there a way to change the data the the LOG module outputs?  As=20
> > it stands right now it's printing IN, OUT, MAC, SRC, DST, LEN,=20
> > TOS, PREC, TTL, ID, PROTO, SPT, DPT WINDOW, RES and UGRP... all=20
> > taking up about 2 and a half lines on the screen for each entry.=20
> > I'd like to get it down to a one-liner if possible.
> >
>=20
> Yes, hack at net/ipv4/netfilter/ipt_LOG.c by editing those printk's.
>=20
> Don't forget to recompile this module and also rmmod ipt_LOG.
>=20
> > Thanks,
> >
> > Josh
> >
>=20
> HTH,
>=20
> Samuel


