From: Luis Miguel Cruz <luismi@b2bi.es>
Subject: Re: unclean rule
Date: Fri, 11 Jun 2004 13:35:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C9990E.7040607@b2bi.es>
References: <40C99279.7010404@b2bi.es> <20040611142655.141a8084.grisha@unixro.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040611142655.141a8084.grisha@unixro.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

I asked it because I remember that in the past this module have a lot of=20
problems, I like to know if those problems are solved now.

I have a problem with a client, he can=B4t do a ftp to our servers :P
The traffic match unclean rule:

iptables -A SEGURIDAD -m unclean -j DROP

All traffic must across SEGURIDAD chain, I only have problems with ftp=20
service and this client, the rest of the services runs perfectly for him.

What can be wrong? the client=B4s adsl router? :P


Raileanu Grigore wrote:

> On Fri, 11 Jun 2004 13:07:37 +0200
> Luis Miguel Cruz <luismi@b2bi.es> wrote:
>=20
>=20
>>Is safe to use unclean module?
>>
>>--
>>Luis Miguel Cruz
>>
>>
>=20
>=20
> Yes, you can discard without any problems unclean packets.
>=20

