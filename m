From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: game server rules
Date: 14 Jan 2003 15:00:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042552852.464.214.camel@xbox>
References: <A0B5F46E38ADD411967800805F777E983B81BF@colosrva.colosseum.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A0B5F46E38ADD411967800805F777E983B81BF@colosrva.colosseum.com>
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
To: Dominic Irrcher <dirrcher@colosseum.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Fri, 2003-01-10 at 19:46, Dominic Irrcher wrote:
> hi,
> 
> was wondering if anyone has successfully setup a ruleset for a quake3 server
> with iptables ?

Hi,

Are you talking about running a quake3 server *on* your Linux
box, playing quake3 *from* your Linux machine, or allowing
quake3 traffic to be firewalled by your Linux machine.
I suspect it's one of the first two, but I couldn't get
that from your rules below...

Either way, this is how it works:

If you set up a server, you need to allow access to the
port you are running the server on, most often 27960, like
this:

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p udp --dport 27960 -j ACCEPT

If you want to play quake3 from your machine, the last
rule becomes:

iptables -A OUTPUT -p udp --dport 27960 -j ACCEPT

Same thing (kind of) for the FORWARD chain.

Now there's one more thing to know: if you play online
you will often connect to a master server, get a list
of ip addresses+ports from that server, and connect
to the individual game servers from there.

In that case, all the above won't work, since;
- some of those servers are not running on port 27960
- you're not allowing traffic to the master server
  that is running on port 27950

If these last two paragraphs best describe your
situation, and you want to enforce tight security
(ie. the easy way our for a home user is to allow
all udp traffic :-) ), you need the quake3 conntrack/nat
module from patch-o-matic.
 
Regards,
Filip


