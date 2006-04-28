From: Drew Leske <dleske@uvic.ca>
Subject: Re: IP drop question
Date: Fri, 28 Apr 2006 09:32:49 -0700
Message-ID: <445243B1.3080904@uvic.ca>
References: <1146185403.29318.7.camel@prix.pricom.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1146185403.29318.7.camel@prix.pricom.com.au>
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
To: phil@pricom.com.au
Cc: netfilter@lists.netfilter.org

Hi Philip,

> My config does not appear to be dropping unauthorised IPs - in my
> logwatch file I am still getting lines like:
> 
>  Failed logins from:
>     211.238.253.248: 54 times
>  
>  Illegal users from:
>     202.110.131.27: 1 time
>     211.238.253.248: 164 times

I'm not familiar with logwatch.  Are these SSH, telnet, other?  I assume
SSH, because new telnet connections are allowed in with this rule:

> -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 25 --syn
> -j ACCEPT

Going through the iptables you provided, let's say with 211.238.253.248,
coming in on a new connection for SSH on port 22, the first rule matched
would be this one (assuming eth0 and/or eth1 are external interfaces):

> -A INPUT -i eth0 -j ACCEPT
> -A INPUT -i eth1 -j ACCEPT

So they'd get through.

As an aside, I'd recommend you 'tail -f /var/log/messages' or wherever
you've got your kernel messages going in a separate window while you tune
your iptables configuration.  This will allow you to catch these attempts
and make rules for them faster than waiting to see them show up in a log the
next day.

Cheers,
Drew.


> *filter
> :INPUT DROP [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> # -A INPUT -p tcp -i eth0 --dport 22 --sport 1024:65535 -j LOG
> --log-prefix "ssh connect:"
> -A INPUT -p tcp -m tcp -s 149.171.173.169 --dport 22 -j ACCEPT
> -A INPUT -p tcp -m tcp -s 203.166.81.114 --dport 22 -j ACCEPT
> # -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 22 -j
> ACCEPT 
> -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 25 --syn
> -j ACCEPT
> -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 53 --syn
> -j ACCEPT
> -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 80 -j
> ACCEPT
> -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 3128
> --syn -j ACCEPT
> -A OUTPUT -o lo -j ACCEPT
> -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -i eth0 -j ACCEPT
> -A INPUT -i eth1 -j ACCEPT
> -A INPUT -p udp -m udp -s 149.171.173.169 --sport 53 -d 0/0 -j ACCEPT
> -A INPUT -p udp -m udp -s 203.166.81.114 --sport 53 -d 0/0 -j ACCEPT
> -A INPUT -p tcp -m tcp --syn -j REJECT
> -A INPUT -p udp -m udp -j REJECT
> -A INPUT -j LOG --log-level alert
> -A INPUT -j LOG --log-prefix "Dropped: "
> COMMIT

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

