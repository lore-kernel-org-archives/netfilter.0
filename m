From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Firewall script
Date: Tue, 27 Sep 2005 13:57:21 +0200 (CEST)
Message-ID: <52145.193.173.147.3.1127822241.squirrel@webmail.sterenborg.info>
References: <200509271639.33162.usergroups@theargoncompany.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509271639.33162.usergroups@theargoncompany.com>
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

On Tue, September 27, 2005 13:09, Boskey wrote:
> Hi All,
>
> A customer of ours has a firewall script made for there organization.
>
> The customer , even after enabling the firewall script has a huge
> spammer
> inside the network get across, and spam from the IP.
>
> I have seen the script and feel that his firewall is  good when it
> comes to
> not allowing people into the system.
>
> But i guess people inside the network  ( local ) can  get across
> easily.
>
> Can someone help me by confirming this.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#
# Bad TCP packets we don't want
#

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

[....]

#
# LAN section
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Move the state rule right below the "bad tcp packets" rule (better
performance).

Then, below the state rule, log and reject packets for dport 25 :

$IPTABLES -A FORWARD -i $LAN_IFACE -m state --state NEW \
  -p tcp --dport 25 -j LOG --log-prefix "SMTP_REJECT: "
$IPTABLES -A FORWARD -i $LAN_IFACE -m state --state NEW \
  -p tcp --dport 25 -j REJECT --reject-with tcp-reset

This way no-one can send email diectly to some smtp server on the
internet and at the same time you will log the offending IP.
You may want to limit (-m limit --limit 1/second or something) if your
logs get filled too quickly.

However.. If you're doing this, you need your own smtp server so
people can send (legitimate) email when they need to able to do that.
When they start spamming using *your* smtp server, you will have the
smtp logs available...


Gr,
Rob



