From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Need Some Help Fine Tunning Rule....
Date: Mon, 17 Feb 2003 13:52:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302171352.01068.netfilter@newkirk.us>
References: <20030217102959.25447.qmail@web13303.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030217102959.25447.qmail@web13303.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Tasha Smith <tashamaillist@yahoo.com>, netfilter@lists.netfilter.org

On Monday 17 February 2003 05:29 am, Tasha Smith wrote:
> Hiiiii,
>
> I have a LAN that has 3 windows 2000 computers and 1 Redhat7.3
> (2.4.20) running
> iptables 1.2.7a(Firewall/Router). I need some help fine tunning my
> rules right now
> the windows  machines on my LAN behind Firewall can access the net
> wihtout any
> restrictions. I mean as soon as i add a program like MSN Messenger i
> dont have to
> add RULES to my Firewall Machine it just lets it pass right on
> through.Soo this

> # Set the default policy to drop.
> iptables --policy INPUT DROP
> iptables --policy FORWARD DROP
> iptables --policy OUTPUT ACCEPT

This is a good start, with DROP policy.

> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Good step two, lets existing connections through, along with related=20
traffic.

> # Fowarding is allowed in the direction
> iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT

This is your problem here.  You don't want this.  You want to have a rule=
=20
for each type of traffic you want to allow to be forwarded.  IE:

iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -p udp --dport 53 -j ACCEPT

These two, together with the DROP policy and state rule will allow=20
machines behind the firewall to browse HTTP documents, (and consult DNS=20
to resolve web addresses) and nothing else.

iptables -A FORWARD -i eth0 -p tcp --m multiport --dport 25,80,110,443 -j=
=20
ACCEPT

This one, instead of the first one above, would allow email (POP3 and=20
SMTP) and both HTTP and HTTPS web browsing.

As a suggestion, for a short fine-tuning period, try placing specific=20
ACCEPT rules first in FORWARD (after the state rule) followed by a LOG=20
rule like:

iptables -A FORWARD -i eth0 -j LOG --log-prefix "UnhandledForward:"

and finally by your original 'allow all traffic' rule.  Then consult the=20
LOG frequently to see what traffic is not handled by your specific=20
rules, and you can decide whether to create a specific rule to allow it,=20
or just let it be DROPped when you finally pull the catch-all out.  The=20
alternative is just to ditch the catch-all rule now, and handle "my AIM=20
won't work!" and similar complaints as they arise.

j

