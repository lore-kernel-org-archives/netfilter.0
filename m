From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ipt_string problems and FAQ
Date: 03 Sep 2003 15:16:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062595005.18242.12.camel@kermit>
References: <200308271319.29439.tabris@tabris.net>
	 <Pine.LNX.4.51.0309011300560.32229@dns.toxicfilms.tv>
	 <20030903084352.GB5028@localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030903084352.GB5028@localnet>
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
To: sr@gimp.org
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-09-03 um 10.43 schrieb Sven Riedel:

> I thought iptables collects all fragments and reassembles the packet
> before applying any rules? Or am I dead wrong here?=20
Only if the ip_conntrack.o module is loaded.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

