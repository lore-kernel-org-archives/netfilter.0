From: Nik Trevallyn-Jones <nik@designer.com.au>
Subject: active firewall
Date: Tue, 23 Sep 2003 23:26:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03092320103102.01185@slinky.exmosys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All,

   As a result of experiences deploying PortSentry behind an ipchains 
firewall recently, I started considering how iptables could be used to deploy 
a dynamic firewall which would be able to modify itself in response to 
predefined events. As far as I can see, such features would require extension 
modules.

Q: Has anyone considered or suggested this before?

Below are some further details of the features as I currently envisage them:

1  two new targets: ENLIST, DELIST
These targets effectively cause one or more new rules to be automatically 
added/removed to/from the firewall in response to matching the associated 
rule. This allows the firewall to respond to certain events by 
adding/deleting rules within itself.

1.1 ENLIST (eg: BLACKLISTING)
This causes one or more new rules to be added to the firewall, often to block 
some host, port, interface, etc, but could also be used to dynamically route 
packets through/around transparent proxies, etc. By default, all rules added 
by ENLIST are temporary, and are automatically removed once they have expired.
Eg an ENLIST rule could effectively assert: "ENLIST a DROP rule for two hours 
for all succeeding packets from any host that tries to connect to post 137".

1.2 DELIST (eg: WHITELISTING)
This causes the specified match criteria to have their ENLIST "credit" 
increased. Since many ENLIST rules will typically cause some types of  
traffic to be blocked, the DELIST target must be able to be used *in advance* 
- essentially forewarning the firewall that an otherwise enlistable event is 
about to occur which should *not* trigger enlisting this time. However, since 
DELIST rules simply change a state (or counter) in the opposite direction to 
that in which an ENLIST rule does, DELISTING a currently ENLISTED host, port, 
interface, etc will remove the ENLISTED rules. A timeout option would ensure 
that an advance DELIST does not last forever, or that a DELIST target can 
*only* DELIST an existing ENLISTED rule.
Eg. a DELIST rule could assert: "skip the next ENLIST match on port 137 if it 
arrives within the next 20 seconds".

2. a new target: DEFER (eg: GREYLISTING)
This causes the decision regarding matching packets to be "delayed" until 
further information has been gathered to determine their fate. In this way, a 
packet received on a "suspicious" port may be ultimately blocked if further 
associated suspicious activity is detected within some time period, otherwise 
the packet would continue traversing the chains. For example, the decision 
regarding a SYN packet to port 21 could be deferred to see if the same 
machine tries other ports in the near future. If it looks like the machine is 
scanning, then that machine could be blacklisted, causing all packets 
including the DEFERRED packet to be DROPPED. If however, no other suspicious 
activity is observed, the packet would continue to the next rule in the 
chain.

I am not particularly experienced in this area of networking to know how this 
delay might be implemented, but I see some possibilities:

* the packet is simply held in limbo, and the eventual response is returned 
once the decision has been made (risks timeout at the originating end)

*  some form of "busy, try again soon" packet is sent, causing the originator 
to try again (increasing network usage for this one time, and complicating 
the DEFER implementation)

*  other??

2. a new match type: SELECT
A match type that maintains historical information on specified aspects of 
recently matching packets and uses this information to apply the target 
selectively. Hence, a single rule could be created that records (say) the 
source IP address of all recently matching packets, and triggers its target 
only for those source IP addresses that exceed some criteria (matches per 
second, etc). SELECT matches would also have options to control the 
criteria:

* count: matches if the recorded count exceeds some number

* rate: matches if the recorded count exceeds some averaged number/sec

* burst: matches if the recorded count exceeds the limit. The recorded count 
is decremented for each time period that passes without any matches.

Eg A SELECT rule could assert: "SELECT the source IP address of all ICMP 
packets, and ENLIST a blacklist rule for all source IP addresses that exceed 
3/sec".

3. a new target: THROTTLE or CHOKE (eg tarpit)
This target implements a simple packet-level tarpit, inserting (possibly 
ever-increasing) delays before each response. There should be multiple 
benefits:

3.1 Actual scanning/hacking processes are slowed down, significantly reducing 
the number of attempts in a given time period.

3.2 Freeing of resources on both originating and receiving machines, and 
since both of these are usually innocent bystanders, this would release CPU 
and network resources for "real" processing.

Again, my network knowledge is insufficient to work out the details, but 
a "<delay> - <I'm sorry, could you repeat what you just said>" 
loop would probably be a good place to start.

4. I would also like to be able to determine if there is a process listening 
to the target port of a packet. Does the difference between the NEW and 
INVALID states tell me this? Ie, if a SYN packet arrives for some port, then 
will the state be NEW if there is a process listening on the port, and 
INVALID if not?
I would like to write a rule which asserts: "BLACKLIST any host that sends a 
SYN packet to any ports between 1025-50000 unless there is a socket listening 
to the port at the time the packet arrives".

Sorry this email is so long. Hopefully it is of interest - all thoughts and 
comments gratefull received.

Cheers!
Nik.

