From: lst_hoe01@kwsoft.de
Subject: Re: Firewall did not block SSH - what is wrong
Date: Tue, 22 Feb 2005 14:25:39 +0100
Message-ID: <1109078739.421b32d3b20bd@webmail.kwsoft.de>
References: <20050221203620.5c4484d7.Hilmar.Berger@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050221203620.5c4484d7.Hilmar.Berger@gmx.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Zitat von Hilmar Berger <Hilmar.Berger@gmx.de>:

>
> Hi,
>
> I am running iptables 1.2.11/Linux 2.4.27-pre2. Firewall is started whe=
n ADSL
> connection is going up.
> The rule set I use is from some example iptables ruleset to set up
> IP-masquerading. I needed this sometime ago in order to connect my lapt=
op to
> my desktop and connect to internet through its dsl modem.
> I never had any trouble with my firewall before. It worked as expected =
- at
> least that's what it seems to me.
>
> Today someone tried to break in my machine (desktop, the one the firewa=
ll is
> running on) by connection to sshd - which should have been blocked. I t=
ried
> to test if this was because my firewall rules are bad or because there =
is
> some other bug. Unfortunately, I don't have another machine around righ=
t now
> and iptables does not have the -C option that exists with ipchains to c=
heck
> if the rules work as desired.

With this rule

# remote interface, any source, going to permanent PPP address is valid
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT

and sshd bind to any interface you should not wonder why every one can co=
nnect
to your firewall sshd and any other service running on the firewall ...

Regards

Andreas



