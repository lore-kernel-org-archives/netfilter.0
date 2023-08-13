From: Joshua Moore <j@jcm.me>
Subject: Re: Iptables and DDoS attacks
Date: Sun, 13 Aug 2023 17:07:33 -0400
Message-ID: <30DBBFA4-8D58-4400-8531-50EB288D1CAB@jcm.me>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google; t=1691960869; x=1692565669;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MslndnfOuiGzJ0FtoKXLolua9qkC4BxG8Mh+8NzjhaM=;
        b=grWeeYnYMUj2EIGx7It1zyO5KOKj0SoFLMImQRFPil/Iq+wxB/7uuZxJQXE4r6R+Cl
         6PUdDQ+UyD0RAgM+WKstNXOmZ8naPPXASzQnoccBRkL1EWV2Yg6aA1SFX9JSwMzxNQHy
         pexsqDRUNv0Sm9lDM657o/bbXcXRzwN9Kg9oI=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8-sig"
To: Hack3rcon@mail2tor.com
Cc: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

=EF=BB=BFFor volumetric attacks (bandwidth), hardware routers/firewalls expo=
rt flow analytics to a flow analyzer which then in turn has detection logic w=
hich triggers scripts. One example is triggering a script for a remotely tri=
ggered black hole (RTBH) which signals to upstream ISPs to drop traffic to t=
he destination /32 host that is attacked. Other mitigation mechanisms includ=
e triggering traffic to be redirected to a scrubbing server to consume the a=
ttack and =E2=80=9Cscrub=E2=80=9D the traffic clean and to redirect traffic t=
o a low bandwidth =E2=80=9Cgarbage=E2=80=9D ISP connection intended to drop t=
he attack at the edge.

In all cases, you cannot stop the attacks with simple iptables/nftable rules=
 because they by nature need to drop packets AFTER they hit the wire which i=
s too late.

The *right* solution for you would all depend on your network and goals. Hap=
py to discuss more if you want to ping my company email directly as we imple=
ment this kind of thing regularly: jmoore@archous.tech

> On Aug 13, 2023, at 4:23 PM, Hack3rcon@mail2tor.com wrote:
>=20
> =EF=BB=BF
>>> Am 10.08.23 um 09:16 schrieb Hack3rcon@mail2tor.com:
>>> Hello iptables Team,
>>> Is it possible to protect a server against DDoS attacks using iptables?
>> depends on the attack - if it's bandwith *nothing* on your side can do
>> anything against it
>> for request-based attacks xt_recent for ratelimits works well
>=20
> Hello,
> Thank you so much for your reply.
> How do hardware firewalls that use Linux prevent these attacks?
>=20
> Can you show me some iptables rules about limitation?
