From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Redirect of DNS requests
Date: 18 Aug 2003 09:31:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061191907.1915.4.camel@kermit>
References: <3F403CD2.4060507@hailix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F403CD2.4060507@hailix.com>
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
To: Trevor Morrison <trevor@hailix.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-08-18 um 04.41 schrieb Trevor Morrison:
> I have a RH 9.0 with a 2.4.20 kernel.  The box is running iptables-1.2.7=20
> and does NAT from my 192.168.1.x network to my  ISP assigned dhcp IP.=20
>  What I would like to do is redirect a certain domain's email, DNS, or=20
> Web traffic to a w2k server that sits in my private network, sort of=20
> like a DMZ situation and have the another domain's services continue to=20
> be routed to the RH box.  On the RH box I am running Bind and Sendmail=20
> amoung other things.
You cannot do this using iptables. Iptables does not support the kind of
application protocol filtering you need.=20
You can only configure your Linux applications (bind/sendmail/apache) to
do this.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

