From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: bridge/ebtables/iptables interaction question
Date: Wed, 24 Mar 2004 00:45:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080085546.1439.227.camel@anduril.intranet.cartel-securite.net>
References: <20040323211611.32198.qmail@web60004.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040323211611.32198.qmail@web60004.mail.yahoo.com>
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
To: Sandy C <sc_netfiltermail@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le mar 23/03/2004 =E0 22:16, Sandy C a =E9crit :
> iptables -A INPUT -m physdev --physdev-in eth1 -p tcp
> --destination-port 2049 -j LOG
[...]
> iptables -A INPUT -m physdev --physdev-in eth2 -p tcp
> --source-port 2049 -j LOG
[...]
> I must be missing something though because I get
> nothing in my logs.
[...]
> what could I be doing wrong?=20

Bridged traffic goes through FORWARD chain, for it's not destined to
your box.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

