From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging Portscans
Date: Mon, 21 Oct 2002 12:27:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210211127.g9LBRSL31548@vulcan.rissington.net>
References: <20021021093912.87487.qmail@web40709.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021093912.87487.qmail@web40709.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Monday 21 October 2002 10:39 am, Tasha Smith wrote:

> Hii,
> I was wandering why iptables is NOT logging to my /var/log/messages/ NMAPS
> stealth port scans or when i telnet any port?.  Here are what the first
> part of my rules look like. How can u add some rules soo i can see (LOG)
> all ports scans or connection attemps on my machine????
>
> # I tryed to put in a logging rule here and it didnt log the port scan!
> iptables -A INPUT -i eth0 -p tcp \
>          --dport 111 -j LOG-prefix "DROP sunrpc: "
>
> # I tryed a LOG Policy here too like this!
> iptables -i INPUT -p tcp -j LOG --log-prefix "log-tcp-test: "
>
> iptables -A INPUT -m state --state ESTABLSIHED,RELATED -j ACCEPT
> iptables -A FOWARD -m state --state ESTABLSIHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLSIHED,RELATED -j ACCEPT
>
> And then after this i have all stuff that is allowed on my machine like
> DNS, DHCP, and my forwarding rules!

I notice you have rules in both the INPUT and the FORWARD chains, but your 
LOG rules are only in INPUT.

Are you trying to scan the firewall itself, or perhaps a machine on the other 
side, which is being routed by the firewall ?   You might need the LOG rules 
in the FORWARD chain.

So long as we assume that the various typos in the rules you've given are not 
actually in the scripts you are using (eg -i instead of -I, misspellings of 
ACCEPT, FORWARD and ESTABLISHED) then there's no reason why you shouldn't be 
logging all TCP packets using your "log-tcp-test" rule shown above.

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

