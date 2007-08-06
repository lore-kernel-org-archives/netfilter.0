From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: SYN/ACK and NEW packets
Date: Mon, 6 Aug 2007 20:20:27 +0200
Message-ID: <20070806182027.GA11849@sid.toystory.lan>
References: <20070804192109.GB4205@sid.toystory.lan>
	<web-22036612@bk3.webmaillogin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <web-22036612@bk3.webmaillogin.com>
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
To: netfilter@lists.netfilter.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 4 Aug 2007 21:21:09 +0200
>  Franck Joncourt <franck.joncourt@wanadoo.fr> wrote:
>> Hi,
>> Looking at this :
>> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#SYNACKANDN=
EW
>> I understand that in order to prevent my ip address from being spoofed,
>> I should reject NEW packets with the SYN/ACK flags set and the others
>> cleared.
>> However, with the following nmap command I have tried to check it out :
>> nmap --scanflags SYNACK 192.168.0.1
>> all packets are known to be in the INVALID state rather than in the NEW
>> state.
>> state NEW tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 0 packet
>> state INVALID tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 170 packets
>> They talk about sequence number, as well, in the document, but I can't
>> figure out what difference it makes.
>> Did I miss anything ?

On Sat, Aug 04, 2007 at 02:26:12PM -0600, Jorge Davila wrote:
> Well, in the three-way handshake the flags in the packets are:
>
> 1) syn packet sent by the client
> 2) syn,ack sent by the server
> 3) ack sent by the client

So far, I agree :p!

> The packets in the NEW state for a statefull firewall (as iptables) are=
=20
> packets that belongs to a new "data stream", marked with the syn flag.

What about sending packets with only the ACK flag set.

Those packets matched the following rule every time on random ports :

iptables -A INPUT -m state --state NEW \
	-p tcp SYN,FIN,RST,ACK ACK -j RETURN

using nmap --scanflags ACK 192.168.0.1

So, there is something wrong since I did not send any SYN packets. 530
packets send and 530 packets matched. And none of them are part of a
connection.

> The packets in the INVALID state are packets, in your case specifically,=
=20
> that implies a new "data stream" (or more properly, packets that does not=
=20
> belongs to a connection previously ESTABLISHED or to a connection RELATED=
=20
> to a connection previously ESTABLISHED) but this new "data stream" is not=
=20
> negotiating for open a new socket, is just sending "data".

I understand what you mean, I hope so. The flags SYN/ACK are not
sufficent to be matched as a NEW state since there is nothing in the
data stream "to negotiate for a new socket".

>
> In fact, there are 0 packets with the state NEW with the flags=20
> FIN,SYN,RST,ACK/SYN,ACK because the packets that you sent does not have t=
he=20
> right flags to be considered a valid packets to open a new connection.

Ok.

Do not worry about the ACK packets, unless you have an explanation and
the time to put it down. There must be something in the RFC 793 about
it.

Thanks

I apologize for the delay, but I saw your message when I was sorting
out my spams.

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGt2ZrxJBTTnXAif4RAraeAKCRhdfjtms64bp4GwseDXNp1ljaYgCg1SBq
xpj0liVFiGJmJhIsgOIrqAw=
=4HLc
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--


