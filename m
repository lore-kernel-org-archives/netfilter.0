From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging Questions
Date: Fri, 13 Aug 2004 02:14:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408130214.49572.Antony@Soft-Solutions.co.uk>
References: <FB92A0C3C659594FA37C4DA4124DA5F6059A54@pollux.itsecur.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FB92A0C3C659594FA37C4DA4124DA5F6059A54@pollux.itsecur.com>
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

On Friday 13 August 2004 1:43 am, Manny G. Fernandez wrote:

> Good day,
>
> I have been running netfilter for a few years now.  Right now I am pulling
> my logs into an application called Sawmill (www.sawmill.net) it understands
> native iptables logs.  This application, like other parsers, can only
> report on info that is in the log.  I would like to be able to pull reports
> with protocol breakdown and amount of certain traffic, e.g. how much SMTP
> went out vs. how much came in.

You mean something like:

iptables -I FORWARD -p tcp --dport 25 -o $EXTIF -j LOG --log-prefix "SMTP out"
iptables -I FORWARD -p tcp --dport 25 -o $INTIF -j LOG --log-prefix "SMTP in"

perhaps?

> I use a custom made webmin module to configure rules, if I edit the
> iptables file this is what I see for logging:
>
> -log-prefix RULE_1:ACCEPT:
> -log-prefix RULE_10:DROP:

Well, that doesn't tell us what *sort* of traffic is being logged - inbound 
SMTP?  All traffic?   Only TCP?   Etc....

> Is there a way to log more information about the traffic as stated above by
> adding to these lines or do I need another package to do this.

The LOG rule output should tell you everything you need to know - you can see 
inbound interface, outbound interface, protocol, destination port number, IP 
addresses, and packet sizes, as well as much more.

> Checkpoint FW-1 has a 'log' option and a 'accounting'. Accounting gives
> more information regarding traffic stats.

Yes, FW-1 will do something which netfilter can't do (without some external 
scripting), and that is to count up all the packets making a particular 
connection and tell you how many packets, how many bytes, and (AFAIR) the 
time duration of the connection.

> I read on the lists that people have created a new chain and logged it that
> way, but I am not sure what can be done.

How about:
# Create a user-defined chain to log different types of packets
iptables -N LogPackets
# Call the chain right at the top of the FORWARD table so we see all the 
packets
iptables -I FORWARD -j LogPackets
# Create a unique log entry for each type of packet we want to know about
iptables -A LogPackets -p tcp --dport 25 -o $EXTIF -j LOG --log-prefix "SMTP 
out "
iptables -A LogPackets -p tcp --dport 80 -o $EXTIF -j LOG --log-prefix "HTTP 
out "
iptables -A LogPackets -p udp --dport 53 -o $EXTIF -j LOG --log-prefix "DNS 
out "
iptables -A LogPackets -p tcp --dport 53 -o $EXTIF -j LOG --log-prefix "DNS 
out "
iptables -A LogPackets -p tcp --dport 25 -o $INTIF -j LOG --log-prefix "SMTP 
in "
etc....

Using the user-defined chain simply puts all the LOGging rules together, 
without interfering with or obscuring your normal filtering rules.

The other thing you can do, after having put the rules in place, is "iptables 
-L LogPackets -nvx" and look at the packet / byte counters in the first two 
columns - those will tell you how much aggregate traffic has matched each 
rule since the counters were last zeroed (iptables -Z)

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


