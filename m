From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Public IP to Private IP
Date: Mon, 27 Jan 2014 12:08:12 -0800
Message-ID: <52E6BCAC.4090505@mailinator.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

01/27/2014 11:22 AM, Scott Mayo wrote:
> I am having some troubles getting my public IPs routed to my private IPs.
>
> Here is an example.
> Private IP of the main server with my IPTables:  192.168.0.1
> Public IP of the main server:  1.1.1.1
> I also have 1.1.1.2 and 1.1.1.3 as public IPs attached to the public nic.
> Domain name example.org is pointed to 1.1.1.2
>
> I am trying to get the following public IPs to Private IPs:
> 1.1.1.2 -> 192.168.0.2
> 1.1.1.3 -> 192.168.0.3
>
> If I am outside my network and go to example.org, it seems to work fine.
> If I am inside my network and go to 192.168.0.2 then it works fine.
> If I go to example.org from inside my network then it goes back to
> 192.168.0.1 instead of 192.168.0.2
>
> Maybe this does not have to do with IPTables even since it works with
> an IP, but I thought I would ask here.  I do not have an internal DNS
> server.
>
> Here are the rules that I have:
>
> IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
> --to-destination 192.168.0.2
> IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -j SNAT --to-destination 1.1.1.2
>

Since you're not running internal DNS try this:

/etc/hosts
   order hosts,bind
   192.168.0.2 example.org

