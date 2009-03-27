From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: relaying tcp traffic?
Date: Fri, 27 Mar 2009 23:52:09 +0100
Message-ID: <49CD5899.3020109@chello.at>
References: <12e4ae820903271228v7375a673m3444aa4050bf834c@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <12e4ae820903271228v7375a673m3444aa4050bf834c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

John Conner wrote:
> Hello everyone,
>
> I am trying to setup a relaying box which will be used to relay
> tacacs+ accounting traffic(TCP) to a central server,  I have been
> using iptable for a while, but only on the firewall side, so before I
> spend a lot time researching this, can any of you tell me if it is
> possible for iptable to perform such functionality? and which keyword
> should i be looking for? thanks a lot!
>
> Pro
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
NAT in the general case...

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#NATINTRO

greets

Mart
