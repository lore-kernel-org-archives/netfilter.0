From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IP masquerading and second ISP line questions
Date: Sun, 16 May 2004 21:12:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084734720.1783.97.camel@anduril.intranet.cartel-securite.net>
References: <E1BPPQK-0003pm-At@vishnu.netfilter.org>
	 <200405161954.15392.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405161954.15392.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Le dim 16/05/2004 =E0 20:54, Antony Stone a =E9crit :
> I'm not aware of this "common problem", however I only use IPsec (throu=
gh NAT)=20
> in tunnel mode between networks, not in transport mode with a client-ga=
teway=20
> arrangement.

<FYI>
NAT obviously breaks IPSEC using AH header, and it also breaks transport
mode ESP.
When you set transport mode ESP, you don't cipher packet header for the
IPSEC destination (declared as IPSEC gateway) is the same than the
encapsulated packet destination, so only IP payload is ESP encapsulated.
For TCP/UDP checksum is computed against a pseudo header that includes
IP source and destination, NAT breaks checksum for pseudo header, after
ESP decasulation, has been modified. TCP is for the more affected as it
is not very wise to desactivate checksum verification just like it is
possible for UDP.
</FYI>

However, there's often a way to work aournd this kind of issue using a
tunnel mode by adressing packets to an aliased IP.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

