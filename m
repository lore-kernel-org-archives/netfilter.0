From: Juan Hernandez <alucard@kanux.com>
Subject: RE: any suggestions
Date: 28 Nov 2003 13:07:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070039232.1086.35.camel@webmail.aeropostal.com.ve>
References: <7A3B4AA360FDEF448F3390421FC8D731012C5C0A@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731012C5C0A@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com, Lista de netfilter <netfilter@lists.netfilter.org>

Ok, these are my rules right now

echo 0 > /proc/sys/net/ipv4/ip_forward

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -i eth1 -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -d 192.168.0.1 -p tcp --dport 25
-j DNAT --to-destination 192.168.0.2:25

#and this one that you just said, but I had to remove the -i option
because it's not allowed in POSTROUTING

iptables -t nat -A POSTROUTING -s 192.168.0.2 -p tcp --sport 25 -j SNAT
--to-source 192.168.0.1

echo 1 > /proc/sys/net/ipv4/ip_forward

What made me write again to this list about this is that, it suddenly
stopped working (redirecting packets to port 25 in 192.168.0.2) and it
used to do it. I just added the SNAT rule and it's not doing anything
and i'm able to telnet perfectly to the mail server... I flushed and
deleted all the rules and reloaded this script again and still doesn't
work. 

Thanx a lot for your time, I really appreciate it

Juan


On Fri, 2003-11-28 at 12:51, bmcdowell@coxhealthplans.com wrote:
> Perhaps you didn't get my reply from earlier, or perhaps it didn't appear to be helpful.
> 
> I see one possible issue here.  Let me try and explain it without a whiteboard (I'm a visual person when it comes to networking):
> 
> End User A sends a packet destined for 192.168.0.1:25.  Your rules DNAT it to 192.168.0.2:25.  The following response from 192.168.0.2:25 is sent directly to End User A.  End User A was expecting a response from 192.168.0.1, and so discards the response from 192.168.0.2 as being in error.
> 
> Without any information as to how all the devices are physically laid out, I'd be hard pressed to recommend anything.  In general, you best bet is going to be to add an SNAT rule that reads something like:
> 
> iptables -t nat -A POSTROUTING -i eth1 -s 192.168.0.2 -p tcp --sport 25
> -j SNAT --to-source 192.168.0.1
> 
> Check my syntax on that, I'm just trying to make my point...
> 
> 
> Bob
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Juan Hernandez
> Sent: Friday, November 28, 2003 10:01 AM
> To: Lista de netfilter
> Subject: any sugestions
> 
> 
> Im using this in a webserver that must redirect everything to
> 192.168.0.2 in port 25... any suggestions? using this script will enable
> to accept connections in port 80 and forward all the port 25 to the
> other server?? am I missing something or could it be improved?? 
> 
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
> iptables -A FORWARD -i eth1 -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -d 192.168.0.1 -p tcp --dport 25
> -j DNAT --to-destination 192.168.0.2:25
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> Thanx a lot 
> 


