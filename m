From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: transfer Bytes Counting
Date: Tue, 01 Oct 2002 01:41:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPEEKGDAAA.stewart.thompson@shaw.ca>
References: <007301c26909$036ea440$7cfcc5cb@humanpc>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <007301c26909$036ea440$7cfcc5cb@humanpc>
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
To: HareRam <hareram@sol.net.in>, netfilter@lists.netfilter.org

Hi Hare:

Here is one way that was originally suggested by Antony Stone on the list.

<Begin Quote>

In my FORWARD chain, instead of ACCEPTing packets which are ESTABLISHED or
RELATED, I send them to a user-defined chain called for example PKTCOUNT

Then the PKTCOUNT chain contains rules like this:

iptables -A PKTCOUNT -s 11.22.33.44 -j ACCEPT
iptables -A PKTCOUNT -s 11.22.33.55 - j ACCEPT
iptables -A PKTCOUNT -s 11.22.33.66 -j ACCEPT

and so on, for each of the IP addresses you're interested in.   You could of
course use -d if you're more interested in destination addresses, or use
both.

Then the command iptables -L PKTCOUNT -n -v will show you the number of
packets and the number of bytes which have matched on each rule in this
chain
- ie the number which matched each IP address.

I actually have a cron job to do this once a minute and record all the
numbers to an IP log file, which I can then parse with a Perl program to
produce some pretty graphs. I'm sure mrtg could do this if you wanted to
use that instead.

I guess if you've already created a set of SNAT or DNAT rules to do the
translations you want, then you probably don't even need to create the
PKTCOUNT chain - just try doing iptables -L PREROUTING -n -v -t nat and it
will tell you how many packets and bytes got translated by each rule.

<End Quote>

Hope that helps.

Stu....






-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of HareRam
Sent: September 30, 2002 10:12 PM
To: netfilter@lists.netfilter.org
Subject: transfer Bytes Counting

Hi all

iam using IPtables since long
now i have new requirement in my network
i sould like to count tranfer bytes In/Out for individual IP or MAC address
could any give me small examples, how can i do this rather i achive this

thanks in advance

hare



