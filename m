From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Sub: NAT issue in netfilter
Date: Thu, 26 Jun 2014 11:44:39 -0400
Message-ID: <201406261144.39697.neal.p.murphy@alum.wpi.edu>
References: <CAJQ3KZXNSCgV0mRx6jDwWk85sJRFY5pKKFJbLuzaEmW1kzFAfg@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJQ3KZXNSCgV0mRx6jDwWk85sJRFY5pKKFJbLuzaEmW1kzFAfg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, June 26, 2014 05:44:51 AM Kamal Kumar wrote:
> Dear Hambourg,
> 
> My response to your previous mail,
> 
> > Below is my exact scenario -> Network 1 wants to communicate with Network
> > 2 using NAT enabled router with two ethernet interfaces
> > eth0(192.168.1.1) and eth1 (192.168.2.1).
> > 
> |    Network 1    |---| NAT Router |---|     Network 2   |
> 
> (192.168.1.0/24)   ^                  ^     (192.168.2.0/24)
> 
>              eth0(192.168.1.1)   eth1(192.168.2.1)
> 
> > What I did is as mentioned below.
> >
> >Step1: I am applying the following command "iptables -t nat -A POSTROUTING
> >-s 0.0.0.0/0 -d 0.0.0.0/0 -o eth1 -j SNAT --to 192.168.2.1" in nat
> >router.
> >
> >Step2: Started initiating traffic(ICMP) from network 1 to network 2 and
> >using wireshark I observed source ip of traffic from network 1 being
> >translated to ip 192.168.2.1 in nat router.
> >
> >Step3: With traffic from network 1 to network 2 in PROGRESS I am flushing
> >the nat table using the command "iptables -t nat -F".
> >
> > Now as there is no rule the sourece ip of traffic from network 1 should
> > not be translated to ip 192.168.2.1 (which is my requirement), but it is
> > being translated.
> > 
> > What should I do to fullfill my requirement.

As I recall, rules in table nat apply to new conns, not all packets. I believe 
you have to terminate existing conns to stop them.
