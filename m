From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: rules for skype
Date: Mon, 02 May 2005 03:32:48 +0200
Message-ID: <42758340.9080306@lopsch.com>
References: <90ba0390f499.90f49990ba03@vsnl.net>	<a0f69e50505010246227a187f@mail.gmail.com>	<42755162.4090509@riverviewtech.net>
	<4275699E.1080102@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4275699E.1080102@danbbs.dk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Mogens Valentin schrieb:
> Taylor, Grant wrote:
>=20
>>> iptables -A FORWARD -p tcp --dport SKYPEPORT -j ACCEPT
>>
>>
>>
>> <devilish @^*% eating grin> He, Skype does not have a port (per say).=20
>> </devilish @^*% eating grin>
>>
>> Skype will use just about any port that it can use (all the standards=20
>> you would think for internet traffic) to connect to any ""super node=20
>> that it can connect to.  unfortunately what qualifies as a Super Node=20
>> is any node / computer that is running Skype that is directly=20
>> connected to the internet with out a firewall that would inhibit other=
=20
>> systems from connecting directly to it.
>=20
>=20
> No wonder, since Skype is based upon the methods as used for Kazaa.
> Damn thing to deny too, as is many other sharing apps...
> AFAIR I found it slightly easier blocking such using ipchains explicit=20
> in/out/forward rules, than with iptables and ESTABLISHED,RELATED rules.
>=20
>> Do a Google for "Skype Protocol" and see what you find.  I have a PDF=20
>> on it at the office that I'd be happy to send you.  (If you want this=20
>> PDF I'll find the URL to it and post it to the list or email=20
>> individually as I don't think the list would like a PDF sent to it.) =20
>> The only way that I've heard to even slow down Skype is to force it to=
=20
>> pass through a proxy, beyond that nothing, that I have heard of or=20
>> read about, will stop it.
>=20
>=20
> Mind adding me to that list? If so, thanks a lot!
>=20
Mhm Kazaa can be blocked by IPP2P for example. But Skype=B4s payload is=20
encrypted what makes it way more difficult or impossible. But what about=20
NUFW doesn=B4t it authenticate upon application? I would like to receive =
a=20
copy of that PDF too please :).

