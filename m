From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Iptables rules.
Date: Sat, 22 Sep 2007 12:44:34 -0700
Message-ID: <46F570A2.5000307@mailinator.com>
References: <46F56591.7010905@snurf.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46F56591.7010905@snurf.info>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shams Fantar <sfantar@snurf.info>
Cc: netfilter@vger.kernel.org

Shams Fantar wrote:
> Hello,
> 
> I am writing iptables rules. Here is the rules, they are in a script : 
> http://jumble.snurf.info/iptables-start
> 
> When I use it, It blocks all access to the network. Why ?
> 
> Do you have suggestions for my rules ?

There has to be a way for replies to outbound traffic to get back in. 
Maybe this (probably near the top):

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

The rules -A OUTPUT aren't needed because OUTPUT's policy is already ACCEPT.

hth,
:m)
