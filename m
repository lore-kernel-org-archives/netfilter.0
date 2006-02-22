From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 12:25:23 +0100
Message-ID: <5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>
Content-Disposition: inline
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

> > iptables --flush
> > iptables -t nat --flush
> > iptables --delete-chain
> > iptables -t nat --delete-chain
>
> Does the nat table have user defined chains ?
> If not then you don't need this rule.


Well, I use these rules with all the flushes and deletes in order to
make sure nothing is at work behind the scenes.


> > iptables -t nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
> > iptables -t nat --append POSTROUTING -s 192.168.10.0/255.255.255.0 -j
> > MASQUERADE
>
> If eth0 is your internet NIC, eth1 your LAN nic and you use 192.168.10.0/=
24
> on
> your LAN then I think that no packet ever hits the latter rule.


Sorry, I should have detailed the cards and ip adresses before. There
are two cards in 'machine A': eth0 with 192.168.10.101 and eth1 with
192.168.10.102, eth0 is the internet NIC and eth1 is connected to the
hub to which 'machine B' with 192.168.10.103 connects as well. So the
picture should be:


'machine A' ---------------- adsl modem ---------- internet
   |
   |
  hub----------'machine B'


> And the script does not generate any errors ?
> Try adding (a) logging rule(s) in the FORWARD chain to see why packets ar=
e
> dropped or rejected.
> I suppose this is not your complete ruleset. Could it be that you have an=
y
> rules that might block this traffic ?

There are no errors. I thought that doing the flush and delete at the
beginning makes sure that only these rules are applied, this is not
the case? In any event, these rules were working absolutely okay
before the update, but I don't insist on these at all, if any other
rule set will make B have internet access that would be great.

