From: <imnozi@gmail.com>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 14:36:18 -0400
Message-ID: <20230516143618.6ad67810@playground>
References: <167f2029-5978-dffa-3cf2-0ede9ade4fdf@thelounge.net>
        <F42FAE74-FDFE-4DC8-896A-2CFBDCCB6D84@jcm.me>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684262182; x=1686854182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gA/ZhK6rG1w7UVEKWB315CkZf+v0mhXE8jp3JzXj7E=;
        b=pd9n7qvS1PL27YiPlclBotRTByA80goGg+6VR3nBEb4ZMDEHGq/g1Y/9jIlIAU74nM
         FWNdilFyNvTt1MK4cEMkJ2KSkYdwo7TW9JNOWYPGihrcJVVdo/PLtzYd6Smf/7NWiMUE
         aS961AlI9IKUwZzB31w20+/Jv2Yx+vTn6sbbmZxzFEejffioWNvOs0lBgKjBSgJToR9o
         vobxP7ei1G+Rl/vAfKZ27vLo4DpDiovdA8J5+7Ge0Klr62V4xf3JZaSRlgJt2OgC5Sv4
         VbWA4lxfQxp3RmrjCSOiZeo4C5Q4/Oay2QQzsD3GcOcxUWFkusJE3nq0kBbkEH+74q0L
         f3Ow==
In-Reply-To: <F42FAE74-FDFE-4DC8-896A-2CFBDCCB6D84@jcm.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Joshua Moore <j@jcm.me>
Cc: netfilter-devel@vger.kernel.org, Reindl Harald <h.reindl@thelounge.net>, "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>, netfilter@vger.kernel.org

Would an example of full cone NAT be the following?
  - Site A uses 192.168.100.0/24 internally
  - Site B uses 192.168.100/0/24 internally
  - There is a VPN between the two sites
  - Site A addresses hosts at Site B using 10.168.255.0/24
  - Site B addresses hosts at Site A using 10.168.1.0/24
  - Site A SNATs packets sent from 192.168.100.0/24 to 10.168.1.0/24, and S=
ite B
    DNATs packets sent to 10.168.255.0/24 to 192.168.100.0/24
  - Site B SNATs packets sent from 192.168.100.0/24 to 10.168.255.0/24, and=
 Site A
    DNATs packets sent to 10.168.1.0/24 to 192.168.100.0/24

The result is that packets at either site have a 192.* and a 10.* address, =
and packets in transit between the sites have only 10.* addresses. In short=
, each site uses the same LAN address and cannot ordinarily exchange packet=
s using normal packet routing. But they *are* able to exchange packets by u=
sing full-cone NAT to translate their addresses to and from intermediary LA=
N addresses.

Full cone NAT allows Linux to do the impossible right away.

N


On Tue, 16 May 2023 07:59:40 -0700
Joshua Moore <j@jcm.me> wrote:

> Full cone isn=E2=80=99t about accepting incoming connections on the same =
public IP:port and then translating to different local IPs. This is a misun=
derstanding. It=E2=80=99s about accepting connections from different REMOTE=
 IPs and allowing it to the same local IP on the same original source port.
>=20
> The practical purpose here is for a more transparent connection and allow=
ing NAT pinholes to poke a hole through the firewall so any destination on =
the Internet can now communicate on that port to the host.
>=20
> > On May 16, 2023, at 7:48 AM, Reindl Harald <h.reindl@thelounge.net> wro=
te:
> >=20
> > =EF=BB=BF
> >  =20
> >> Am 16.05.23 um 16:32 schrieb Joshua Moore:
> >> =EF=BB=BF=E2=80=9CFull cone=E2=80=9D NAT simply means that there is no=
 longer a strict connection tracking or enforcement of what IPs can connect=
 back to the ports that are associated with the internal IP.
> >> Traditional NAT:
> >> - TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated =
TCP source port 45619. All packets destined to port 45619 MUST come from 1.=
1.1.1.
> >> Full cone NAT:
> >> - TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated =
TCP source port 45619. All packets destined to port 45619 are allowed from =
ANY IP.
> >> Another word for this behavior is =E2=80=9Cendpoint independent=E2=80=
=9D NAT/filtering. =20
> >=20
> > but it can not work like that which don't make any sense:
> > iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
> > iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2
> >=20
> > offlist the OP pointed me to https://github.com/Chion82/netfilter-full-=
cone-nat where i ask myself who needs that nonsense which sounds to be writ=
ten by someone which hasn't more clues about networking/NAT the the OP
> >=20
> > Implementation of RFC3489-compatible full cone SNAT
> > https://www.rfc-editor.org/rfc/rfc3489 =3D STUN
> >  =20
> > >> iptables -t nat -A POSTROUTING -o eth0 -j FULLCONENAT
> > >> #same as MASQUERADE =20
> >=20
> > so who needs that module?
> >  =20
> > >> iptables -t nat -A PREROUTING -i eth0 -j FULLCONENAT
> > >> #automatically restore NAT for inbound packets =20
> >=20
> > restore WHAT based on WHAT for new packets?
> >=20
> > it's simple: when you only have a single public IP there is no way to a=
ccept NEW incoming packets to different local machines without explicit por=
t-forwarding
> >=20
> > and ESTABLISHED/RELATED is the job of conntrack
> >  =20
> >>>> On May 16, 2023, at 4:46 AM, Kevin P. Fleming <lists.netfilter@kevin=
.km6g.us> wrote: =20
> >>>=20
> >>> =EF=BB=BFOn Tue, May 16, 2023, at 07:07, Shane Wang wrote: =20
> >>>> Thanks for your reply.
> >>>> I think the "--to-destination 10.0.0.1" rule will be matched, and the
> >>>> "--to-destination 10.0.0.2" rule will never be matched.
> >>>> Does iptables unsupported "full cone" NAT for multiple internal IP a=
ddresses? =20
> >>>=20
> >>> Does *any* platform support such a configuration? Based on my underst=
anding of what 'full cone' means, every internal address needs a separate e=
xternal address to be fully mapped to it. Your example shows that you have =
one external address,  =20

