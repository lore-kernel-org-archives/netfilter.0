From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: maybe out of topic
Date: 31 Aug 2003 12:42:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062326520.1607.10.camel@kermit>
References: <3F4EA5D3.1010504@skyinet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4EA5D3.1010504@skyinet.net>
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
To: jaws <jaws@skyinet.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-08-29 um 03.01 schrieb jaws:
> I'm just wondering why im getting this error:
>=20
> [root@tracker root]#/usr/sbin/tcpdump -i eth0
> Couldn't find user 'pcap'
You need the following entry in your /etc/passwd file:
pcap:x:77:77::/var/arpwatch:/bin/nologin

This was taken from a stock RH9 machine.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

