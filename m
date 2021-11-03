From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: learning to understand iptables
Date: Wed, 3 Nov 2021 20:17:28 +0100
Message-ID: <a09fb575-f53b-817d-5e73-620da5c04f6d@thelounge.net>
References: <b4aec750-bbeb-eb72-33f6-01d1e64c6949@sunrise.ch>
 <85e869fc-bded-c41-db86-91dfbcf5de@jubileegroup.co.uk>
 <cf3ef7ac-41b2-7c89-9de5-6ad2dfc5f6fd@sunrise.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <cf3ef7ac-41b2-7c89-9de5-6ad2dfc5f6fd@sunrise.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org



Am 03.11.21 um 19:25 schrieb serando:
> Hello Ged and all other
> Thank you very much.
> 
> Here is my first question:
> The iptables configuration is as follows:
> 
> $ sudo iptables -L
> Output:
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>  
> I have read that with this configuration, my browser only accepts data 
> from the Internet, if it has requested the data. This means that all 
> packets that the browser has not requested are dropped.
> 
> Question 1:
> Which programme now ensures that data acceptance of unrequested packets 
> is dropped with the above iptables configuration? Is it Netfilter? In 
> this case, does Netfilter filter out these unrequested packets?

this configuration does exactly *nothing* at all becasue all chains are 
*empty* with a default ACCEPT policy

a mailing-list is really the wrong place when you start with that low 
understanding

your browser doesn't do anything to begin with, it's the network stack 
and for what you try to achieve google for "stateful packet filtering" 
and "conntrack"
