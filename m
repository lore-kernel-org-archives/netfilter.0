From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft numeric output translates tcp flags rule so it cannot be
 loaded again
Date: Fri, 22 Oct 2021 17:20:24 +0200
Message-ID: <YXLWuHabUtY9wKXq@salvia>
References: <b02e9c0a-281d-02d1-d876-b0b997b6d8c2@freenet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b02e9c0a-281d-02d1-d876-b0b997b6d8c2@freenet.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benno <b.ohnsorg@freenet.de>
Cc: netfilter@vger.kernel.org

On Fri, Oct 22, 2021 at 03:51:04PM +0200, Benno wrote:
> Hi,
> 
> the following ruleset was written manually:
> 
> #!/sbin/nft -f
> flush ruleset
> table inet firewall {
> 
>   chain inbound {
>     type filter hook input priority 0; policy drop;
>     ct state vmap { 0x1 : drop, 0x2 : accept, 0x4 : accept }
>     tcp flags & (fin|syn|rst|ack) != syn ct state new counter drop
>     iifname "lo" accept
>     meta protocol vmap { 0x0800 : jump inbound_ipv4, 0x86dd : jump
> inbound_ipv6 }
>     tcp dport { 22, 80, 443 } accept
>     udp dport 1900 meta pkttype 2 limit rate 4/second burst 20 packets
> accept comment "Accept UPnP IGD port mapping reply"
> 
>     log prefix "[nftables] Inbound Denied: " counter packets 0 bytes 0 drop
>   }
> }
> 
> The ruleset should drop anything except it is allowed. Loading this
> through nft -f <file> does exactly what it should. Adding or removing
> for example more ports for dport rule does exactly what it should:
> provide access to more or less services, e.g. 631 for CUPS or 8883 to a
> TLS-wrapped mosquitto/ MQTT broker.
> 
> The last line flawlessly controls logging. Without port 631 but
> connection attempts to CUPS print the messages accordingly. Adding port
> 631 again makes CUPS work again and no messages anymore.
> 
> The operating system stores this to a file when shutting down and uses
> option -n for numeric output. This translates all the rules and the tcp
> flags rule turns into this:
> 
> tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes 0 drop
> 
> When the rules saved like this are re-loaded TCP port rules are
> broken.

What nftables version are you using there? Using nftables 1.0.0.

Reload works fine here:

# nft -f ruleset.nft
# nft -n list ruleset > /tmp/ruleset2.nft
# nft flush ruleset
# nft -f /tmp/ruleset2.nft
# nft list ruleset
table inet firewall {
        chain inbound_ipv4 {
        }

        chain inbound_ipv6 {
        }

        chain inbound {
                type filter hook input priority filter; policy drop;
                ct state vmap { invalid : drop, established : accept, related : accept }
                tcp flags != syn / fin,syn,rst,ack ct state new counter packets 0 bytes 0 drop
                iifname "lo" accept
                meta protocol vmap { ip : jump inbound_ipv4, ip6 : jump inbound_ipv6 }
                tcp dport { 22, 80, 443 } accept
                udp dport 1900 meta pkttype multicast limit rate 4/second burst 20 packets accept comment "Accept UPnP IGD port mapping reply"
                log prefix "[nftables] Inbound Denied: " counter packets 20 bytes 6180 drop
        }
}

> For example connections to sshd on port 22 is not possible anymore.
> There are also no logs about the dropped traffic.

Works also fine here.
