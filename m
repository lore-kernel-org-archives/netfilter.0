From: P@draigBrady.com
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Wed, 14 Jul 2004 14:31:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F535C3.2050008@draigBrady.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90511B9@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90511B9@asimail2.alphanumeric.com>
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: 'Real Cucumber' <monkcucumber@yahoo.com>, netfilter@lists.netfilter.org

Jason Opperisano wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Dunno if this is relevant--but I had similar symptoms SSH-ing to an Ope=
nBSD
> SSH server through IPTables on RH running through an OpenVPN tunnel
> (RH/IPTables was the OVPN server)...  I didn't really spend the proper =
time
> troubleshooting what was actually causing it--so this may not apply to =
your
> situation at all... (enough disclaimers yet?)
>=20
> What fixed it for me was setting the following in sshd_config of the SS=
H
> server:
>=20
>   ClientAliveInterval 10
>   ClientAliveCountMax 6
>=20
> Again--no idea if this is of any value to anyone...

The corresponding settings for the client
(if you want to do it there instead) are:

serveraliveinterval 10
serveralivecountmax 6

client config is stored in ~/.ssh/config

P=E1draig.

