From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Fri, 13 Dec 2002 01:09:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212130109.43535.netfilter@newkirk.us>
References: <Pine.LNX.4.33.0212100943130.9625-100000@blackhole.kfki.hu> <200212101118.53239.apapadop@cmu.edu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212101118.53239.apapadop@cmu.edu>
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
To: Alexandros Papadopoulos <apapadop@cmu.edu>
Cc: netfilter@lists.netfilter.org

On Tuesday 10 December 2002 11:18 am, Alexandros Papadopoulos wrote:

> The default behavior is DROP for all chains, so if these ones don't
> allow it, then it is blocked. I thought these ones were sufficient.
> I'm attaching the complete ruleset I'm using.
>
> > > I'd bet that the problem is that the SYN request sent from the
> > > client to my server gets dropped, though. Seems like a
> > > conntrack/INPUT thing.
> >
> > I'd setup logging rules to see where and why the connection gets
> > blocked.

This is always useful.  Almost every time something unexpected is=20
happening you can look at the logging from an attempted connection or=20
two and quickly see where the packet appears, and where it doesn't.  Set=20
a log rule as the first in each chain for just long enough to try a=20
connection, disable the logging, and check the logs.  Just trace the=20
appearance of the packets, and compare to what SHOULD happen. IE: if it=20
shows up in PREROUTING and INPUT, then response in OUTPUT but not=20
POSTROUTING, then it's being blocked in OUTPUT.  The log can also turn=20
up instances where the addresses or port numbers are not what you=20
expected when you built the rules.

> I've monitored the packets with Ethereal and seen that the problem is
> the one mentioned -- the SYN packet from the client that tries to open
> the data connection (when in passive mode) never makes it through the
> firewall.
>
> The question is, why doesn't connection tracking pick this up and
> allow the packet to go through? (since it's a RELATED connection to a
> preexisting FTP session)

Two questions.

1 - What is this supposed to achieve?
#### CHAIN FORWARD ####
#######################

#/sbin/iptables -t nat -A POSTROUTING -p tcp --dport 55555 -j REDIRECT=20
--to-port 80

REDIRECT isn't a valid target in nat-POSTROUTING.  If you are trying to=20
redirect anything outbound from the local box with destport 55555 and=20
loop it back to destport 80 on the local box, this should be nat-OUTPUT. =
=20
I can't see anything else you would be trying to do with this.

2 - Are you sure that FTP and HTTP replies will have source ports of 1024=
=20
or higher?

## Allow outgoing FTP (data) + HTTP replies
/sbin/iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m state=20
--state ESTABLISHED,RELATED -j ACCEPT

Try this with no --sport match at all and see what happens.  be careful=20
that you are not TOO specific in the matches you require.

j

