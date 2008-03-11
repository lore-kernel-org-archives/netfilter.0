From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nf-failover] conntrack questions
Date: Tue, 11 Mar 2008 12:48:27 +0100
Message-ID: <47D6718B.8000905@netfilter.org>
References: <47BED5AF.3020006@telbiomed.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47BED5AF.3020006@telbiomed.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roman Fiedler <roman.fiedler@telbiomed.at>
Cc: netfilter@vger.kernel.org

Roman Fiedler wrote:
> Hello Everyone,
> 
> I have some problems using the conntrack application, it could be that I'm just 
> conntrack options the wrong way or that my assumptions about conntracking itself 
> are wrong.
> 
> Testcase:
> 
> * Two networks 10.0.0.0/24 and 10.0.1.0/24 separated by firewall
> * iptables firewall drops all tcp-SYN net A to B and writes log file entry
> * some DROPS are interesting, so I grep info about them from logfile 
> (src,dest,ports)
> * with conntrack tool I want to create an conntrack table entry so that the 
> connection is accepted and the following SYN is SNATed/DNATed to a given IP 
> (currently also in net A but that could be changed)
> 
> Is this possible? My iptables setup should accept all RELATED,ESTABLISHED 
> packets by default and the conntrack entry should set the natting for this 
> single connection and make it ACCEPTED.
> 
> Currently when I use to add the connection (for testing src port is fixed to 
> 1234 and dest 25, test host is 138, forbidden target 1.10, reroute host 0.77)
> 
> conntrack -I conntrack -p tcp --orig-src 10.0.0.138 --orig-dst 10.0.1.10 
> --reply-src 10.0.0.77 --reply-dst 10.0.0.1 --orig-port-src 1234 --orig-port-dst 
> 25 --reply-port-src 25 --reply-port-dst 1234 --state SYN_SENT -u ASSURED -t 10 
> --src-nat 10.0.0.1 --dst-nat 10.0.0.77
> 
> With this rule the rule hit counter is incremented when sending a SYN, but ulogd 
> still reports a DROP
> 
> tcp      6 117 SYN_SENT src=10.0.0.138 dst=10.0.1.10 sport=1234 dport=25 
> packets=1 bytes=60 [UNREPLIED] src=10.0.0.77 dst=10.0.0.1 sport=25 dport=1234 
> packets=0 bytes=0 [ASSURED] mark=0 use=1
> 
> ulog output:
> Feb 22 12:39:17 firewall-grz-0 Shorewall:FORWARD:DROP: IN=eth0 OUT=eth1 MAC=00 
> SRC=10.0.0.138 DST=10.0.1.10 LEN=60 TOS=00 PREC=0x00 TTL=63 ID=61556 CE DF 
> PROTO=TCP SPT=1234 DPT=25 SEQ=2694492256 ACK=0 WINDOW=5840 SYN URGP=0
> 
> When using LISTEN instead of SYN_SENT, the packets/bytes counter does not go up, 
> but also no drop is reported and packet does not leave via any interface.
> 
> Can someone give me a hint where I am wrong?

Sorry, to be honest, I don't understand what you're doing. Please,
elaborate a bit more.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
