From: Maxim Britov <maxim.britov@gmail.com>
Subject: string seems doesn't work
Date: Thu, 27 Jul 2006 17:34:32 +0300
Message-ID: <20060727173432.3cea1a6f@maxim.office.modum.by>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_D4UZ.ZwkJu13ZON6epZV0.x;
	protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-bounces@lists.netfilter.org>
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

--Sig_D4UZ.ZwkJu13ZON6epZV0.x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I trying to use string. iptables 1.3.5 / kernel 2.6.18-rc2-ck1

iptables -A INPUT -p tcp -m string --algo kmp --string 112233 -j LOG
iptables -A INPUT -p tcp -m string --algo kmp --string ! 112233 -j LOG
iptables -A INPUT -p tcp -m string --algo kmp --hex-string 112233 -j LOG

I got worked first rule only.

Second rule never matches any packets. IMHO it should match any packet with=
out my string. I'm right?

Thirst rule iptables-save show as:
-A INPUT -p tcp -m string --string "112233" --algo kmp --to 65535 -j LOG
I think it transform my --hex-string into --string here. May I misunderstoo=
d some here?



--=20
Maxim Britov

GnuPG KeyID 0x4580A6D66F3DB1FB xmpp:maxim@modum.by icq 198171258
Fingerprint: 4059 B5C5 8985 5A47 8F5A 8623 4580 A6D6 6F3D B1FB
GnuPG-ru Team (http://lists.gnupg.org/mailman/listinfo/gnupg-ru
               xmpp:gnupg-ru@conference.jabber.ru)

--Sig_D4UZ.ZwkJu13ZON6epZV0.x
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIcBAEBAgAGBQJEyM7+AAoJEOS1BTjOtE8GbTsQAKIFVLIl6RzWrUmpygTb+GtX
2bKYVj5B5XcCc4qAUsW2kegMH7nu7Gka/z4wf0ph79hZxZK9wyIYRf1OKejG0qLf
Ww4ZFXJuEl2NaTTASqWAu0QPAVc37N1qdsZW0Ni6l7ew02pc9vP2VHjvDeaoHjy7
7MuePGTIUyl2EQtmC4QB5hE3zOHce/r6iV2n9M/hDbKcQ3PB3MPbPR2q9CGhGmTB
B0VDzwLjwXl4o/RvMeTVk6xZjVOcrAtklSJholi2xZVjuBXrYEXJDBtbg6Xwn4yL
mXn+kYHRxyN+3AiHSDjh/FvxyRnueUktDithzzwVeCoxdDeZ7NLbjS4obEnulOot
6MJ1mYisiJR435hkWX9mrix7RpVNJ7PNI2B+F5iCBh4OYMz1I/WJaorK97bw7fll
MtSXQ2rKdn7N/Mz1cqTRnT2I7woNJBC9TfUR6EONkZpCr9orXrf/9MySZIwhh218
X6THvjGXiv/NEExfCaBHgHN96p22bpcxQCHjtgEpI26h2ufyOvwdxRPBt0lC53cX
2DdPpp1AGAH13PQAoLNU2eFYAkoz/+d2fkML8REXRSD4QNubFxOa4bv7ZHujmTLM
kkS1RUEW60MwW+sL+jU1gVchGGfLhwqWS4DvGf7IrD19tPSFG4Sx9s3aMt7772NM
6YKdW1sDeLvmllz/kQZ7
=nF5l
-----END PGP SIGNATURE-----

--Sig_D4UZ.ZwkJu13ZON6epZV0.x--

