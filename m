From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ---How can I got nic device info ?
Date: 03 Sep 2003 15:29:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062595766.18242.14.camel@kermit>
References: <20030902030053.71926.qmail@web15104.mail.bjs.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030902030053.71926.qmail@web15104.mail.bjs.yahoo.com>
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
To: Bill Zhao <bzhaoa@yahoo.com.cn>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-09-02 um 05.00 schrieb Bill Zhao:
> Hi,=20
>   I did use ipchains before. And now I start to use
> iptales. And already read howto, man pages and some=20
> other basic doc. I just met a problem that I cannot
> see
> the device info in the lists showed by iptables -L [-t
> nat]. Actuall I add the nic device info when adding a
> rule entry to it using -i or -o options.
Use=20
iptables -L -v -n

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

