From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: DNAT on Debian
Date: 03 Sep 2003 11:50:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062582658.1614.49.camel@kermit>
References: <3F5156DB.7080407@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5156DB.7080407@mattiamartinello.com>
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
To: Mattia Martinello <liste@mattiamartinello.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Son, 2003-08-31 um 04.00 schrieb Mattia Martinello:
> Hi all

> On SuSE 8.0 all works good and I didn't change anything in the script!

> This DOESN'T work!
> iptables -t nat -A PREROUTING -p tcp -i ppp0 -d $PublicIP --dport 80 -j=20
> DNAT --to $ServerIP:80
Do you get any errors when running the command?

If you did not change anything else, are you sure, that you are using
the same $ServerIP ?

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

