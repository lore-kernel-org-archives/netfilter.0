From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPSec Transport Mode
Date: Thu, 08 Jul 2004 01:53:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089244397.5054.2.camel@anduril.intranet.cartel-securite.net>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407072154.52923.Antony@Soft-Solutions.co.uk>
	 <20040707211122.GA15747@zion.homelinux.com>
	 <200407072242.09330.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407072242.09330.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@lists.netfilter.org>

Le mer 07/07/2004 =E0 23:42, Antony Stone a =E9crit :
> Also, if you can do transport mode with ESP, then it should work throug=
h NAT=20
> without problems, because the original packet gets encapsulated (as per=
 my=20
> previous explanation).

Nope.
Only ESP tunnel mode can go through NAT. The main difference between
transport mode and tunnel is that tunnel encapsulate the whole IP packet
when transport mode only encapsulate IP payload only (for IP destination
and IPSEC destination are the same).

If you try to do NAT, then you will modify IP header, and then TCP
checksum, which is ciphered will get false for it also include IP
adresses in its calculation.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

