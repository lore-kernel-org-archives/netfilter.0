From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: --set-counters help
Date: 13 Aug 2003 09:29:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060759758.1711.22.camel@kermit>
References: <1153201c36169$5564de00$32011fac@korea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1153201c36169$5564de00$32011fac@korea.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?=EB=B0=95=EC=A7=80?= =?UTF-8?Q?=EC=97=B0?= <fdd@korea.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-13 um 09.05 schrieb =EB=B0=95=EC=A7=80=EC=97=B0:
> Can I change PKTS and BYTES's counters of uniq IP in uniq Chain to 0
> form "the --set-counter 0 0 option" of iptables
I do not know if I understood you correctly, but you can replace an
existing rule and set the counters.

iptables -R mychain rulenum ruledefinition --set-counters=20

Cheers,
Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=C3=BCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

