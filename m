From: "Khan, Arshad" <a.m.khan@bham.ac.uk>
Subject: RE: load-balancing with netfilter: round robin or what??
Date: Tue, 7 Oct 2003 10:41:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2967754783C6E34C94243EAC0D161368BB0393@med-ex1.bham.ac.uk>
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
To: 'Pedro Salazar' <pedro-b-salazar@ptinovacao.pt>
Cc: netfilter@lists.netfilter.org

how does this compare with the Linux Virtual Server project?

Arshad

-----Original Message-----
From: Pedro Salazar [mailto:pedro-b-salazar@ptinovacao.pt]
Sent: 07 October 2003 10:36
To: newkirk@newkirk.us
Cc: netfilter@lists.netfilter.org
Subject: Re: load-balancing with netfilter: round robin or what??


> But the rule performing the balancing is in OUTPUT table, and so only
> affects connections from the NAT box itself...  Also, I think your
> double --to construction is invalid, iptables accepts it but it appears
> never to work.
> 
> Try this rule:
> 
> /sbin/iptables -t nat -A PREROUTING -d 192.168.89.44 -p tcp --dport  \
> 9000 -j DNAT --to 192.168.89.158-192.168.89.159:80
> 
> It will distribute new connections 'randomly' across the DNAT ip space,
> in this case two IPs.  This isn't 'real' load-balancing, but it's a
> quick and easy substitute that is sufficient for many purposes.
> 

Apparently you have right. I changed to a simple "--to" as you said, and
now I noticed that the requests are quite "round-robin". However, the 2
"--to" have worked also but weren't so *load-balanced* as with a simple
"--to" (I verified with a large massive requests). But don't forget that
my IP addresses are sequencial and in another scenario I probably must
use the rule with 2 "--to", no?

Thanks! (to all of you)

Pedro Salazar. 
-- 
PS
pedro-b-salazar@ptinovacao.pt
PGP:0E129E31D803BC61


