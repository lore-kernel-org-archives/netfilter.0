From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Excluding IP ranges from masquerade rules
Date: 13 Oct 2003 15:24:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066051471.4193.63.camel@kermit>
References: <1066038290.5801.35.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066038290.5801.35.camel@tarkus>
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
To: tedkaz@optonline.net
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-10-13 um 11.44 schrieb Ted Kaczmarek:
> I presently exclude 1 ip block in POSTROUTING using
> "! X.X.X.X/24" . Is their a way to specify multiple ranges that are=20
> excluded?
Only if you can combine them in one network, like:
10.0.0.0/8 and 11.0.0.0/8 can be written as 10.0.0.0/7

> or
> Is their a way to have POSTROUTING only have affect on a certain
> interface?
You can use -o eth0 to specify the interface in you rules.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

