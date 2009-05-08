From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Block outgoing spam from a network using iptables?
Date: Fri, 08 May 2009 17:52:32 +0200
Message-ID: <4A045540.5080201@unipex.it>
References: <E83DD376-AB3F-472D-B8DF-18F37B27D788@insto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E83DD376-AB3F-472D-B8DF-18F37B27D788@insto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?windows-1252?Q?Fredrik_Str=F6mberg?= <stromberg@insto.org>
Cc: netfilter@vger.kernel.org

=46redrik Str=F6mberg wrote:
> Hello,
>=20
> I want to block spam that goes out through the gateway, namely, I=20
> want to block certain traffic to dport 25.

> I don=B4t expect a complete solution, just suggestions and hints.=20
> Although, a complete solution would be nice to study and learn from,
>  if someone here is able to do it.
>=20

Like now I do the same job with iptables, some per user match rules and
a python parser that make the control of the "iptables -nvL && iptables
-Z" output and send an email to user if the limit are passed

> Maybe logging how many emails is impossible. If so, what is the best
>  solution you can think of that doesn=B4t involve scanning the
> contents?
>=20
>=20

a simple iptables -A FORWARD -p tcp --dport 25 -m state --state NEW -j
log --log-prefix "NEW EMAIL" or something like this

> I found this but I don=B4t understand how it does what he says it doe=
s.
>  - http://marti.dimerge.net/blog/tag/ipt_recent :
>=20
> modprobe ipt_recent ip_list_tot=3D32 #ip_list_tot - defines the size =
of
>  ip_recent file iptables -A FORWARD -p tcp =96dport 25 -m recent =96n=
ame
>  SMTP =96seconds 30 =96update -j DROP iptables -A FORWARD -p tcp =96d=
port
> 25 -m limit =96limit 1/second =96limit-burst 5 -j LOG =96log-level in=
fo=20
> =96log-prefix =93smtp-log =94 iptables -A FORWARD -p tcp =96dport 25 =
-m=20
> recent =96name SMTP =96set -j ACCEPT
>=20

what's to understand?  if someone send more than one email into the nex=
t
30 seconds, the match extension will drop it
have you read the iptables -> recent man page?

Michele

