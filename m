From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: Diagnosing "Error: NAT is only supported for IPv4/IPv6"
Date: Tue, 22 Aug 2017 09:55:10 -0700
Message-ID: <94b2bbfe-b72f-992f-b1c6-ec36e0aa4c1b@wagsky.com>
References: <5156c091-4b06-9efd-fd33-9a117f526572@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5156c091-4b06-9efd-fd33-9a117f526572@wagsky.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Digging into the cause (and, for now ignoring the unhelpful error 
message), this appears to be a bug in nft

No matter what the documentation says, it appears that NAT statements 
can't be in an "inet" table

Parses and loads with "table ip"
================================

#!/usr/sbin/nft -f

flush ruleset

table ip global {

     chain nat_in {
         type nat hook prerouting priority -100
     continue
     }

     chain nat_out {
         type nat hook postrouting priority -100
     continue
     }

}


Fails with "table inet"
=======================

#!/usr/sbin/nft -f

flush ruleset

table inet global {

     chain nat_in {
         type nat hook prerouting priority -100
     continue
     }

     chain nat_out {
         type nat hook postrouting priority -100
     continue
     }

}


The error messages here are different, but equally useless

$ sudo nft -f nftables.conf
nftables.conf:3:1-14: Error: Could not process rule: No such file or 
directory
flush ruleset
^^^^^^^^^^^^^^
nftables.conf:3:1-14: Error: Could not process rule: No such file or 
directory
flush ruleset
^^^^^^^^^^^^^^
nftables.conf:3:1-14: Error: Could not process rule: No such file or 
directory
flush ruleset
^^^^^^^^^^^^^^
nftables.conf:3:1-14: Error: Could not process rule: No such file or 
directory
flush ruleset
^^^^^^^^^^^^^^


On 8/21/17 2:42 PM, Jeff Kletsky wrote:

> Objectives:
>
> * Get DNAT working for IPv4 on "if_external"
>
> * Get SNAT working for IPv4 on "if_external"
>
> * Be able to easily draft, manage, and read rule execution "around" NAT
>   (some rules before NAT, others after,
>    with one "pair" for inbound and another pair for outbound packets)
>
>
> TL;DR:
>
> Ruleset parses and works as expected without NAT statements.
>
> Adding simple NAT statements results in "meaningless" reference in 
> error message:
>
>     In file included from nftables.conf:114:5-45:
>     ./blackhole_check_internal.nft:6:54-57: Error: NAT is only 
> supported for IPv4/IPv6
>     nal_allowed_net {
> ^^^^
>
> That's a non-sequetor, nowhere near any NAT-related statement.
>
> The NAT-related statements are in an "inet" table.
>
> The NAT-related statements are all "protected" with "ip version 4" now,
> and the problem still persists.
>
> How do I locate the problem?

