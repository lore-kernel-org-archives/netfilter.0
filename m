From: Gianni Pucciani <gp.puccio@tin.it>
Subject: Re: opening connection for Tomcat
Date: Thu, 08 Apr 2004 22:13:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4075B24D.1020601@tin.it>
References: <40756C19.3010606@tin.it>	 <006f01c41d86$c82d6d60$51a2fea9@heretic> <1081446600.2453.63.camel@katala.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081446600.2453.63.camel@katala.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: Netfilter <netfilter@lists.netfilter.org>

Ok, I've fixed the problem: it seems that the address 0.0.0.0 is no good.

Many thanks

Gianni
Rob Sterenborg wrote:

>On Thu, 2004-04-08 at 18:30, Alexis wrote:
>  
>
>>you must change to OUTPUT the first rule at least. you're filtering all
>>outgoing packets.
>>
>>    
>>
>
>In these rules I only see policy ACCEPT for the OUTPUT chain, so IMHO
>there's no filtering there.
>
>  
>
>>>Hi all,
>>>I was in trouble opening a port for services with tomcat:
>>>Is this rule right? I'm behind an adsl router that forward every
>>>connection on port 8080 to <myprivateip>.
>>>
>>>iptables -P INPUT DROP
>>>iptables -P OUTPUT ACCEPT
>>>iptables -P FORWARD DROP
>>>
>>>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>>iptables -A INPUT -p tcp -d <myprivateip> --dport 8080 -s 0.0.0.0 -m
>>>state --state NEW -j ACCEPT
>>>      
>>>
>
>Is your Tomcat listening on 8080/tcp ? (netstat -an|grep 8080)
>Are you sure that your router is forwarding all connections ?
>
>Check with a logging rule between the -m state and the -p tcp rules to
>see what's going on (if there is) :
>
>iptables -A INPUT -j LOG --log-prefix "_ipt:check"
>
>
>Gr,
>Rob
>
>
>
>
>  
>


