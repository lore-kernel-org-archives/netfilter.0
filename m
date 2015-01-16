From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 04:31:45 +0100
Message-ID: <m9a0n1$rp1$1@ger.gmane.org>
References: <CAJb3rWA+2mHMZh3BUVkvmv_ok0pnvx5kavFx3esOBupnFh600g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWA+2mHMZh3BUVkvmv_ok0pnvx5kavFx3esOBupnFh600g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The Media Server wrote, On 01/16/2015 04:12 AM:
> both port are forwarded to my linux pc 80 and 22 in my router ;)
>
> Public ip address is block because of my vpn enabled...
>
> like i said if I deviate my connections to my table 2 like so with vpn enabled:
> ip rule add from 192.168.2.0/24 table 2
> all my inbound connection works with my public ip address and that is the goal.
> I just want the thing to work on a port basis.

Ok, now I understand your problem :-)
In this case try this instead of the above (I think this you even had in your 
prev postings):
  ip rule add fwmark 2 table 2

And add this for marking the pkts based on port(s):
iptables -t mangle -A PREROUTING -p tcp -m multiport --ports 80,22 -j MARK 
--set-mark 2

Both commands should be placed as early as possible within your script.


> Anyways i'll experiment.. i will try to remove all table, stop vpn.
> make an empty or wrong table main..
> and try to mark my packets and forward them to table 2
>
> I will give you the results.. if that doesn't work we will know there
> is problem with the marking system, if it works, the problem is
> somewhere in my vpn setup..
>
> thks again!


