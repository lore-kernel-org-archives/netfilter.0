From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: DROP before PREROUTING
Date: Wed, 3 May 2006 15:07:13 +0200
Message-ID: <20060503130713.GA16949@galois.math.uni-paderborn.de>
References: <52837e3e0605030548v485078e0w7ae6bbb9492d674a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <52837e3e0605030548v485078e0w7ae6bbb9492d674a@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Am Mittwoch, den  3. Mai hub Bruno Nunes folgendes in die Tasten:

Hi!

>   i have this rule which forwards all incoming requests for ipA to a
> local machine as you can see.
>    iptables -t nat -A PREROUTING -d <ipA> -i eth0 -p tcp --dport 80
> -j DNAT --to 192.168.1.4

>  is there any way to allow only a range of machines to use this
> specific rule (not interfering with the other rules)? dropping all
> requests that are not welcome.

Just add "-s source" to the line and you=B4ll be able to match a source
host/net.

e.g.
iptables -t nat -A PREROUTING -s 1.2.3.4 -d 2.3.4.5 -i eth0 -p tcp \
 --dport 80 -j DNAT --to 3.4.5.6

Ciao
Max
--=20
|           |                 Follow the white penguin.
|  |\/|  |  |-----------------------------------------------------------.
|  |  |/\|  |  Rechnerbetrieb Mathematik  |   Meine Baustellen:  TSM    |
|           |  Universitaet Paderborn     |   Hostmaster, Linux, LDAP   |=
=20

