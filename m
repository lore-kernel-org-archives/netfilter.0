From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: RST packets
Date: Mon, 16 Aug 2004 09:17:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c4838b$0cd6c0f0$49caa8c0@caris.priv>
References: <024c01c47fe6$40e03e60$49caa8c0@caris.priv> <0c0701c4808d$8757d180$49caa8c0@caris.priv> <1092410257.1664.226.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter <netfilter@lists.netfilter.org>

Thanks for the suggestions ... I will have a look at the mod_jk logs ....

Peter

----- Original Message ----- 
From: "Chris Brenton" <cbrenton@chrisbrenton.org>
To: "Peter Marshall" <peter.marshall@caris.com>
Cc: "netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, August 13, 2004 12:17 PM
Subject: Re: RST packets


On Thu, 2004-08-12 at 12:58, Peter Marshall wrote:
>
> I am having a problem now where I am getting RST packets being blocked
from
> my internal network heading out to the external network.  It looks like
RST
> packets are used to stop a TCP connection when there is a problem.

Per chance do you have a tcpdump trace of the activity? RST's are
usually an indication of one or two problems:
1) One end of the session has stopped responding
2) Connection attempt to a closed port

There are other reasons, but these are the most common. You may want to
investigate why you are seeing the RSTs packets in the first place.
Sounds like the problem might be broken communications.

> The setup is like this:
> I have a web box in my dmz that people connect to.  A mod-jk connection is
> made through my firewall, and the responses are allowed back with the
> standard ESTABLISHED,RELATED allow on the Forward chain.

What errors (if any) are you seeing in mod_jk.log?

> I guess I was wondering why I was getting a bunch of RST packets and also,
> why the firewall was blocking them.  Would they not be part of the
> ESTABLISED-RELATED chain ?

If a valid session has been established, the first issued RST will be
considered part of that session. Netfilter does work this way as I have
confirmed through many a traces. The only reason I can think of for
Netfilter to block the RST is that it does not have a state entry for
the traffic.

> Here are the relevant rules.
> $IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> $IPT -A FORWARD -s $WEB_BOX_IP -I eth1 -j web-int
> $IPT -A web-int -d 192.168.202.168 -p tcp --dport 8009:8020 -j ACCEPT

I assume there are other rules as I *think* mod-jk starts off on 80/TCP.
Also, I thought ports all the way down to 8005 were valid? Check me on
this as its been a while.

> I do have a chain for int-web ... which is used to connect to a webserver
> running on it ..(and it rejects everything else).  This is the chain that
> the RST packet is making it too and is then getting rejected.  However, I
> did not think that the packet should reach this chain as it is related (or
> establised) to the web-int connection ...

This is a pretty clear indication that there is no state entry for the
packet. Again, a trace would help to diagnose this.

> Any suggestions would be greatly appreciated.  My network set up is a DMZ
> between two firewalls.  The web box is in the DMZ.

Not a big fan of this setup as whacking the Web server permits an
attacker to sniff all your inbound and outbound traffic. Greatly prefer
to add a third NIC to the firewall and isolate the system. Just a
personal preference.

HTH,
Chris



