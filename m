From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Group on Iptables
Date: Thu, 28 Aug 2003 05:59:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4DD296.7040403@chrisbrenton.org>
References: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Masiero Giorgio, PD" <gmasiero@cerved.com>
Cc: netfilter@lists.netfilter.org

Masiero Giorgio, PD wrote:
>
> Hy my name is Giorgio,

Greetings Giorgio,

> 	Is it possible to use objects like Checkpoint Groups (that is a set of host and/or networks) into an Iptables rule.
> 	It seems to me that iptables accept souce/destination that are only one host/network.


First off, you really want to write your rules based on IP address 
rather than host or domain names, it makes processing the rules go much 
quicker and speeds up the firewall.

Second, try doing something like this in your initialization script:

# Known Spammers
while read SPAMMER ; do
iptables -A FORWARD -i eth0 -p tcp -s $SPAMMER -d 0/0 --dport 25 -j LOG 
--log-prefix " SPAMMER  "
iptables -A FORWARD -i eth0 -p tcp -s $SPAMMER -d 0/0 --dport 25 -j 
REJECT --reject-with icmp-host-unreachable
done < /etc/spammers-list.txt

# Hostile addresses
while read BLACKHAT ; do
iptables -A FORWARD -i eth0 -s $BLACKHAT -d 0/0 -j LOG --log-prefix " 
BLACKHAT  "
iptables -A FORWARD -i eth0 -s $BLACKHAT -d 0/0 --dport 25 -j REJECT 
--reject-with icmp-host-unreachable
done < /etc/blackhat-list.txt

The *.txt file indicated on the "done" line is simply a plain text file 
that lists each IP address or subnet to process, one per line. Something 
like this:

211.99.204.0/23
211.99.206.0/24
210.77.157.40/32
210.77.157.0/24

So now your "groups" are the lists of addresses in each file. If you 
need to make a change just edit the group and reload your rules. Note 
that doing a:

iptables -L -n

will allow you to verify that all the addresses were loaded.

HTH,
C


