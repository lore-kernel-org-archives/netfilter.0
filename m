From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: more limiting fun
Date: Fri, 11 Feb 2005 17:09:07 +0100
Message-ID: <420CD8A3.3070003@mnemon.de>
References: <Pine.LNX.4.53.0502110936210.1996@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0502110936210.1996@altaica>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Tib wrote:

| Ok, I've done some fiddling but still have some issues. I went with
| some recommendations on what people said and here's what I have.
| The first three rules of my startup set are as follows:
|
| iptables -A INPUT -i eth0 -p tcp --dport 22 -m state \ --state
| ESTABLISHED -j ACCEPT

So your OUTPUT policy is ACCEPT and you have no rule there saying that
SSH is forbidden - really ? And you start the connection from the
firewall box ? If so (and you do no filtering in mangle and nat) it
should work. So I believe that you want to connect *to* your firewall
box and not *from*. Then you need something like

iptables -A INPUT -i eth0 -p tcp --dport 22 -m state \
~   --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 2 -m state \
~   --state ESTABLISHED -j ACCEPT


Or an OUTPUT policy of ACCEPT. That should do it.

|
| iptables -A INPUT -i eth0 -p tcp --destination-port 22 -m limit \
| --limit 15/hour --limit-burst 5
|
| iptables -A INPUT -i eth0 -p tcp --destination-port 22 -j DROP
|
|
| This places (as directed), the established-accept rule first, my
| limit preferences second, and the drop last.
|
| The problem is that it still does exactly what it did before,
| namely that it doesn't respond at all once those rules are in
| place. Anyone have an idea what's going on? I know my ssh port
| isn't getting hammered THAT hard.
|
| <EOL> Tib


Have a nice time

Joerg

- --
- -----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCDNiit9fkjiZ7IE8RAuJSAJ9gpdygBJ9eb1rQARINr9NePPVvlACeMf/H
R2H+NPj9n+5I2Yl+mGvd5C4=3D
=3DebHg
-----END PGP SIGNATURE-----



