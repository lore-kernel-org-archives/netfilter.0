From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Accept DNS Suffix
Date: Tue, 20 Mar 2007 15:44:05 +0100
Message-ID: <1174401845.14907.15.camel@anduril.intranet.cartel-securite.net>
References: <013901c76a83$0deb8f70$6f05b00a@au.schpac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <013901c76a83$0deb8f70$6f05b00a@au.schpac.local>
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
To: Dominic Caputo <dominic.caputo@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mardi 20 mars 2007 =E0 11:02 +1100, Dominic Caputo a =E9crit :
> I currently have an ISP that has multiple address ranges that I wish to=20
> accept in my iptables ruleset. Is it possible for me to use the DNS Suffi=
x=20
> instead of the actual ip as they are currently dynamically assigned. e.g.=
=20
> iptables -s nsw.bigpond.net.au   (current assigned address is=20
> cpe-203-45-103-100.nsw.bigpond.net.au).

No it's not possible. Netfilter only works on IPs, which means if you do
that, iptables will resolve the DNS name _now_ and use the result to
push the rule that won't be updated afterwards if IP changes.

However, if you have an idea of how often the IP changes, you can write
a script that queries the name regularly and update your ruleset
accordingly when it changes.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

