From: prmarino1@gmail.com
Subject: Re: best distro to build iptable firewall
Date: Thu, 24 Dec 2015 02:01:03 -0500
Message-ID: <20151224070103.5251155.57850.21355@gmail.com>
References: <CAPgF-fpEK=-AuP5Mtqddkgh2U8BMC8hKVb_2Mt7MJQNJ4cu8wg@mail.gmail.com>
 <20151223180630.61b8d238@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :subject:from:in-reply-to:references:to;
        bh=XidUELZftGTW4HhONnS29pcjTawalwjFdyjZUJqyPx0=;
        b=COcstXvU0mfgEiAHRh4aIcIzR9jC/k+qRcUYEpu3E7TaLuLPlI/n3fBciW8QX3eTvH
         f9L0vR/i7WdRUOWfn9T1XNZZG7rV7wCZiVdfk3tKX+9Xn6/q/6qQOtbmTNygfp1ntjlY
         U8RDfyKg5fq0swlLFNkCshvvlZBWmK3Pph1NgXtbJb/ZL2V2ljLKaMI7QF6L/tlZsNta
         uVq7pbHQbFIXSNeEMH74ujbZeBUKPyJ+R3f5mG/6fJZPMJGZppuTNsYgZLIDJ692dApf
         nz51hcKPeLzLiAb6zAyzBIFVEvRvCjnboZm8PLPLiJMB/iePXJaTN115P52m1qLwxOKJ
         PGQg==
In-Reply-To: <20151223180630.61b8d238@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, netfilter@vger.kernel.org

To deal with bursts you should always us a 64 bit version of linux for =
a firewall.
Also the last firewalls I built were RHEL 6 with contrack tools added f=
or clustering.

It's a little behind but not far off. You will also want the HA add on.=
 CentOS or Scientific linux would work as an option too.
=46edoras a little more up to date but not as stable=E2=80=8E. Do not u=
se distros like Ubuntu because their focus is more for the desktop mark=
et and will install many things you don't need which weakens the securi=
ty of your firewall. Also if you do use RHEL do the install from a kick=
start and do a nobase install so you only get the bare minimum OS.=C2=A0

That said smoothwall is not a bad choice but it's a bit inflexible in s=
ome ways. Also I wouldn't use an ATOM processor for an number of reason=
s mostly because it would have issues with handling microbursts.
=E2=80=8EThat said a cheap $500 dollar desktop ( including the three ye=
ar warranty) will do especially if you add in an Intel Quad card.

=E2=80=8E
On Wed, 23 Dec 2015 15:29:17 -0500
Satish Patel <satish.txt@gmail.com> wrote:

> All,
>=20
> I am planning to build dedicated firewall for network and wonder whic=
h
> OS will be idle and best for dedicated firewall machine?
>=20
> Its going to handle around 500mbps traffic peak.. so i need something
> solid and secure, which won't crash...

(I know this sounds like an advertisement, but Satish *did* ask. And I =
*am* working to integrate the just-released iptables v1.6.0.)

If you intend to filter SSL (via MITM), HTTP, HTTPS through clamav, fil=
ter URLs for 'appropriateness', and run Snort to identify incoming thre=
ats, *at 500Mb/s*, you will need at least 2GiB of fairly fast RAM and a=
 fast quad-core CPU.

You don't need to build a dedicated firewall. Smoothwall Express v3.1 i=
s already available:
- i586 or x86_64
- SMP
- web-based UI
- linux v3.4.110
- iptables v1.4.21
- ipset v6.19
- gcc v4.7.3
- glibc v2.18
- binutils v.2.22
- runs snort, clamav, squid
- as a plain firewall, easily handles 4 NICs at constant 950Mb/s on a
dual-core Atom N270. (clam/ids/squid filtering is a different story.)
- improved build system makes it easy to add pkgs
- script-based 'advanced installer' make it easy to hack and debug
installation problems
- hooks to make many mods 'non-invasive'

Except for a stupid mistake on my part (I introduced a memory leak when=
 I converted iptACCOUNT to 64-bit counters), v3.1 has been very stable.

I'm presently working on v3.2 preliminaries:
- linux v3.14.58
- iptables v1.6.0
- ipset v6.27
- eudev v3.1.5
It just built and the iso/flash images assembled. It installed and boot=
ed (in a KVM) without trouble. So far, the firewall seems OK. But I do =
expect to encounter a few incompatibilities with iptables v1.6.0.=20

We're working to overcome years of development neglect. I spent five ye=
ars improving the build system, modernizing Express' 'foundation', poli=
shing the UI a little bit, and stumbling upon and fixing many little bu=
gs from the original v3.0; v3.1 was the result. Somewhere in there, I w=
as appointed project leader. There is still room for improvement in the=
 UI and in the features; this will be the main focus during 3.2's devel=
opment.

Unless it's a learning exercise, if you want to save yourself a lot of =
time and trouble, visit us at http://community.smoothwall.org.

Neal
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html
