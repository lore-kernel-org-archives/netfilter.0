From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Maximum Number of Chains
Date: 02 Sep 2003 22:22:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062534135.6144.20.camel@kermit>
References: <3F50250D.70405@freespace-networks.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F50250D.70405@freespace-networks.net>
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
To: Paul Caritj <pcaritj@freespace-networks.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-08-30 um 06.16 schrieb Paul Caritj:
> Greetings, I hope everyone is well.
> Though I suspect the subject line adequately conveys my question, I will=20
> restate it: Does anyone out there know the maximum number of chains per=20
> table?
Well, I just created 1000 and it still worked.
for i in `seq 1 1000`; do iptables -N chain$i; done

How many do you need?

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

