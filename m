From: Michal Soltys <soltys@ziu.info>
Subject: Re: Use iptables to force next hop
Date: Thu, 08 Nov 2012 23:13:57 +0100
Message-ID: <509C2EA5.6050201@ziu.info>
References: <FABE6FFC-E757-421A-BB4B-F18975F31E9B@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FABE6FFC-E757-421A-BB4B-F18975F31E9B@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter@vger.kernel.org

On 2012-11-08 22:08, Alex Bligh wrote:
> Is it possible to use iptables to force the next hop in (e.g.) the
> FORWARD table?
> 
> I know it is possible to do this with 'ip rule' and friends, but for
> various reasons (non-proliferation of tables) I'd like to do this in
> just iptables if possible. Let's assume I know what I'm doing, and the
> effect that I want is that if the iptables rule matches, I want to set
> the next hop (irrespective of the routing table) to an IP address
> which I can guarantee is on a directly connected interface.
> 

You can do hybrid of sorts - that is set mark in iptables (with all the
matching power of iptables), then use fwmark match in ip rule.

Not precisely what you're after, but gives you the same - unless of
course you want to avoid ip rule at all cost. Once in the past there was
ROUTE target, but it was dropped at some point (I think). Besides, ip
rule fwmark provides essentially the same.
