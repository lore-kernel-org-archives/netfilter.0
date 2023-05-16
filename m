From: Joshua Moore <j@jcm.me>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 07:59:40 -0700
Message-ID: <F42FAE74-FDFE-4DC8-896A-2CFBDCCB6D84@jcm.me>
References: <167f2029-5978-dffa-3cf2-0ede9ade4fdf@thelounge.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google; t=1684249192; x=1686841192;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CA9Ce/hJYPKxQzj2gWzk0c39w4wL56z1Ehmj8D1320E=;
        b=W3TpXlMEqAk/gHmI1+g92/PzV2RLJVL121G0doFpRr8WPZHFZivUXeauu91ebLdcqX
         CQ9dsPRBsPcx76G+BeqrBg7FnXOkAwsIMxiGn9d3NHdR81TIZEeiQLTDSXrG4wnUau5v
         e59A4gEhhMr1Bn99ep1MigGWksLWWmQP/AZVY=
In-Reply-To: <167f2029-5978-dffa-3cf2-0ede9ade4fdf@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>, netfilter@vger.kernel.org

Full cone isn=E2=80=99t about accepting incoming connections on the same pub=
lic IP:port and then translating to different local IPs. This is a misunders=
tanding. It=E2=80=99s about accepting connections from different REMOTE IPs a=
nd allowing it to the same local IP on the same original source port.

The practical purpose here is for a more transparent connection and allowing=
 NAT pinholes to poke a hole through the firewall so any destination on the I=
nternet can now communicate on that port to the host.

> On May 16, 2023, at 7:48 AM, Reindl Harald <h.reindl@thelounge.net> wrote:=

>=20
> =EF=BB=BF
>=20
>> Am 16.05.23 um 16:32 schrieb Joshua Moore:
>> =EF=BB=BF=E2=80=9CFull cone=E2=80=9D NAT simply means that there is no lo=
nger a strict connection tracking or enforcement of what IPs can connect bac=
k to the ports that are associated with the internal IP.
>> Traditional NAT:
>> - TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated TCP=
 source port 45619. All packets destined to port 45619 MUST come from 1.1.1.=
1.
>> Full cone NAT:
>> - TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated TCP=
 source port 45619. All packets destined to port 45619 are allowed from ANY I=
P.
>> Another word for this behavior is =E2=80=9Cendpoint independent=E2=80=9D N=
AT/filtering.
>=20
> but it can not work like that which don't make any sense:
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2
>=20
> offlist the OP pointed me to https://github.com/Chion82/netfilter-full-con=
e-nat where i ask myself who needs that nonsense which sounds to be written b=
y someone which hasn't more clues about networking/NAT the the OP
>=20
> Implementation of RFC3489-compatible full cone SNAT
> https://www.rfc-editor.org/rfc/rfc3489 =3D STUN
>=20
> >> iptables -t nat -A POSTROUTING -o eth0 -j FULLCONENAT
> >> #same as MASQUERADE
>=20
> so who needs that module?
>=20
> >> iptables -t nat -A PREROUTING -i eth0 -j FULLCONENAT
> >> #automatically restore NAT for inbound packets
>=20
> restore WHAT based on WHAT for new packets?
>=20
> it's simple: when you only have a single public IP there is no way to acce=
pt NEW incoming packets to different local machines without explicit port-fo=
rwarding
>=20
> and ESTABLISHED/RELATED is the job of conntrack
>=20
>>>> On May 16, 2023, at 4:46 AM, Kevin P. Fleming <lists.netfilter@kevin.km=
6g.us> wrote:
>>>=20
>>> =EF=BB=BFOn Tue, May 16, 2023, at 07:07, Shane Wang wrote:
>>>> Thanks for your reply.
>>>> I think the "--to-destination 10.0.0.1" rule will be matched, and the
>>>> "--to-destination 10.0.0.2" rule will never be matched.
>>>> Does iptables unsupported "full cone" NAT for multiple internal IP addr=
esses?
>>>=20
>>> Does *any* platform support such a configuration? Based on my understand=
ing of what 'full cone' means, every internal address needs a separate exter=
nal address to be fully mapped to it. Your example shows that you have one e=
xternal address,=20
