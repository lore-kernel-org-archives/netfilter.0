From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Rules PREROUTING doesn't work
Date: Wed, 17 Mar 2010 19:20:29 -0500
Message-ID: <hnrrke$d0$1@dough.gmane.org>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>	 <hnqkk4$62v$1@dough.gmane.org>	 <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>	 <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com> <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/17/2010 03:25 PM, Richard Horton wrote:
> On 17 March 2010 15:20, Angel Motta<angelmotta@gmail.com>  wrote:
>
>> When I apply this rule i did iptable-save and I see that NAT and I
>> also see my rule with itpables -t nat -L, but the clients vpn still
>> are conected to the Firewall with that public IP.
>
> Existing connections prior to the rule being inserted will not be
> moved until they reestablish a new connection.
>
> You can turn tracing on (iptables -t raw -A PREROUTING -j trace) and
> see if the rule is being met or not.
>
> By the sound of it something isn't matching so you might want to try
> inserting a rule to log traffic - just use the same match criteria but
> use the log target rather than DNAT - if you see no log entries then
> the rule for some reason isn't quite right...

And, I just noticed that the protocol is UDP.  The only way a UDP
entry gets removed from conntrack is by timing out, and that can take
up to 3 minutes (see the values in
/proc/sys/net/netfilter/nf_conntrack_udp_timeout*).

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

