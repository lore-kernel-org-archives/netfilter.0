From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 08:49:47 -0800
Message-ID: <4977522B.5030007@mailinator.com>
References: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David J Craigon <david@craigon.co.uk>
Cc: netfilter@vger.kernel.org

David J Craigon wrote:
> Hello,
> 
> I'm trying to build a firewall using Linux, iptables and conntrack. My
> set up is pretty simple- I've got a computer with three interfaces-
> one pointing to the internet, and two networks for different
> "customers".
> 
> 
> Internet--------Firewall------Customer 1
>                            |
>                            ----------Customer 5
> 
> 
> 
> Customer 1 has 10.72.2.0/24. Customer 5 has 10.72.3.0/24. Both
> customers have a server 10.72.2/3.3 running httpd on port 80.
> 
> Now, both Customer servers can get to the internet, and the internet
> can get to them, but Customer 1's server can't get to Customer 5's
> server.

Hi David,

Perhaps you need "routes" established for those subnets.

ip route add 10.72.2.0/24 dev ethX   #customer1's nic
ip route add 10.72.3.0/24 dev ethY   #customer5's nic

hth,
:m)
