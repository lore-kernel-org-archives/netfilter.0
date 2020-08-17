From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Grammar in a bash script
Date: Mon, 17 Aug 2020 10:42:02 +0200
Message-ID: <df0b8e1e-9227-ff9f-de61-901fa1cfb686@thelounge.net>
References: <681adee0-91f7-506b-d8f7-c3f270e613aa@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <681adee0-91f7-506b-d8f7-c3f270e613aa@tiscali.it>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mario V Guenzi <jclark@tiscali.it>, Netfilter list <netfilter@vger.kernel.org>
Cc: david@hajes.org



Am 17.08.20 um 10:09 schrieb Mario V Guenzi:
> Il 17/08/20 09:58, david@hajes.org ha scritto:
>> Standard firewall strategy - policy DROP all and allow only what you really need.
> yes, but if I put drop as default policy it doesn't even let me access
> via ssh, that's why I was forced not to put policy and then drop with
> the rules, and for this, once finished I wanted to further close
> Sorry for my poor english

your script first set a default drop policy and then opens the ports
which should be open, including SSH

* deny policy
* est/related allow
* ports to allow

doing otherwise has a chance that there is a timewindow where you accept
unwanted connections which then land in conntrack and stay open because
packets belong to a existing connection

below how iptables scripts looking for decades and no, you don't lose
your ssh session when execute it because of how tcp works with re-transmits

---------------------------------

#!/bin/bash
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -F
iptables -X
iptables -A INPUT -p all -m conntrack --ctstate RELATED,ESTABLISHED -j
ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p all -j DROP
