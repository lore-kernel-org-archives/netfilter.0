From: ads nat <adsnat@yahoo.com>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 08:27:32 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223162732.51705.qmail@web60406.mail.yahoo.com>
References: <1072191475.816.129.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072191475.816.129.camel@elendil.intranet.cartel-securite.net>
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
Content-Transfer-Encoding: quoted-printable
To: Cedric Blancher <blancher@cartel-securite.fr>, adsnat@yahoo.com
Cc: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org

O.K.
As adviced I have uploaded all rules from command
line. With no error. Thanks.
saved them as follows:
[root@allweb root]# iptables-save > iptables

No error. Thanks.

Now I want to add following error at begining of the
file from command prompt:

###########
IPTABLES -F INPUT
IPTABLES -F OUTPUT
IPTABLES -F FORWARD

IPTABLES -P INPUT DROP
IPTABLES -P OUTPUT DROP
IPTABLES -P FORWARD DROP
###########

Can I upload straight as done earlier and then give
command :=20
 iptables-save > iptables

I am adding rules on live network. I don't want it to
stop and create any problems.

After saving all rules, what should be command for
rules to save permenantly so that when I reboot system
Rules should remain.=20

I have tried to use iptables-save and iptables-restore
but could not use properly, Therefore asking in
detail.
Please guide me to do.
Thanks for support.


--- Cedric Blancher <blancher@cartel-securite.fr>
wrote:
> Le mar 23/12/2003 =E0 14:56, ads nat a =E9crit :
> > Is it not allowed?
>=20
> When a file is iptables-save generated, it's better
> not modifying it by
> hand. Update your running ruleset then issue an
>=20
> 	iptables-save > iptables
>=20
> --=20
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint:
> FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature
> virus.
> >> Copy me to your signature file and help me
> spread!=20


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

