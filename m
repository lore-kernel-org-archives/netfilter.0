From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Where libipt_MASQ.so (???)
Date: 04 Aug 2003 20:05:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060020345.26856.44.camel@kermit>
References: <1211419607.20030804184812@sevein.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1211419607.20030804184812@sevein.com>
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
To: "=?ISO-8859-1?Q?Jes=FAs_Garc=EDa?= Crespo (aka Sevein)" <correo@sevein.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

>  iptables -A FORWARD --match mac --mac-source 00:c0:49:c9:d3:f1 -j MASQ
You need:iptables -A FORWARD --match mac --mac-source 00:c0:49:c9:d3:f1
-j MASQUERADE

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

