From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Re: debug iptables rules
Date: Mon, 22 Aug 2011 17:30:25 +0200
Message-ID: <1314027026.2486.7.camel@kushiel.sterenborg.info>
References: <CA+b04XnYFUcukqbmQXiKbY4VjUaFs3red56Jfnzm4pj+z6ndRw@mail.gmail.com>
	 <CA+b04XnQ-cKfU9KUu9j_Tf0vp0jtadnNu69_Gob1mPAXVkytMw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+b04XnQ-cKfU9KUu9j_Tf0vp0jtadnNu69_Gob1mPAXVkytMw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 2011-08-22 at 20:40 +0530, TEJAS wrote:
> Hi All,
> 
> I am new with iptables.I write certain iptables rule for my internal
> network , i write rules for SNAT for internet sharing and some others
> for configuring some restrictions.It is working fine.But i want to
> debug these rules in live motion.I want to see what happening with
> packets while they traverse from iptables rules.
> 
>  Is there any method or any tool or anything to see what happening in
> snat rule and what happening in others iptables rules.

You can use the LOG target to log messages to syslog
(probably /var/log/messages).

Basic example, really, when accepting SSH packets (beware of wrapping):

$ipt -A INPUT -p tcp --dport 22 -j LOG --log-level info --log-prefix
"INPUT: SSH: "
$ipt -A INPUT -p tcp --dport 22 -j ACCEPT

[...more rules...and then at the end of your ruleset...]

$ipt -A INPUT -j LOG --log-level info --log-prefix "INPUT: DROPPED: "
$ipt -A INPUT -j DROP   (or use the chain policy to do this)


--
Rob


