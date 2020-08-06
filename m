From: Florian Westphal <fw@strlen.de>
Subject: Re: Correct syntax for dnat in inet table?
Date: Thu, 6 Aug 2020 20:17:19 +0200
Message-ID: <20200806181719.GD26394@breakpoint.cc>
References: <6D405016-FCB8-44C5-86CF-EE18A9F75839@plutonium24.de>
 <F31DCA98-C7C6-4C25-9B97-035E10C96ED0@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <F31DCA98-C7C6-4C25-9B97-035E10C96ED0@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank-Ulrich Sommer <orofuhin@gmail.com>
Cc: netfilter@vger.kernel.org

Frank-Ulrich Sommer <orofuhin@gmail.com> wrote:
> I'm using "nftables v0.9.0 (Fearless Fosdick)" on a Debian Buster based Raspberry Pi OS.
> 
> I'm getting syntax errors when trying to redirect a port to another host via nftables.conf with the two lines starting with "iif eth0.100". The file does not contain a complete setup because I removed all rules not related to the problem.
> 
> The first line produces "nftables.conf:10:41-42: Error: syntax error, unexpected to, expecting newline or semicolon". According to the manpage I would have expected the correct syntax for an inet table to be "...dnat ip to..."
> 
> The second line without "to" produces "nftables.conf:11:56-56: Error: syntax error, unexpected newline".
> 
> What would be the correct syntax if I want e.g. to forward traffic to port 1234 to IPv4 123.123.123.123 in an inet table?
> 
> Here is the reduced nftables.conf causing these errors:
> 
> #!/usr/sbin/nft -f
> 
> flush ruleset
> 
> table inet myfilter {
> 
>   chain port_forwarding {
>     type nat hook prerouting priority 0; policy accept;
> 
>     iif eth0.100 tcp dport 1234 dnat ip to 123.123.123.123
>     iif eth0.100 tcp dport 2345 dnat ip 123.123.123.123
>   }
> }
nft list ruleset
table inet myfilter {
        chain port_forwarding {
                type nat hook prerouting priority filter; policy accept;
                iif "lo" tcp dport 1234 dnat ip to 123.123.123.123
        }
}
nft --version
nftables v0.9.5 (Capital Idea)

(I had to use different interface name because iif requires the name to exist
when parsing).
