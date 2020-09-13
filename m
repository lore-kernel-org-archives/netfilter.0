From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Filter based on string (or other content)
Date: Sun, 13 Sep 2020 10:45:52 +1000
Message-ID: <20200913004552.GE15387@dimstar.local.net>
References: <d3356c66687003310366b87a69328d329074efcb.camel@neobits.nl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d3356c66687003310366b87a69328d329074efcb.camel@neobits.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Sep 12, 2020 at 03:41:00PM +0200, K. de Jong wrote:
> I switched to nftables, but I miss one key feature. That is the ability
> to filter packets based on a string. The goal is to filter all traffic
> going to facebook.com or m.facebook.com for a set of days and time
> ranges. The time ranges and days features are present in nftables, I've
> spotted them. So I'll not focus on that. nftables-translate gave
> errors.
>
>
> This is what I had in my iptables script:
>
>
> ---
>
> # Some variables, there are used in the rules below
> facebook_filters=("www.facebook.com" "fbcdn.net" "m.facebook.com")
> week_fb_timestart="03:00:00"
> week_fb_timestop="20:00:00"
> weekend_fb_timestart="03:00:00"
> weekend_fb_timestop="17:00:00"
>
>
> # Create table called facebook, which includes day and time
> specifications
> iptables -A facebook -p tcp -m multiport --dports 80,443 -m conntrack
> --ctstate NEW,RELATED,ESTABLISHED -m comment --comment "Reject Facebook
> during the week" -m time --timestart "$week_fb_timestart" --timestop
> "$week_fb_timestop" --weekdays Mon,Tue,Wed,Thu,Fri -j REJECT --reject-
> with icmp-port-unreachable
>
>
> # A rule that applies the string filter, created by a loop through the
> facebook_filters array
> for filter in "${facebook_filters[@]}"; do
>   iptables -A FORWARD -i tun+ -s "$vpn_ipv4_sub" -m string --string
> "$filter" --algo bm -j facebook
> done
>
>
> ---
>
> I can't seem to find an equal feature in nftables that can perform the
> same like I do here in iptables. A filter based on IPs is not reliable,
> so adding the IPs of facebook.com might work for a while, until those
> IPs change.
>
> Does anyone know a solution to do this with nftables?


I think I have done something like what you're after using 'queue' target and
writing a netfilter-queue program. See https://github.com/duncan-roe/nfq

Cheers ... Duncan.
