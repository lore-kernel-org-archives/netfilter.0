From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: iptables-restore - does  it breaks existing connections?
Date: Fri, 27 May 2011 08:06:16 -0700
Message-ID: <4DDFBDE8.8010808@arpa.org>
References: <1748026766.20110525102949@yandex.ru>
Reply-To: erik-lists@arpa.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1748026766.20110525102949@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: gapsf@yandex.ru

On 05/24/2011 08:29 PM, gapsf@yandex.ru wrote:
> For example, when (re)loading the same set of rules?

When using iptables-restore or a similar method, the new table is loaded 
atomically.  As long as the new ruleset permits the traffic, there 
should be no dropped connections (or connection states).  The kernel 
keeps connection state information independently of firewall rules.

The best way to explicitly guarantee that all your connections stay up 
if you plan on loading a different ruleset, is to make sure there's a 
rule near the top of each of your INPUT/OUTPUT/FORWARD chains that 
accepts established/related connections:

iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-- 
Erik Schorr KD6AUT
Advocate and Consultant
VMware/Iptables/Exim/Perl
