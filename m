From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Hostname Routing
Date: 07 Sep 2003 11:11:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062925865.1617.1.camel@kermit>
References: <200309062053.43929.hchs@ns.sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309062053.43929.hchs@ns.sympatico.ca>
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
To: Cody Harris <hchs@ns.sympatico.ca>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Son, 2003-09-07 um 01.53 schrieb Cody Harris:
> Hello. I have researched your database on this subject (hostname routing)=
, but=20
> found nothing much. What i want is to take domain.com:* and deliver that =
to=20
> the local machine (127.0.0.1), but i want alt.domain.com:* to go to=20
> 192.0.0.2. How is this done?
Am I missing something?
What about the following in /etc/hosts:
127.0.0.1 localhost localhost.localdomain domain.com
192.0.0.2 alt.domain.com

Or do it on you DNS server.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

