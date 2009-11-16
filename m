From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Help deleting a rule
Date: Mon, 16 Nov 2009 22:45:35 +0100
Message-ID: <4B01C7FF.9050200@chello.at>
References: <edc0e50f0911161339x1ceed507vc4baffa428cad1b7@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <edc0e50f0911161339x1ceed507vc4baffa428cad1b7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Cameron Smith wrote:
> Hello,
>
> If I run:
> iptables -L -n -v |grep xx.xx.xx.xx
>
> I get:
> 112  6272 DROP       all  --  eth+   *       xx.xx.xx.xx         0.0.0.0/0
>
> I want to delete this specific rule.
> >From what is printed above how do I know what line this is to use this command?
>
> iptables -D INPUT x
>
> Where x is the line number?
>   

iptables -h

look for --line-numbers


