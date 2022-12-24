From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: bftables and scripts question
Date: Sat, 24 Dec 2022 04:40:14 +0100
Message-ID: <e3b5ff3f-b6f2-4b13-08ec-a26b94ff2d38@thelounge.net>
References: <b928e785-3108-088f-905f-3228e742b165@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <b928e785-3108-088f-905f-3228e742b165@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 24.12.22 um 03:30 schrieb ToddAndMargo:
> I am currently using iptables but and starting the process
> of learning nftables.
> 
> Question.  My iptables are in a bash programs (scripts).
> 
> For instance:
> 
> if [ "$enable_rdp" = "yes" ]; then
>     # Warning: this user is given access to SYN's
>     # rdp is M$ Terminal Services
>     <lots of iptables>
>     logger -p user.notice -t firewall "Firewall external rules warning: 
> $ts_server (Terminal Server) accepts SYN's on Port $rdp_port"
> fi
> 
> Will nftables work the same way?

not a single line above is iptables specific at all

> And, will the converters also roll over the bash code?

no - "iptables-restore-translate" or whatever can by definition have no 
clue about whatever bash script - it faces the iptables ruleset no 
matter how it was created

either use iptables-nft or start from scratch with your bash script and 
expect a lot of new learning

--------------------------------------

the kernel only knows about the active ruleset as your "iptables-save" 
file don't contain anything else

iptables-nft -t filter --list --numeric --line-numbers --verbose

iptables-nft -t mangle --list --numeric --line-numbers --verbose

iptables-nft -t raw --list --numeric --line-numbers --verbose


