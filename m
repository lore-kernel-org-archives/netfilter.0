From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: How to block all ports except port 21,22,80,8080 ???
Date: 18 Feb 2003 13:45:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045572351.17068.2.camel@kermit.spenneberg.de>
References: <1045555939.94722.jacob_chan@so-net.net.tw> 
	<1045558628.1967.29.camel@kermit.spenneberg.de>
	<1045560648.1913.39.camel@kermit.spenneberg.de> 
	<3E5207B9.7C2BEDFA@patrick.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5207B9.7C2BEDFA@patrick.at>
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
To: Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-02-18 um 11.15 schrieb Patrick Maartense:
> it would be MUCH better to
> 
> iptables -p INPUT DROP # default drop
> then allow only these ports
> iptables -A INPUT -p tcp -m multiport  --dport 21,22,80,8080 -j ACCEPT
Sure. Even this little script has to be improved to be accepted as a
"firewall script". Stuff like Conntrack, Egress and Ingress Filter are
missing. 
But a short questions gets a short answer.

Cheers,

Ralf

-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

