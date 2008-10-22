From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: tool to search within cidr blocks
Date: Wed, 22 Oct 2008 18:07:31 -0500
Message-ID: <48FFB233.1070706@riverviewtech.net>
References: <004301c9347c$6ab0a3c0$4011eb40$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004301c9347c$6ab0a3c0$4011eb40$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/22/2008 2:28 PM, Joey wrote:
> I have several ranges of IP=92s being put into iptables.
> The IP ranges look like this:
> 62.29.0.0/17
> 62.68.192.0/19
> 62.108.64.0/19
> 62.244.192.0/18
> 62.248.0.0/17
> 77.67.128.0/17
> 77.72.184.0/21
> 77.73.216.0/21
> 77.75.32.0/21
> 77.75.216.0/21
> 77.79.64.0/18
> 77.92.0.0/19
> 77.92.96.0/19
> 77.92.128.0/19
> 77.223.128.0/19
> 77.245.144.0/20
> 78.40.224.0/21
> 78.111.96.0/20
> 78.135.0.0/17
>=20
> I am blocking a specific IP from the firewall as logged in messages=20
> 71.74.56.125.=20
> In looking at each block of ip=92s and using a CIDR calculator I can=92=
t figure=20
> out what range it=92s really coming from.  The list I have is pretty =
huge.=20
> Is there a tool or a way to ask iptables what rule it matches?  Based=
 on all=20
> my calculations I don=92t have anything declared that would block tha=
t IP.
>=20
> Thanks!

Um, 71.74.56.125 is not part of any of the Class A ranges that you are=20
blocking (62., 77., 78.).  So... that sort of implies that something=20
else is blocking it.

Do you care to provide the (sanitized) output of an 'iptables-save' for=
=20
us to look at?



Grant. . . .
