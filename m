From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 17:39:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181739.05377.Antony@Soft-Solutions.co.uk>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181610.52327.Antony@Soft-Solutions.co.uk> <20040718162409.GA30107@tranquility.scriptkitchen.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040718162409.GA30107@tranquility.scriptkitchen.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 18 July 2004 5:24 pm, Payal Rathod wrote:

> On Sun, Jul 18, 2004 at 04:10:51PM +0100, Antony Stone wrote:
> > You are missing either a "-s" source address or "-i" input interface
> > specification for the rule allowing access to the DMZ machine, or else
> > you
>
> Which rule are you referring to exactly?

This one:
> > > $IPTABLES -A FORWARD -d 10.10.10.2 -p tcp --dport 25 -j ACCEPT

It says "allow connections to 10.10.10.2 TCP port 25".   It doesn't say "but 
only from the Internet".

> > are missing either a "-d" destination address or "-o" output interface
> > specification for the rules allowing access from the LAN.
>
> Can you tell me something more specific. I am still unable to figure that
> if I have dropped all connections to outside, DMZ which is outside for the
> LAN how can connections be allowed for it?

All the following rules allow packets from your LAN:

> > > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > $IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 3128 -j ACCEPT
> > > $IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 53 -j ACCEPT
> > > $IPTABLES -A FORWARD -s 192.168.0.0/16 -p udp --dport 53 -j ACCEPT

These rules do not say "but only to the Internet", therefore they allow 
packets to the DMZ as well.

As an example of what I was suggesting, suppose eth0 is your Internet 
interface, eth1 is your LAN interface, and eth2 is your DMZ interface, and 
suppose you want to allow SMTP to your DMZ mail server from the Internet, but 
not from your LAN.   Then the rule should be something like:

iptables -A FORWARD -i eth0 -o eth2 -d 10.10.10.2 -p tcp --dport 25 -j ACCEPT

This rule says "allow packets to address 10.10.10.2 on TCP port 25, provided 
they come from eth0, and they're going to eth2".

I hope that clarifies things and gives you enough information to apply the 
principle to the other rules?

Regards,

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


