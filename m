From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Firewall Rules Help
Date: Sat, 22 Aug 2009 13:42:31 +0200
Message-ID: <4A8FD9A7.3090600@chello.at>
References: <4399fd970908210841j1213b83di98e4ea3d53d1082f@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4399fd970908210841j1213b83di98e4ea3d53d1082f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: NICHOLAS KLINE <nkline@kent.edu>

NICHOLAS KLINE wrote:
> Hi,
>
> Thanks to everyone who constructively critiqued my previous firewall
> rules and provided advice. After reading through all of the feedback,
> I revised my firewall rules. I would appreciate it if you would please
> critique them again.
>
> The situation remains the same:
> - laptop running desktop version of Ubuntu 8.x
> - laptop will be used on either a private LAN or public network
> - laptop will switch between wired and wireless network
> - no server services will be running (HTTPD, FTP, etc.)
>
> Remaining Questions:
> 1.) If I change from wired to wireless, will these rules still apply?
>   

Of course they will apply, the question is whether they work as you want 
;-).
But from my point of view they should fulfill your described goal, as 
you do not use IP addresses, or interfaces (which could change) in your 
ruleset.
>
> Revised Firewall Rules
> -----------------------------
>
> # Establish some variables:
>
> # Location of IPTABLES on your system
> IPTABLES="/sbin/iptables"
>
>
> # SETUP:
>
> # Flush active rules and custom tables
> $IPTABLES --flush
> $IPTABLES -t nat --flush
> $IPTABLES -t mangle --flush
>
> $IPTABLES --delete-chain
> $IPTABLES -t nat --delete-chain
> $IPTABLES -t mangle --delete-chain
>
> # Give free reign to the loopback interfaces, i.e. local processes may connect
> # to other processes' listening-ports.
> $IPTABLES -A INPUT  -i lo -j ACCEPT
> $IPTABLES -A OUTPUT -o lo -j ACCEPT
>   
This output rule is not needed, as the policy will allow.
> # Set default policies for all chains.
> # User-defined chains cannot be assigned default policies.
> # NAT and mangle tables use default ACCEPT policies.
> # DROP in nat table is prohibited in newer iptables.
> # DROP in mangle table creates hassle.
> $IPTABLES -P INPUT DROP
> $IPTABLES -P FORWARD DROP
> $IPTABLES -P OUTPUT ACCEPT
>
>
> # INBOUND POLICY:
>
> # Accept inbound packets that are part of previously-OK'ed sessions
> $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> # Log and drop anything not accepted above
> $IPTABLES -A INPUT -j LOG --log-prefix "Dropped by default (INPUT):"
>
>
> # OUTBOUND POLICY:
> # Allow all outbound traffic.
>
>
> # Log & drop ALL incoming packets destined anywhere but here.
> $IPTABLES -A FORWARD -j LOG --log-prefix "Attempted FORWARD? Dropped
> by default:"
>
> --- End of rules ---
>   

Your logs will eventually grow fast, think of using the 'limit' 
extension for logging.

Greets

Mart
