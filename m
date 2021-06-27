From: Stephen Satchell <list@satchell.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 11:29:33 -0700
Message-ID: <ba276a9b-cb54-030f-a43d-daf2e92e3ec6@satchell.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <291b9611-62ed-6000-6d4b-36d4b9196698@att.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <291b9611-62ed-6000-6d4b-36d4b9196698@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 6/27/21 7:56 AM, slow_speed@att.net wrote:
> A most fundamental part of learning is asking questions.=C2=A0 That is wh=
at=20
> I'm doing here.
>=20
> And I'd still like some verification of the exact command to reload the=20
> tables.

iptables-reload
ip6tables-reload

I explained about the usage of these two programs.  The man pages=20
describe all the options.

 From my previous e-mail:

> Assuming that you have previously used
> "iptables-save >/root/iptables.ipv4" and
> "ip6tables-save >/root/iptables.ipv6",
>=20
> then you can reload the tables using
> "iptables-restore </root/iptables.ipv4" and
> "ip6tables-restore </root/iptables.ipv6"
>=20
> Note that a save does not save the state of /proc/sys/net variables (like=
 /proc/sys/net/ipv4/ip_forward), and consequently restore doesn't change th=
e state of /proc/sys/net variables.
>=20
> When I have written scripts to handle this sort of stuff, I handle /proc/=
sys/net/ipv4/ip_forward and /proc/sys/net/ipv6/conf/*/forwarding myself.  T=
o make a reload as atomic as possible, I first turn off forwarding, the iss=
ue the two restore commands, then set the /proc variables to their saved va=
lues.
