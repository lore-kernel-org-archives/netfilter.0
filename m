From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: changing rules at a defined time
Date: Wed, 24 Dec 2003 04:47:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072259260.2184.587.camel@grendel>
References: <20031224092936.GB27890@staticky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224092936.GB27890@staticky.com>
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
To: Payal Rathod <payal-netfilter@staticky.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

Greetings!

On Wed, 2003-12-24 at 04:29, Payal Rathod wrote:
>
> 1> Do the above steps look ok? I will refine them further. Right now are
> they workable.

At the very least, I would specify the receiving interface as well or
you may be subject to spoofing attacks. At the most, you are missing:

Any kind of logging
Deny inbound packets from loopback, private, etc.
Deny outbound unreachables, Timex, Echo-replies, critical services, etc.

There are probably others. The caffeine has not kicked in yet. ;-)

> 2> If I want to change the rules at 16:00 what is the best way to change
> them?

Two options:

1) Write up two sets of rules in two different shell scripts. Use cron
to implement them at the appropriate time. Use '-F' as you mentioned at
the beginning of the script to flush the existing rules.

2) Install patch-o-matic and implement the time patch. You can then do
something like:

iptables -A FORWARD -i eth0 -p tcp -m time --timestart 16:00 --timestop
17:00 --days Mon,Tue,Wed,Thu,Fri -s 192.168.0.0/32 -j ACCEPT

HTH,
C



