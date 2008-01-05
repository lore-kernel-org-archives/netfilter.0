From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack
Date: Sat, 05 Jan 2008 16:14:51 +0100
Message-ID: <477F9EEB.8080001@netfilter.org>
References: <1C795E2FCD154E46979DDDD5374B5ABE01C7CB18@TTMAIL2.teltone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1C795E2FCD154E46979DDDD5374B5ABE01C7CB18@TTMAIL2.teltone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hal Moroff <hmoroff@teltone.com>
Cc: netfilter@vger.kernel.org

Hal Moroff wrote:
> I have a firewall application that creates/deletes iptable (netfilter) rules dynamically in response to client requests.
> 
> In other words, a client negotiates with my application and I agree to open a route from that client to a device behind the firewall.  At a certain time later my application closes that route by removing the rule.
> 
> The problem is that TCP connections persist, so even though I remove the rule, the client (if already connected to the target device) can continue to use that connection.
> 
> I use 'cutter' to terminate the connection, and that works most of the time, however the connection remains listed in /proc/net/ip_conntrack, and that confuses my 'cutter' invocation if the same client opens the same route too soon.
> 
> I've set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_{close,close_wait} to 0, and that doesn't seem to help.
> 
> I'm thinking that calling nfct_delete_conntrack() directly is my solution, however I'm not certain, and I'm also having trouble understanding how to fill in the arguments (and where to get the id required by the last argument).

You can use `conntrack' to delete entries. Have a look at the
conntrack-tools [1]. Also, you can have a look at the example files
inside libnetfilter_conntrack under utils. There's one that shows how to
do what you want. Please, make sure you use lastest version.

[1] http://people.netfilter.org/pablo/conntrack-tools/

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
