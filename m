From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to use ipt_limit.o?
Date: 09 Dec 2002 10:43:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039427039.8900.11.camel@elendil.intranet.cartel-securite.net>
References: <000d01c29f26$0c4f9170$9801010a@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c29f26$0c4f9170$9801010a@winxp>
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
To: Peter <chenlf@cibn.com>
Cc: netfilter@lists.netfilter.org

Le lun 09/12/2002 =E0 02:55, Peter a =E9crit :
> i am using redhat73 kernel 2.4.18-18.7=20
> i want to limit number of httpd access per/client=20
> i use=20
> # insmod  ipt_limit.o
> # iptables -A INPUT -p tcp --syn --dport http -m iplimit --iplimit-abov=
e 4 -j REJECT
> then i get error:
> iptables: No chain/target/match by that name
> who can help me

Your syntax is wrong, so RTFM ;)

# iptables -m limit --help

cbr@elendil:~$ sudo iptables -m limit --help
iptables v1.2.7a
[...]
limit v1.2.7a options:
--limit avg			max average match rate: default 3/hour
                                [Packets per second unless followed by=20
                                /sec /minute /hour /day postfixes]
--limit-burst number		number to match in a burst, default 5

limit match is described in Linux filtering HOWTO you can read on
http://www.netfilter.org/.

By the way, limit match is aimed to match packets that are _under_ the
specified (via --limit argument) limit. If you want to match packets
over the limit, you have to modify you ruleset and introduce a user
chain dedicated to this need until ! --limit is available.

# iptables -A INPUT -p tcp --syn --dport http -j USER_CHAIN
# iptables -A USER_CHAIN -p tcp --syn --dport http \=20
	-m limit --limit 4/s -j RETURN
# iptables -A USER_CHAIN -j REJECT

So you REJECT packets over 4/s limit. There's been a thread on this
topic earlier, you should search list archives.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

