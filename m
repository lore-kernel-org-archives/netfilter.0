From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Invalid httpd logs with port forwarding
Date: Sun, 3 Aug 2003 16:53:14 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308031650040.8771-100000@localhost>
References: <1059913360.1223.36.camel@office.dd.qc.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059913360.1223.36.camel@office.dd.qc.ca>
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
To: Dominic Duval <dd@dd.qc.ca>
Cc: netfilter@lists.netfilter.org

Hi Dominic,

> Simply put, is there a way to do port forwarding without having the
> source address modified?

Yes, the DNAT target by itself does NOT modify the source address. 

> Here is the problem: I'm using the following rules to forward port 80
> trafic to a HTTP server behind a firewall:
> 
> iptables -t nat -A PREROUTING -p tcp --dport 80 -d 66.45.170.200 -j DNAT
> --to-destination 192.168.1.200:80
> iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.200 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> The port forwarding works just fine, but all log entries on the HTTP
> server show the same source address, which is the local address of the
> firewall (192.168.1.4). I'd like the logs to show the real IP address of
> the client from which the connection originates.

Since you don't list your POSTROUTING rules, I cannot be sure, but I
suspect that you have another rule, maybe MASQUERADE or SNAT, which is
affecting your inbound traffic when you don't want it to. For example, 
maybe you have a rule to MASQUERADE everything in your POSTROUTING chain, 
and this is masquerading incoming as well as outgoing traffic.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


