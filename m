From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging
Date: Mon, 21 Oct 2002 22:39:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021213938.CKCL28004.mta07-svc.ntlworld.com@there>
References: <20021021210421.79305.qmail@web40702.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021210421.79305.qmail@web40702.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 21 October 2002 10:04 pm, Tasha Smith wrote:

> I was wandering if you can help me with my logging rules. Ill give you my
> rules exactly what they look like now (without typos) :)  And i scanned it
> with nmap from a machine NOT ROUTED by the firewall machine! And i get no
> LOG file.

No typos, heh :-) ?

Anyway, can you explain those last two comments - where are you scanning from 
(I don't understand your routing comment) - and "you get no log file" - do 
you mean you never get any logs at all, or you get log entries on the screen 
but not in a file, or you get logs sometimes, but not when you're doing a 
particular type of scan ?

> I even added this to my syslog.conf file......
>
>  kern.warn                            /var/log/fwlog

Does this successfully log anything at all ?  I mean, if you insert a rule 
right at the start of your INPUT chain:
iptables -I INPUT -j LOG --log-prefix "fwlog: "

Does anything go into /var/log/fwlog ?

(I would expect you to have to add the option "--log-level=warn" to match the 
entry in your syslog.conf file.)

>  How can i get this machine to log STEALTH port scans and stuff???

Explain what you mean by a Stealth port scan ?   If yu;re using nmap, what 
options are you using ?

> iptables           --flush
> iptables -t -nat   --flush
> iptables -t mangle --flush
>
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>
> iptables --policy INPUT DROP
> iptables --policy FORWARD DROP
> iptables --policy OUTPUT ACCEPT
>
> iptables -A INPUT      -p tcp --tcp-flags ALL NONE -j DROP
> iptables -A FORWARD    -p tcp --tcp-flags ALL NONE -j DROP

Do you get the same result from your port scan (and your logs) if you remove 
these two rules ?

> iptables -A INPUT    -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FOWWARD  -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A INPUT -i eth0 -p udp \
>          -s ISP.DHCP  --sport 67 \
>          --dport 68 -j ACCEPT
> iptables -A OUTPUT -o eth0 -p udp \
>          -s eth0 --sport 68 \
>          -d ISP.DHCP --dport 67 -j ACCEPT
>
> iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT
>
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> iptables -A INPUT -i eth0 -p tcp \
>          --dport 22,25,111,1024,1025 -j LOG --log-prefix "Log-test: "

Okay, so this LOGging rule is last in your INPUT chain, just before the 
default DROP policy.

I assume you are scanning the Firewall address itself ?

By the way, what result do you get from the scan ?   Does it suggest you have 
closed ports, open ones, nothing accessible, what ?

What happens if you simply ssh to the Firewall, or telnet to port 25 ?   Do 
you see a log entry then ?

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

