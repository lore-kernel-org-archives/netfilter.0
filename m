From: Paul Annesley <paul.annesley@gmail.com>
Subject: Re: lots of tcp port 445 traffic
Date: Tue, 7 Dec 2004 09:56:20 +1100
Message-ID: <99fb058804120614564f38abef@mail.gmail.com>
References: <41B48EB0.3030307@phreaker.net>
Reply-To: Paul Annesley <paul.annesley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B48EB0.3030307@phreaker.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 07 Dec 2004 00:54:08 +0800, ro0ot <ro0ot@phreaker.net> wrote:
> Hi,
> 
> I get lots of tcp port 445 traffic when I do a tcpdump -n port 445,
> could it be an attack?

Many viruses hammer TCP port 445 attempting to exploit MS Windows
vulnerabilities.  They attempt to establish TCP sessions on dport 445
to a massive amount of P addresses.. this can fill up
/proc/net/ip_conntrack in no time, amongst other things.

> 
> I check on the syslog files at /var/log/syslog, it shows this as below: -
> 
> Dec  7 00:36:40 fw01 kernel: Neighbour table overflow.
> Dec  7 00:36:46 fw01 kernel: NET: 32 messages suppressed.
> Dec  7 00:36:46 fw01 kernel: Neighbour table overflow.
> Dec  7 00:36:51 fw01 kernel: NET: 27 messages suppressed.
> Dec  7 00:36:51 fw01 kernel: Neighbour table overflow.
> Dec  7 00:38:14 fw01 kernel: NET: 6 messages suppressed.
> Dec  7 00:38:14 fw01 kernel: Neighbour table overflow.
> 
> When I try to ping my router IP address, I get this message below: -
> 
> connect: No buffer space available
> 
> I did tried running the below command and it seems not helping much: -
> 
> iptables -I cus2jarwan -p tcp --dport 445 -j REJECT --reject-with tcp-reset
> 
> or
> 
> iptables -I cus2jarwan -p tcp --dport 445 -j DROP
> 

You definately don't want to use -J REJECT - this will do more harm
than good, as it will be generating an ICMP unreachable message for
each port 445 packet.

> How can I stop this tcp port 445 traffic?  Or how can I prevent it?

Use the drop rule you mentioned.  Apply it to INPUT and also FORWARD.

If possible;
- remove the viruses
- disable the infected computer(s) switch port(s) until cleaned
- unplug the infected computer(s) from the network until cleaned

Regards,
Paul

> 
> Regards,
> ro0ot
> 
>

