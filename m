From: Joshua Moore <j@jcm.me>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 07:32:21 -0700
Message-ID: <85A81DAD-299F-4B08-8F5F-4D8D0BAB042B@jcm.me>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google; t=1684247553; x=1686839553;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kBI/PoszwyqfihBYxi+tuizDOjlv1dCM5TgD6HkckQ=;
        b=ALYKWyNqdzslDS0GH5ppa4PPcvxHQomaekM37W5ZqdHtfc+clVcAgy7XbVbjhMIZ1p
         R9BZQL8AzENv69m/BBbpPUcnmGJcGKR5SQ5YEoc+rklRcfyC4iSInxuqw6BVekCnBg2G
         0/L8R0201H99F1YuxWCthpWLtuMlRBZTPqlUQ=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8-sig"
To: "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Cc: netfilter@vger.kernel.org

=EF=BB=BF=E2=80=9CFull cone=E2=80=9D NAT simply means that there is no longe=
r a strict connection tracking or enforcement of what IPs can connect back t=
o the ports that are associated with the internal IP.

Traditional NAT:
- TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated TCP so=
urce port 45619. All packets destined to port 45619 MUST come from 1.1.1.1.

Full cone NAT:
- TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated TCP so=
urce port 45619. All packets destined to port 45619 are allowed from ANY IP.=


Another word for this behavior is =E2=80=9Cendpoint independent=E2=80=9D NAT=
/filtering.

> On May 16, 2023, at 4:46 AM, Kevin P. Fleming <lists.netfilter@kevin.km6g.=
us> wrote:
>=20
> =EF=BB=BFOn Tue, May 16, 2023, at 07:07, Shane Wang wrote:
>> Thanks for your reply.
>> I think the "--to-destination 10.0.0.1" rule will be matched, and the
>> "--to-destination 10.0.0.2" rule will never be matched.
>> Does iptables unsupported "full cone" NAT for multiple internal IP addres=
ses?
>=20
> Does *any* platform support such a configuration? Based on my understandin=
g of what 'full cone' means, every internal address needs a separate externa=
l address to be fully mapped to it. Your example shows that you have one ext=
ernal address, which means you can only provide 'full cone' mapping for one i=
nternal address, no matter which tool you use.
