From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: discard TCP SYN
Date: 06 Aug 2003 14:43:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060173789.1669.113.camel@kermit>
References: <000001c35c0e$5ba651f0$c800a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c35c0e$5ba651f0$c800a8c0@klintan.local>
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
To: Michael K <micke@klintan.se>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-06 um 13.32 schrieb Michael K:
> My firewall have default policy to drop (in, out & fwd)
> Some protocols are open for communications, such as tcp/80, ftp/21 from
> the internet
> Then I use stateful inspection, accepting estabished,related.
> However, the nessus scanner is reporting this:
> -----
> The remote host does not discard TCP SYN packets which
> have the FIN flag set.
>=20
> Depending on the kind of firewall you are using, an
> attacker may use this flaw to bypass its rules.

The better solution would be to only accept SYN Packets which actually
are SYN packets.
iptables -A FORWARD -p tcp --syn -m state --state NEW -s whatever -j
ACCEPT

But ....
This SYN/FIN stuff comes from an old packetfilter implementation which
implemented a very simple SYN test:
Is only the SYN-Bit set? Yes, then it is a SYN-packet!
If you relied on this test to implement the firewall-rules on this
non-stateful packetfilter, you would create two rules:

Allow everything from the inside to the outside including SYN.
Allow everything from the outside to the inside but SYN.

Now, TCP-connection could only be initiated (meaning a SYN could be
send) from the inside, right? No, you could send a SYN from the outside,
once you have figured out that you needed a second flag set.=20
Well, I wonder what happens if you use SYN/FIN? The firewall passes it
and most (all?) operating systems ignore the FIN and operate on the SYN.
Connection Established!

Remember this is only possible on non-stateful packetfilters (read:
These packetfilters do not use connection tracking)

Once you use connection tracking that code decides in which direction
the connection is initiated. It is not just a matter of the SYN-packet.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

