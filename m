From: Ed W <lists@wildgooses.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 02 Jan 2012 12:38:18 +0000
Message-ID: <4F01A53A.6040704@wildgooses.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anton Melser <anton@linux.com>
Cc: netfilter@vger.kernel.org

On 01/01/2012 16:10, Anton Melser wrote:
> Hi,
> I am very new to iptables but have been trying hard to learn as much
> as I can... I have a reasonably simple need but performance might
> quickly become an issue so would like some advice on the best way to
> go forward.
> So, I have around 1600 public IPs in 4 blocks (3 x /23 + /25 on
> different ISPs). I have a certain number of machines (somewhere from 3
> to 8, needs to be variable and changeable without FW reconfiguration),
> and each one needs to be able to send email from each external IP (and
> needs to be able to do this deterministically). The only traffic
> should be to port 25 on the external destination IPs - the machines
> are only sending email, never receiving, so AFAICT everything can be
> closed inbound (at least for NEW).
>

Although NAT would seem to be the most flexible solution (seems like you 
just need to read up on SNAT? Probably also some network stack tuning 
needed for such a large amount of NAT..?), you can probably also do this 
by adding the public IPs to your mailserver?  Eg with Postfix you can 
either lightly overload settings per transport in master.cf ( 
http://www.postfix.org/master.5.html ), or if you need something which 
more closely emulates a virtual machine then see the multi-instance 
stuff ( http://www.postfix.org/MULTI_INSTANCE_README.html ). I see no 
theoretical reason you couldn't have a (very) multihomed machine with 
the IPs on the servers themselves? The benefit might be that mailservers 
under high load will normally have a lot of connections open (hence high 
NAT requirements)

Postfix also has some interesting options to add connection caching and 
some other tricks which are helpful for larger installations and large 
outbound queue volumes.

You should probably spend some time on followup questions covering why 
you aren't a spam sender. Many technical folks will jump to the 
conclusion that anyone asking for help pumping large volumes of mail is 
likely to be up to no good.  Just saying how it is...

Good luck

Ed W
