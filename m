From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: my contribution to iptables docs (for what it's worth)
Date: Wed, 30 Oct 2002 09:37:43 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210300932540.23398-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


   (the following is the first part of a writeup i'm working
on to document iptables for a larger courseware manual i'm writing
on linux networking and security.  it's deliberately terse, and
it's not finished yet -- nothing yet on mangle or nat stuff.
the funny "****" format means it was written in emacs outline mode
if you want to look at it that way.  i'm always interested in 
feedback.  the whole point of this writeup was to present a logical
flow of iptables concepts, starting simple and getting progressively
more complex.)


*** iptables
**** Overview
The basic features of iptables:

- filtering of packets based on things like source and destination
  addresses, protocols, port numbers and so on
- stateful firewalling and connection tracking
- SNAT and DNAT (source NAT and destination NAT, for address
  translation into and out of your LAN)
- packet mangling, a more advanced feature for mangling certain
  fields in packets as you see them
- limit matching, to put a limit on packets with certain
  properties
- cumulative statistics with packet and byte counts
 
Netfilter home page: www.netfilter.org
**** Software install and kernel config
I'm going to assume you have the software already installed,
ideally via RPM.  See Appendix A for kernel config instructions 
to build iptables support into your kernel.
**** The tables and chains
Rules are defined against a combination of tables and chains

The tables: filter (the default), nat, mangle
The chains: INPUT, OUTPUT, FORWARD, PREROUTING, POSTROUTING

The actual combinations:

filter:
	INPUT
	OUTPUT
	FORWARD
nat:
	PREROUTING
	POSTROUTING
	OUTPUT
mangle:
	INPUT
	OUTPUT
	FORWARD
	PREROUTING
	POSTROUTING

(Incorporate very handy diagram from Oskar's tutorial here, which
shows flow of packets.)

  With almost all iptables commands, if you don't specify a table,
the filter table is assumed by default.

  You can also create your own "user-defined" chains in any one
of the three tables, but we'll leave that until later.
**** Basic iptables admin
  (A *very* brief, and non-detailed overview, of what is covered in
much more detail later.)

The files:
    
    /etc/init.d/iptables:	the admin start/stop script
    /etc/sysconfig/iptables:	where rules are stored when you save
				your current setup
    /proc/net/ip_tables_names:	the currently-loaded tables
    
How to add rules to your current config (more on this later):

  # iptables [-t <table>] command [match] [target\jump]

Controlling the iptables service:

  # service iptables 
	        start: start filtering based on your saved rules
		stop:  turn off all filtering
		status: list the current chain rules
		save: save the current config in /etc/sysconfig/iptables
		panic: drop all packets

Saving and restoring your rule sets:

  Once you establish a set of filtering rules, you can save them and
restore them with:

  # /sbin/iptables-save > /etc/sysconcfig/iptables
  # /sbin/iptables-restore < /etc/sysconfig/iptables

Listing the currently-loaded tables:

  # cat /proc/net/ip_tables_names
  TABLES=$(cat /proc/net/ip_tables_names)	# for ruleset scripts
**** Out with ipchains, in with iptables
  If you first have to move ipchains out of the way and bring
in iptables:

# chkconfig --level 0123456 ipchains off
# service ipchains stop
# modprobe -r ipchains	# if necessary

# chkconfig iptables on
# modprobe ip_tables
# service iptables start
# iptables -L		# just to confirm that it seems to work
**** Listing and additional options
  How to list the current rules that are in operation (again,
if you don't specify a table, the filter table is assumed by
default):

  # iptables {-L|--list} [-t <table>] [chain]

  Options that are available, not just for listing, but for some
of the other functions as well:

	-t, --table        specify table (filter table by default)
	-v, --verbose	   verbose (show byte and packet counters)
	-n, --numeric	   numeric output
	-x, --exact	   expand numbers
	--line[-numbers]   display line numbers of rule set
**** Establishing simple filtering
***** Overview
  For now, restrict ourselves to setting up simple rule sets for
filtering input/output to a single host.  Issues regarding nat,
mangle, forwarding and so on will be covered later.
***** Setting the policy
  First, set the default policy for all three chains in the filter
table (the default table, remember?)

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT (ok, ok, i'm being lazy, you could say DROP)
iptables -P FORWARD DROP
***** Basic rule format
  The basic format of a rule

  # iptables [-t <table>] command [match] [target\jump]

  As a reasonably self-explanatory example (which drops packets coming in
from anyone on the 192.168.0.0/24 network using TCP going to port 80):

  # iptables -A INPUT --source 192.168.0.0/24 -p tcp --dport 80 --jump DROP

  The basics for modifying rulesets (all of which use the "filter"
table as a default if you don't specify otherwise):

-A, --append <chain> <rule>
-D, --delete <chain> <rule>|<rulenum>
-I, --insert <chain> [<rulenum>] <rule>
-R, --replace <chain> <rulenum> <rule>

-Z, --zero [chain]    # zero counters in chain or all chains in table
-F, --flush [chain]   # flush the chain or all chains in the table

  For now, stick with the two targets DROP and ACCEPT.

(sample script here, with comments)
***** Simple filtering criteria
****** Types of matches
generic: available any time
implicit: once you've selected a protocol?
explicit: a bit later (using -m)

  In most of the matches, the use of a "!" means to negate
the meaning of the match, as you'll see shortly.
****** IP addresses
General form (stick with numbers, don't count on DNS)
	{-s,--src,--source} [!] address[/mask]
	{-d,--dst,--destination} [!] address[/mask]

Examples:
	-s 192.168.1.1
	-s 192.168.0.0/255.255.255.0
	-s ! 192.168.0.0/24

Legal, but thoroughly redundant:
	-s 0/0
	-d 0/0
****** Interfaces
Only for INPUT, OUTPUT and PREROUTING chains:

  {-i,--in-interface} [!] eth0
  {-o,--out-interface} [!] eth0

  Also, putting a "+" at the end allows any matching, 
as in "eth+".
****** Protocols
Filter on any combination of protocols from /etc/protocols, 
  either by name or number:

-p, --protocol [!]
    udp
    tcp
    icmp
    udp,tcp		# specify a combination of protocols
    6,17		# same here
    255 (RAW IP)
    ALL (or 0)		# the default
****** Ports (TCP and UDP)
  Only *after* you've selected a TCP or UDP protocol can you select
a port or port range to filter on (an implicit match)

  {--sport,--source-port} [!]
  {--dport,--destination-port} [!]

	 23
	 23:80
	 :1023		# starts at zero
	 1024:		# goes to 65535

  You can also use service names, like ftp, telnet and so on, from 
/etc/services.
****** ICMP matches
  After specifying "-p icmp" you can filter ICMP types, most
frequently type 8 (echo request or ping) and type 0 (echo reply
or pong):

  --icmp-type [!] {0|8}
***** The most common targets
  Once you selected all your filtering criteria for a rule, you can
finally jump to one of the most common targets:

  ACCEPT
  DROP
  REJECT (more on this later)
***** Saving and restoring your chains
  Once you manually establish your filtering rule set, you can
save it, and restore it later with one of:

  # iptables-save
	[{-t|--table} <tablename>]	# save only this table
	[{-c|--counters}]		# save byte/packet counters, too
	> /etc/sysconfig/iptables

  # iptables-restore
	[{-c|--counters}]		# restore byte/packet counters
	< /etc/sysconfig/iptables

  If you look at the admin script /etc/init.d/iptables, the above
are equivalent to:

  # service iptables save
  # service iptables restore 
**** Flushing/clearing/resetting your tables or chains
  Occasionally, you might want to completely clear/reset/dump
your rule set.  (Keep in mind that you will still have default
policies of DROP or ACCEPT on your chains.)

  First, you can flush all of the rules from one chain of a
selected table (default filter) or all chains of that table:

  # iptables -t filter -F INPUT	       # flush INPUT chain of filter table
  # iptables -F INPUT		       # same as above
  # iptables -F			       # flush all chains in filter table

  To flush all rules from all built-in chains from all tables:

  # iptables -F
  # iptables -F nat
  # iptables -F mangle

  For efficiency, you can flush just the tables you know are currently
being used or are loaded:

  for table in $(cat /proc/net/ip_tables_names) ; do
    iptables -t $table -F
  done

  Note that, once you do this, you're back to the default chain 
policies, so you can, if you want, turn off filtering altogether
by following all of this up with:

  # iptables -P INPUT ACCEPT
  # iptables -P OUTPUT ACCEPT
  # iptables -P FORWARD ACCEPT

or you can shut down all traffic by doing the opposite with:

  # iptables -P INPUT DROP
  # iptables -P OUTPUT DROP
  # iptables -P FORWARD DROP

The first option is equivalent to running:

  # service iptables stop	  # don't do *any* filtering

while the second is equivalent to:

  # service iptables panic	  # we've been hacked!  shut down!
**** Explicit matches
***** How explicit matches work
  Explicit matches are added to a rule with the syntax:

  {-m|--match} <module name>  ... more specific stuff here

We'll cover only some of the explicit matches, and even these
might be more specific than you need.
***** Multiport matching

  As an example, 

  -m multiport  {--sport|--dport} 21,23,80

Sadly, you can't use both standard and multiport matching at the 
same time in the same rule.
***** MAC address matching
  Match a specific MAC source address (or its negation):

  -m mac --mac-source [!] <MAC address>
***** TTL match
  -m ttl --ttl 60
***** TOS match
  Type of service matching, fairly advanced:

  -m tos --tos 0x16
***** Limit match
  (I definitely have to expand on this.)

-m [!] limit ##/{second|minute|hour|day}
-m limit --limit-burst 5
***** Owner match
-m owner
	--uid-owner <uid>
	--gid-owner <gid>
	--pid-owner <pid>
	--sid-owner <sid>
**** More fancy filtering and connection tracking
***** Filtering on TCP flags
  An implicit match, based on that you've already selected TCP protocol

flags:

SYN ACK FIN RST URG PSH ALL NONE

--tcp-flags [!] SYN,ACK,RST ACK
--syn == SYN, but not ACK or RST
***** Connection tracking and the state machine
stateful firewall
states: NEW, ESTABLISHED, RELATED, INVALID

  iptables -A INPUT -m state --state RELATED,ESTABLISHED
**** Working with packet and byte counters
  All rules count the number of matching bytes and packets,
which you can examine and manipulate.
 
# iptables
	{-L|--list}		# just list the rules
	{-v|--verbose}		# list the counters as well
	{-x|--exact}		# list exact counts, not K or M
	{-Z|--zero}		# list, then zero the counters
	[chain]			# by default, all chains in table

You can also just zero any of the chains (or all chains in a table):

# iptables -Z [chain]

  When inserting, appending or replacing a rule in a chain, you
can initialize its counters to particular values:
	
# iptables ...  {-c|--set-counters} <pkts> <bytes> 

  Finally, when saving and restoring rules, you can choose to
save and restore the byte and packet counters to the file
/etc/sysconfig/iptables:

  # iptables-save {-c|--counters} [-t <table>} > /etc/sysconfig/iptables
  # iptables-restore {-c|--counters} < /etc/sysconfig/iptables
**** More on targets
***** Types of targets
  So far, all targets have just had the final targets ACCEPT and
DROP.  But there are other choices, and targets fall into one of
two categories: terminating (end of processing) and non-terminating
(where processing continues so the same rule can have more targets).

  Different targets will also be discussed when we cover 
user-defined chains shortly.
***** ACCEPT and DROP targets
Been there, done that.
***** REJECT
  Equivalent to DROP, but you can also send an error message back to
the sending host:

-j REJECT --reject-with
	icmp-net-unreachable
	icmp-host-unreachable
	icmp-port-unreachable (the default)
	icmp-proto-unreachable
	icmp-net-prohibited
	icmp-host-prohibited

	tcp-reset (sends TCP RST packet)
***** LOG
  LOG is a non-terminating target, so you can use a LOG target
and continue processing similar packets (for instance, you might
have a LOG rule, immediately followed by an identical DROP rule).  
LOG is based on the syslog facility, and automatically logs through 
the "kern" facility.  (If you have no idea what this means, you
should read up on the syslog utility.)

  -j LOG

     --log-level {debug|info|...}
     --log-prefix "Up to 29 characters of prefix: "
     
     --log-tcp-sequence
     --log-tcp-options
     --log-ip-options
***** MIRROR
  An experimental and demonstration target, which inverts the source
and destination fields, effectively returning the packet to the sender.
***** Omitted targets
  If you omit the target from a rule, all this means is that no 
filtering will be done, but you will still be keeping track of
packet and byte counters for that rule.
**** User-defined chains
  Define new chains within the same table (again, "filter" being 
the default table) -- you can jump to user-defined chains only
within the same table.  User-defined chains are useful for
breaking a large, sequential rule set into a hierarchical rule
set for processing, among other things.

  In addition to the regular chain operations such as adding,
inserting, replacing and flushing rules from a chain, you have
the following operations for user-defined chains:

  # iptables

    {-N|--new-chain} <chain>		# define a new chain in this table
    {-E|--rename-chain} <oldname> <newname>
    {-X|--delete-chain} [chain]		# delete a user-defined chain or all
					  user-defined chains in table

  Appropriate targets for rules in a user-defined chain include:

    DROP,ACCEPT		  # self-explanatory terminating targets
    LOG			 
    RETURN		  # stop processing, return to calling chain
    another user-defined chain

  You can't delete a user-defined chain until you flush it, which 
explains why you see code like the following to completely flush
your entire rule set:

    iptables -F
    iptables -t nat -F
    iptables -t mangle -F

    iptables -X
    iptables -t nat -X
    iptables -t mangle -X







rday


