From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking Ads.
Date: Wed, 23 Jun 2010 12:36:53 -0500
Message-ID: <4C224635.40003@riverviewtech.net>
References: <215194.52736.qm@web112405.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <215194.52736.qm@web112405.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/23/10 04:37, Ninad A wrote:
> Thanks, for so prompt answers to all.

You are welcome.

> INFO : Mine is a simple UBUNTU system with kernel 2.6.34 behind ppp0 
> not a security device which has LAN and WAN ports so that FORWARD 
> chain can be used.

You should be able to do much the same thing using the INPUT and / or 
OUTPUT chains.

> 1) Using REJECT target will definitely send an ICMP error message to 
> the opposite party but still that doesnt help connection at my 
> machine which times out and thats why application delay is caused. 
> What might be the problem ?

Not all applications honor the ICMP error message that comes back to 
then.  (Microsoft programs are notoriously bad about not honoring ICMP 
errors.)

This is why I was suggesting something like a 404 error.

This is the fault of the client software that is using your connection, 
not your firewall or its design.

> 2) That makes me to think on different line, whether to use iptables 
> for content filtering or let Application proxy handle the case.

Given equal capabilities, this is somewhat a personal preference issue.

Layer 3 firewalls are great at filtering packets based on layer 3 
information.

Application layer gateways (firewall) are great at filtering on 
application layer information.

An application layer gateway (firewall) can filter different domains on 
the same IP *much* easier than a layer 3 firewall.  (Layer 3 firewalls 
can be made to do this, but it is extremely difficult.)

Application layer gateways (firewall) is really only good for the given 
application.

Layer 3 firewalls are good at about any thing that can be done at layer 
3, application independent.

So you really want to choose what is going to fit your needs the best.

> This might be a newbie question.

If you have a genuine question it doesn't matter how ""new you are.  You 
want / need help, so we will help.

> 3) How do I write a iptable rule for the DNS, i.e At the LOCAL INPUT 
> HOOK in the filter table when the packet is received there is no 
> trace of DNS. i.e Whatever we have is un-interpreted data, not in 
> user format.

I would expect that the traffic would be seen as UDP port 53 in the 
INPUT chain, probably coming in the ppp0 interface.

You could probably also match the outgoing request as UDP port 53 in the 
OUTPUT chain, most likely going out the ppp0 interface.

> 4) Finally, how to handle the missing content gracefully.
>   i) Using Application Proxies

An application (layer) proxy (gateway / firewall) can more gracefully 
handle / filter traffic in such as it can return an error that the 
client will better understand.  I.e. it can return an HTTP 404 (not 
found) error rather than a dropped (with or with out reject) packet.

>  ii) Apply iptables typical source ip address rules with REJECT.

IPTables can reject the packet with an ICMP error message.  However 
doing so has a couple of draw backs:

    1)  The client application has to honor such ICMP error messages 
(many do not).
    2) the filtering happens later after the TCP 3-way handshake meaning 
that:
       a) the connection is established and will have to be dropped or 
reset.
       b) that you have to filter through more packets to find the 
criteria that you are filtering based on.

> iii) Writing a custom iptable module according to individual 
> requirements.

You could re-invent the wheel, but it would be a lot more effort than is 
probably needed.

I'd suggest that you look at transparent proxies.  You can use IPTables 
to redirect (standard) HTTP traffic in to a transparent proxy and let 
the application layer proxy (gateway / firewall) do what it's designed 
to do.

Honestly, I think this is probably your best approach, combine the best 
of both worlds to achieve what you are wanting to do with out going to a 
lot of effort.

>  iv) Putting a place holder.

Are you wanting to put in a place holder image or something else saying 
"denied" (or what ever wording you want)?

If you are wanting to do this, I think you will have to go with an 
application layer gateway (firewall).

To the best of my knowledge, IPTables (and it's brethren ARPTables, 
EBTables, xTables) don't have the ability to replace packets and later 
connections to the extend that is required to provide a place holder.

> Thanks,

*nod*



Grant. . . .
