From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPSec Transport Mode
Date: Fri, 09 Jul 2004 18:13:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089389598.2111.33.camel@anduril.intranet.cartel-securite.net>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407071453.49223.Antony@Soft-Solutions.co.uk>
	 <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407072154.52923.Antony@Soft-Solutions.co.uk>
	 <1089387536.4237.20.camel@PCA-ARNSTR.ee-consultants.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089387536.4237.20.camel@PCA-ARNSTR.ee-consultants.de>
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
To: Rainer Arnst <Rainer.Arnst@ee-consultants.de>
Cc: NetFilter Mailling List <netfilter@lists.netfilter.org>

Le ven 09/07/2004 =E0 17:38, Rainer Arnst a =E9crit :
> I tried to work with that, but failed to produce the desired results,
> which were to enable IPSec transport mode packets to pass through the
> firewall not being NATed.
[...]
> Got anyone any ideas?

Yes, I got one I previously explained. IPSEC transport mode can't cope
with NAT if you do TCP. ESP transport port only encapsulate IP packet
payload (layer 4) as opposed to ESP tunnel which encapsulate full IP
packet.

When you do NAT, you alter IP source and/or destination. But TCP
checksum includes IP addresses, which means you have to recompute it on
the fly when NATing. Anf for it is ciphered, you can't.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

