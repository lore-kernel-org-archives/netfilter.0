From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: alias interfaces
Date: Fri, 18 Oct 2002 21:01:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021018200136.RFJF459.mta02-svc.ntlworld.com@there>
References: <03c701c276c2$388fb3f0$13c01dd0@shadowfax> <200210181651.g9IGpjL28851@vulcan.rissington.net> <03f901c276e0$910fd140$13c01dd0@shadowfax>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03f901c276e0$910fd140$13c01dd0@shadowfax>
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

On Friday 18 October 2002 8:57 pm, Mario Antonio wrote:

> Antony,
>
> Thanks for your reply. I really appreciate it.
>
> Linux 7.3 and iptables v1.2.7a
> eth0=10.10.10.239
> eth0:0=10.10.13.227
>
> workstation accessing the server: 10.10.10.19
>
> I have the following testing set of rules:
>
> #! /bin/sh
> /usr/local/sbin/iptables -F
> /usr/local/sbin/iptables -P INPUT DROP
> #/usr/local/sbin/iptables -A INPUT   -j LOG --log-prefix "IPTABLES-IN "
> /usr/local/sbin/iptables -P FORWARD ACCEPT
> /usr/local/sbin/iptables -P OUTPUT ACCEPT
> /usr/local/sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j
> ACCEPT
> /usr/local/sbin/iptables -A INPUT -s 10.10.10.19  -d 10.10.10.239 -p tcp -m
> tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> /usr/local/sbin/iptables -A INPUT -i eth0  -s 10.10.10.19  -d
> 10.10.13.227 -p tcp -m tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>
> With my set of rules I can access 10.10.10.239 without any problem.
> But to access 10.10.13.227, I have to set -->iptables -P INPUT ACCEPT
> What am I missing?

I don't know.   Try adding a LOGging rule at the end of your INPUT chain to 
see what extra packets are trying to get in but are being blocked.

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

