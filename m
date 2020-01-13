From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables static routing fails
Date: Mon, 13 Jan 2020 23:33:48 +0100
Message-ID: <20200113223348.GK795@breakpoint.cc>
References: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
 <20200113214002.GJ795@breakpoint.cc>
 <601b51d0-e31a-0de7-8827-a8e92bcdabcd@hajes.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <601b51d0-e31a-0de7-8827-a8e92bcdabcd@hajes.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david NEW <david@hajes.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

david NEW <david@hajes.org> wrote:
> I did run "tcpdump port 80" where I saw incoming packet. Then repeated
> process but watching port 8080 this time but no packets have been captured.
> I assumed it never went through.
> 
> I have never worked with tcpdump before so there may be some mistakes on my
> side.
> 
> I do not know what is "reverse xlate rule" - can you show me how would you
> write this rule, please?

It won't work for your use case.

> I do not care how it is written as long as netfilter rule checks source
> address (from set) that asks for connection to port 80, 443...and redirects
> it to IP:8080 where web server error page awaits.

Use nat + redirect.

Stateless nat only works for simple use cases, like this for instance:
table inet crap {
        chain prerouting {
                type filter hook prerouting priority -500; policy accept;
                ip saddr 192.168.7.10 tcp dport { 80, 443 } ip daddr set 192.168.0.7 tcp dport set 8080 notrack
        }

        chain output {
                type route hook output priority -500; policy accept;
                tcp sport 8080 tcp sport set 80 ip saddr set 192.168.7.1
        }
}

This works, client connects to 192.168.7.1 80, but really talks to 192.168.0.7:8080.
The output rule is needed to reverse translate 192.168.0.7 to 192.168.7.1 and 8080 to 80.
Without it, you get

 192.168.7.10.39472 > 192.168.7.1.80: Flags [S], seq 16468682, win 64..
 192.168.0.7.8080 > 192.168.7.10.39472: Flags [S.], seq 47272, ack 16468683, win 65 ..
 192.168.7.10.39472 > 192.168.0.7.8080: Flags [R], seq 16468683

In your case, you don't have the original address anymore so you can't create the reverse rule.

table ip nat {
        chain prerouting {
                type nat hook prerouting priority dstnat; policy accept;
                ip saddr @bad tcp dport { 80, 443 } redirect to :8080
        }
}

will work because conntrack/nat handles the reverse translation.
