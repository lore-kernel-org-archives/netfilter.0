From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: accounting
Date: 09 Oct 2003 18:19:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065716349.5873.19.camel@kermit>
References: <3F856645.2030609@ewt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F856645.2030609@ewt.de>
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
To: Klaus Boehm <k.boehm@ewt.de>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,

Am Don, 2003-10-09 um 15.44 schrieb Klaus Boehm:
> I want use the iptables for accounting.
> 1. How looks the iptable rules.
> 2. In which file under the proc filesystem I could read the counter value=
s.
There are probably better applications to do accounting, but if you want
to do that:
1. This rule will cover all HTTP-traffic=20
iptables -A FORWARD -p tcp --port 80
2. You can read the counters using=20
iptables -vnL
3. You can reset the counters using
iptables -Z

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

