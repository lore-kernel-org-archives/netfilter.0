From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: iptables with iplimit option
Date: 24 Aug 2003 13:04:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061723091.1608.2.camel@kermit>
References: <BAY7-F298fdFsLowAQZ000006e9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY7-F298fdFsLowAQZ000006e9@hotmail.com>
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
To: Noname Noname <spphu@hotmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Son, 2003-08-24 um 05.02 schrieb Noname Noname:
> Hi all
>=20
> i'm trying to use iptables with iplimit option, i'm getting the below=20
> problem
> can any one help what is the caused problem and how can I solve it?
>=20
> [root@www root]# iptables -A INPUT -p tcp --syn --dport http -m iplimit=20
> --iplimit-above 4 -j REJECT
> iptables: No chain/target/match by that name
You might not have the iplimit support compiled in your kernel/iptables
command.
Try removing one or the other option:
 iptables -A INPUT -m iplimit --iplimit-above 4 -j REJECT
 iptables -A INPUT -p tcp --syn --dport http -m iplimit -j REJECT
 iptables -A INPUT -p tcp --syn --dport http -j REJECT
 iptables -A INPUT -p tcp --syn --dport http=20
And watch which option causes the error. Then check if you
configured/patched your kernel to support this option ;-)

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

