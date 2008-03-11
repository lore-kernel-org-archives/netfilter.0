From: Roman Fiedler <roman.fiedler@telbiomed.at>
Subject: Re: [nf-failover] conntrack questions
Date: Tue, 11 Mar 2008 14:57:23 +0000
Message-ID: <47D69DD3.9080307@telbiomed.at>
References: <47BED5AF.3020006@telbiomed.at> <47D6718B.8000905@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47D6718B.8000905@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo Neira Ayuso wrote:
> Roman Fiedler wrote:
>> Hello Everyone,
>>
>> I have some problems using the conntrack application, it could be that I'm just
>> conntrack options the wrong way or that my assumptions about conntracking itself
>> are wrong.
>>
>> Testcase:
>>
>> * Two networks 10.0.0.0/24 and 10.0.1.0/24 separated by firewall
>> * iptables firewall drops all tcp-SYN net A to B and writes log file entry
>> * some DROPS are interesting, so I grep info about them from logfile
>> (src,dest,ports)
>> * with conntrack tool I want to create an conntrack table entry so that the
>> connection is accepted and the following SYN is SNATed/DNATed to a given IP
>> (currently also in net A but that could be changed)
>>
>> Is this possible? My iptables setup should accept all RELATED,ESTABLISHED
>> packets by default and the conntrack entry should set the natting for this
>> single connection and make it ACCEPTED.
>>
>> Currently when I use to add the connection (for testing src port is fixed to
>> 1234 and dest 25, test host is 138, forbidden target 1.10, reroute host 0.77)
>>
>> conntrack -I conntrack -p tcp --orig-src 10.0.0.138 --orig-dst 10.0.1.10
>> --reply-src 10.0.0.77 --reply-dst 10.0.0.1 --orig-port-src 1234 --orig-port-dst
>> 25 --reply-port-src 25 --reply-port-dst 1234 --state SYN_SENT -u ASSURED -t 10
>> --src-nat 10.0.0.1 --dst-nat 10.0.0.77
>>
>> With this rule the rule hit counter is incremented when sending a SYN, but ulogd
>> still reports a DROP
>>
>> tcp      6 117 SYN_SENT src=10.0.0.138 dst=10.0.1.10 sport=1234 dport=25
>> packets=1 bytes=60 [UNREPLIED] src=10.0.0.77 dst=10.0.0.1 sport=25 dport=1234
>> packets=0 bytes=0 [ASSURED] mark=0 use=1
>>
>> ulog output:
>> Feb 22 12:39:17 firewall-grz-0 Shorewall:FORWARD:DROP: IN=eth0 OUT=eth1 MAC=00
>> SRC=10.0.0.138 DST=10.0.1.10 LEN=60 TOS=00 PREC=0x00 TTL=63 ID=61556 CE DF
>> PROTO=TCP SPT=1234 DPT=25 SEQ=2694492256 ACK=0 WINDOW=5840 SYN URGP=0
>>
>> When using LISTEN instead of SYN_SENT, the packets/bytes counter does not go up,
>> but also no drop is reported and packet does not leave via any interface.
>>
>> Can someone give me a hint where I am wrong?
>
> Sorry, to be honest, I don't understand what you're doing. Please,
> elaborate a bit more.

I think that I have found some bits of the answer already by myself and guess 
that my misunderstandings of the relationship between natting and conntrack 
causes your confusion.

I thought that natting and conntrack are linked in a way, so that a entry in the 
conntrack table could influence the natting process. I assume that this is 
wrong, only natting influences the conntrack table content but not vice versa.
[ Part of the reasoning: DNAT is done in PREROUTING, the conntrack table 
checks/modification in the filter table. So changing the conntrack table entry 
dnat ip addr for an existing connection will not change the natting behavior]

If the assumption would have been true, then modification of conntrack table 
entries could be used to reroute an existing (or expected connection) to another 
IP address without changing the iptable rules (especially the DNAT rules in 
PREROUTING).

The conntrack tool would have been the link between userspace, where the 
decision to intercept an reroute a connection is made, and kernel space where 
the iptables and conntrackrecords cause rerouting.

The big idea behind all of that is that one could use an configured and running 
iptables firewall and intercept single connections opened by malicious software 
for analysis without changing (restarting) the firewall. A primitive analysis 
program in userspace would decide which connections are "malicious" and trigger 
the rerouting. Example

Standard http request (allowed in standard firewall config):

any host --> external IP on firewall, natted to http server --->  http server


If analysis program says host X is bad, only connections from that server are 
rerouted, so that they cannot damage real system and analysis can begin.

only host X --> ext IP natted to fake server --> fake server



As I understand it now, such kind of connection intercept cannot be done using 
iptables, so I have to look out for some other solution. Perhaps someone can 
tell me if my assumption of conntrack - natting interactions are correct, just 
for curiosity.
