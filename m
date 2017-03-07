From: Robert White <rwhite@pobox.com>
Subject: Re: per source bandwidth limit with hashlimit
Date: Tue, 7 Mar 2017 19:43:45 +0000
Message-ID: <d41a3194-9acc-7bff-afda-2c3df053c2b3@pobox.com>
References: <15d4f6da-0004-e2d3-5380-11fb2131ba48@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <15d4f6da-0004-e2d3-5380-11fb2131ba48@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fatih USTA <fatihusta86@gmail.com>, netfilter@vger.kernel.org

On 03/07/17 12:47, Fatih USTA wrote:
> Hi
>
> I tried to use hashlimit to limit the bandwidth, for each ip address on
> the 192.168.59.0/24 network. But did not work specified network address
> or protocol.
> iptables -t mangle -I PREROUTING -m tcp -p tcp -m hashlimit
> --hashlimit-above 50kb/sec --hashlimit-burst 50kb --hashlimit-mode srcip
> --hashlimit-name persource -j DROP
> iptables -t mangle -A PREROUTING -j RETURN

You are using hashlimit backwards. The jump target is executed when the 
limit is still good, it fails once the limit has been exceeded. So your 
rule is dropping the packets/connections until the 50kb a second 
threshold is exceeded then it's letting them through.

What you want is

iptables (blah blah) hashlimit (blah blah) -j RETURN
iptables (blah blah) -j DROP

Now when you are within the limits the data gets through, and when you 
exceed the limits the rule evaluation falls through to the drop.

Note that I usually put this in a separate chain that I invoke from the 
real chain so that I can still apply other logic before/after the throttle.

so...

iptables -N throttle
iptables -A throttle -m hashlimit (blah blah) -j RETURN
ipbables -A throttle -j DROP
iptables -A (wherever) (conditional blah) -j throttle

As far as (wherever), I don't like to interfere with existing 
connections since that leads to more load, not less. So I'd put the 
throttle in FORWARDING or INPUT with the (conditional blah) being for 
ctstate NEW and after the established,related rule.

This secondary chain means that you can use the same throttle for 
several different protocols or conditions without it getting really 
complex to invoke.

Of course your where-and-when will vary depending on your task and 
goals. But in truth, if you are the service then your service 
application is going to be the source of most of the data so you 
probably ought to throttle in the server not the firewall rules instead 
of dropping your own data or throwing away packets that you've already 
paid bandwidth/time to receive and which the sending end is probably 
just going to send again because of the "loss".

That is bulk limits on existing connections tends to drive received 
volume _up_ as re-transmits occur.

So be careful not to shoot yourself in the foot.

So anyway... the --match hashlimit should be followed by the success 
--jump and the later rules are then the failure path.



Hope this helps,
--Rob.

