From: Andreas Herz <andi@geekosphere.org>
Subject: Re: UNREPLIED conntrack entries won't be discarded
Date: Tue, 26 Jul 2016 22:59:31 +0200
Message-ID: <20160726205930.GV23593@ks3360651.kimsufi.com>
References: <20160726114248.GR23593@ks3360651.kimsufi.com>
 <7f7312d4-bb78-17d9-3e10-5b7fbb603f23@baetzler.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=geekosphere.org;
	s=gos; t=1469566661;
	bh=ghn1Bz0nYKqcD6CRY1gmYMeknoelKqQWfVmuf3LPELY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Bc1h3FhRBy76NmITAUUMTLw0f5osbj/SG34Gx17ell3AZG3yibT7Smye5uIPzWixN
	 vDbKjpPPrMeS0eUyfulFI8VxXwT1ABb9dtj5DyFPbHTGOe8Bsz6vLNeV4itOu34C65
	 oNLp6ejIlTNMMqcWVgKDEB0eRq9tiZW+CItHYnwhL0HrAUQnMVXPYS8JboiPMjNJQx
	 zwXsbtpSRku7AZZcL4Nolvqk1RjNw1GhzidmnnN8Fp6VG69PACH3zx29LFfTwYRr+5
	 8nak2ow8DwdCk/CUoEpgFr8M9+2rHzbMGDxXQumVIDInOr0FQawboQpUbGWKm7RVMs
	 VXLbnOIytLg4w==
Content-Disposition: inline
In-Reply-To: <7f7312d4-bb78-17d9-3e10-5b7fbb603f23@baetzler.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 26/07/16 at 14:29, Thomas B=C3=A4tzler wrote:
> Hello Andreas,
>=20
> Am 26.07.2016 um 13:42 schrieb Andreas Herz:
> > we have a system with a huge amount of TCP ESTABLISHED connections =
but
> > all [UNREPLIED] that have the 5 days timeout from
> > nf_conntrack_tcp_timeout_established. Increasing conntrack_max is j=
ust
> > delaying the issue.
> >=20
> > I could run a script to get rid of them via cronjob but I found thi=
s in
> > the neftilter documentation:
> >=20
> >> The answer is easy: UNREPLIED entries are temporary entries, i.e. =
as
> >> soon as we run out of connection tracking entries (we reach
> >> /proc/sys/net/ipv4/ip_conntrack_max), we delete old UNREPLIED entr=
ies.
> >> In other words: instead of having empty conntrack entries, we'd ra=
ther
> >> keep some maybe useful information in them until we really need th=
em.
> >=20
> > (http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html)
> >=20
> > But I'm getting:
> >=20
> >> kernel: nf_conntrack: table full, dropping packet.
> >=20
> > Should this "garbage collection" still work or would it be a good i=
dea
> > to implement a dedicated and much smaller counter for those connect=
ions?
>=20
> I'm skirting your issue here, but have you tried:
>=20
> 	echo "0" > /proc/sys/net/netfilter/nf_conntrack_tcp_loose
>=20
> We've had a similar problem like you, where a partner's firewall woul=
d
> not ack FIN packets but rather send a TCP RST in reply, which would t=
hen
> create a phantom "ESTABLISHED/UNREPLIED" connection in conntrack. In =
our
> case we did not run into problems with conntrack overflowing, but rat=
her
> we saw our gateway sending RST packets for next SYN requests with the
> same source ip:port tuple.
>=20
> Setting this configuration key to zero made that problem go away.

So far this helps yes, also got the hint from Florian Westphal that wit=
h
newer kernels this issue should be better with that commit:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D6547a221871

Thanks for the hint!

--=20
Andreas Herz
