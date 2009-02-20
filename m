From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Fri, 20 Feb 2009 10:01:37 +0100
Message-ID: <499E7171.2030400@chello.at>
References: <499D9292.902@colsmemory.co.uk>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <499D9292.902@colsmemory.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
> Not sure if this is possible. I wish to create a rule that once 
> created will
> automatically expire (and be removed) after say 10 minutes.
>
> Please
>
> Many thanks,
> Colin.
>
Hello,

you did not tell much about your circumstances, but maybe worth taking a 
look at fail2ban:
http://www.fail2ban.org

As it's main goal seems to temporarily lock out certain hosts.

Greets

Mart
