From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Starting iptables problem
Date: 25 Oct 2003 15:06:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067087168.1672.16.camel@kermit>
References: <3F998BA4.7070001@icare.com.hk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F998BA4.7070001@icare.com.hk>
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
To: Stephen Liu <satimis@icare.com.hk>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-10-24 um 22.29 schrieb Stephen Liu:
> # /etc/init.d/iptables start
>  * WARNING:  "net.eth0" has already been started.
>  * Not starting iptables. First create some rules then run
>  * /etc/init.d/iptables save
>=20
> Kindly advise how to proceed.  Thanks in advance.
Well, as the command said:
First create some rules, then run /etc/init.d/iptables save
Then you may start iptables.
When there are no rules there is nothing to start.

Cheers,

Ralf

--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

