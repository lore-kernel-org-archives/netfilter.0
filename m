From: mailinglists@belfin.ch
Subject: RE: IPTables Logging Problem.
Date: Tue, 3 Dec 2002 09:43:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B2505@mx.seaan.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Amit Kumar Gupta' <amitkumar.gupta@wipro.com>, netfilter@lists.netfilter.org


Hi

> I am having a problem reg IPtables Logging. Suppose I want to LOG all
> the packets for a particular session. How I can do that? 
> (Here, Session
> say telnet is established b/w 2 hosts and I want to Log all 
> the packets
> on host A (say) i.e. the outgoing and incoming packets). 
> I know abt the commans :-
> 
> Iptables -A INPUT -s HOSTA -d HOSTB -p tcp -sport 21 -j LOG 

What kind of rule is that? does your client build up a connection from low
ports to low ports? My computer doesn't do that. But to answer your
question:

iptables -A OUTPUT -s HOSTB -d HOSTA -p 6 --dport 21 -j LOG

will solve your problem.

> But it logs only packets from HostA to HostB 

of course

> while I want the reverse
> also. 

put in that second rule.

Philipp

