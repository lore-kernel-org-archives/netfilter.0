From: Jay Levitt <jay-netfilter@shopwatch.org>
Subject: Re: Wayward RST packets - what's the right answer?
Date: Sun, 28 Mar 2004 21:40:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <049001c41537$2843e7e0$9701a8c0@office>
References: <00ca01c412ea$e24fe2f0$9701a8c0@office> <1080295347.2180.399.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Chris Brenton wrote:


> On Thu, 2004-03-25 at 23:29, Jay Levitt wrote:
> >
> > Fairly often - as in a few times an hour on a very, very underused
> > server - I get repeated RST packets from hosts I've recently been
> > talking to, but that conntrack thinks aren't part of a connection.  My
> > rule:
> >
> > iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
> > --state NEW -j LOG --log-prefix "Stealth scan attempt"
> > iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
> > --state NEW -j DROP
>
> Maybe I'm reading this wrong, but I would expect you would only get a
> match with this rule if SYN was set. I'm surprised your grabbing RST
> packets. Perhaps another rule that uses the same prefix?

Nope, it's the other way around - this rule matches any packet that is in a
NEW state but has flags other than SYN-and-only-SYN.

> Also, not so sure you can consider RST's a "stealth scan" as a receiving
> host is just going to ignore bogus RST's and not reply, regardless of
> whether the port is open or not. Best an attacker could hope to receive
> is a host unreachable.

OK, so it'd be perfectly safe to add this?

iptables -A INPUT -p -tcp --tcp-flags FIN,SYN,RST,ACK RST -m state --state
NEW -j ACCEPT

One problem is that although I can read about the TCP protocol and valid
states, I don't know what failure/DOS/etc modes I'm protecting against, and
therefore I'm not sure what invalid-yet-possible states I should be letting
through.

> > Mar 25 23:19:05 linux kernel: Stealth scan attemptIN=eth0 OUT=
> > MAC=00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00 SRC=208.185.179.12
> > DST=192.168.1.150 LEN=40 TOS=0x00 PREC=0x00 TTL=47 ID=6376 PROTO=TCP
> > SPT=2046 DPT=25 WINDOW=0 RES=0x00 RST URGP=0
>
> What's the time stamp on the accepted packet? If you are
> logging/dropping RST packets prior to processing ESTABLISHED that would
> explain this entry. I very rarely see legit RST packets get dropped so
> if you are seeing them fairly often I would guess a config problem as
> RSTs are a last resort.

Not sure what you're asking about the timestamp... the rule does log/drop
RST packets in a NEW state (or, more likely, after a connection has been
"closed" in conntrack).  I see them a few times an hour; any idea what sort
of config problem I'd be looking for?

> The other time I've seen it is when there is an IDS on the wire kicking
> out RST packets when a suspect packet is seen, but the IDS does not get
> the sequence numbers right in the RST.

What's an IDS?

Jay Levitt


