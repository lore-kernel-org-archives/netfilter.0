From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: forwarding internet connection
Date: Wed, 02 Mar 2005 13:34:58 +0100
Message-ID: <4225B2F2.1020303@mnemon.de>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>	<4f3930a7050130194460efd21a@mail.gmail.com>
	<00c501c51f13$4aab30e0$0b01a8c0@dap.edu.ph>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00c501c51f13$4aab30e0$0b01a8c0@dap.edu.ph>
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
Hi,

as far as I unstand your posting, you want to forward traffic based on
the source IP of the client. So, some clients should use ISP1 and some
ISP2. You could write per client:

## Rewriting destination address
iptables -t nat -A PREROUTING -s $IP_OF_CLIENT -j DNAT --to $IP_ISP2

## Allow forwarding of connections
iptables -A FORWARD -s $IP_OF_CLIENT -d $IP_ISP2 -m state \
- --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d $IP_OF_CLIENT -s $IP_ISP2 -m state \
- --state ESTABLISHED,RELATED -j ACCEPT

## Maybe you need SNATing. If so:
iptables -t nat -A POSTROUTING -s $IP_OF_CLIENT -d $IP_ISP2 -j SNAT
- --to-source $IP_ISP1

May be, you can additionally add interface or protocol specifications
or the like. I don't know, because your exact network layout is unknown.

A very good tutorial on iptables is here:

http://iptables-tutorial.frozentux.net/chunkyhtml/index.html

Have a nice time,

J=F6rg

elg3ne schrieb:

| Hi guys...Im new to iptables please help me with my problem...
|
| How do I forward incoming traffic to a diffent machine? example is
| that I have 2 ISP 1 is primary & the other 1 is backup only... Now
| I want to utilize the backup ISP because it is not being used...
|
| I dont want to make changes per PC to PC just to change their
| gateway or proxy to use the backup ISP...
|
| How do I forward the incoming request to my primary ISP to 2nd ISP?
|
|
| For example client has 192.168.1.11 IP and I want the IP to use the
| 2nd ISP instead the 1st ISP..
|
| Btw Im using squid to access the internet for my client.
|
| Sorry if my explanation is not good...but I hope someone could help
| me...
|


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
iD8DBQFCJbLyt9fkjiZ7IE8RAlYQAKCXvDV8MfHDaIH6GJa1jay56A+t2ACdFZ7w
MlbrDGj7qFY14xeWA+ULBB4=3D
=3D+e3D
-----END PGP SIGNATURE-----



