From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: query re dynamic set and limiting
Date: Wed, 22 Apr 2020 15:01:45 +1000
Message-ID: <87sggwp0zq.fsf@goll.lan>
References: <CAL-6i+VntVxOf2=c5HeY2aVGchB3MffYuvqYu4X6-PiezZm+XQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

James Bond <jb666531@gmail.com> writes:

> Could you please tell me the difference between following 2 rules:
> rule#1
> nft add rule my_filter_table my_input_chain tcp dport 22 add
> @my_ssh_meter { ip saddr limit rate 10/second } accept
>
> rule#2
> nft add rule my_filter_table my_input_chain tcp dport 22 add
> @my_ssh_meter { ip saddr } limit rate 10/second accept

I think...

The latter will always update @my_ssh_meter, then sometimes accept.
The former will sometimes update @my_ssh_meter, then (if @my_ssh_meter updated) always accept?

I haven't looked at this stuff for a few months, but here is the chain I
came up with to replace fail2ban.  I haven't rolled it out to prod yet,
so it might not actually be correct :-)

    ## An automated SSH (et al) brute-force blacklist.
    ##
    ## The nominal goal is to nerf brute-force password guessing.
    ## Since I disable password auth, the REAL goal is to reduce the
    ## amount of spam in my SSH auth log.
    ##
    ## (Running SSH on a non-standard port would also work, but
    ## I want to benefit from ISPs giving preferential QOS to 22/tcp).
    ##
    ## 1. if you brute-force port X more than Y times/minute,
    ##    you're blacklisted for Z minutes.
    ##
    ## 2. if you are blacklisted and make ANY connection,
    ##    you're blacklisted for Z minutes (i.e. countdown resets).
    ##
    ## 3. if you are blacklisted, all your new flows are dropped.
    ##    (We used to TARPIT, to tie up attacker resources.
    ##    That used xtables-addons and isn't supported in nftables 0.9.1.)
    ##
    ## Compared to sshguard or fail2ban or DenyHosts:
    ##
    ##  BONUS: installed on a gateway, protects the entire network.
    ##
    ##  BONUS: works even when syslogd is down, or /var/log is full, or
    ##         the syslog "access denied" log format changes.
    ##
    ##  BONUS: works even when sshd (or whatever) is down.
    ##         That is, if the host is off, the gateway will still trigger.
    ##
    ##  BONUS: works even when sshd (or whatever) is unused.
    ##         If you never even run FTP or RDP, trigger on them!
    ##
    ##  MALUS: cannot ignore legitimate traffic.
    ##
    ##         For SSH, you can mitigate this by forcing your users to
    ##         use ControlMaster.
    ##
    ##         For HTTPS and IMAPS, you're screwed --- those ALWAYS
    ##         make 30+ connections at once (in IMAP's case, because
    ##         IDLE extension sucks).
    ##
    ##         You can also mitigate this by having a "backdoor" open
    ##         while blacklisted, which adds you to a temporary
    ##         whitelist if you port knock in the right sequence.
    ##
    ##         The port knock sequence is a pre-shared key to your end
    ##         users, with all the problems that a PSK involves!
    ##
    ##  MALUS: easy for an attacker to spoof SYNs to block a legitimate user?
    ##         (See port knock mitigation, above)
    ##
    ##  MALUS: because we run this AFTER "ct state established accept",
    ##         connections that are "in flight" when the ban hits
    ##         are allowed to complete.
    ##
    ##         This happens in the wild where the attacker makes 100
    ##         SSH connections in 1 second.
    ##
    ##         The alternative is to run this (relatively expensive)
    ##         check on EVERY packet, instead of once per flow.
    ##
    ## You can see the current state of the list with:
    ##
    ##     nft list set inet my_filter my_IPS_IPv4_blacklist
    ##     nft list set inet my_filter my_IPS_IPv6_blacklist
    ##
    ## I recommend:
    ##
    ##   * this IPS for low-rate (SSH w/ ControlMaster) and unused (FTP, RDP) services,
    ##     on gateways, for flows originating from the internet / upstream.
    ##
    ##     For a list of ports to (maybe) IPS guard, consider the first N lines of:
    ##
    ##         sort -rnk3 /usr/share/nmap/nmap-services
    ##
    ##   * a basic firewall, and sshguard, on every host that runs a relevant service.
    ##     (This includes SSH, so basically everything.)
    ##     This also covers legitimately bursty traffic on imaps.
    ##     Does this cover submission 587/tcp (postfix)?
    ##
    ##   * EXCEPT, sshguard doesn't do apache or nginx, so fail2ban on the www hosts?
    ##
    ##   * postscreen covers smtp (25/tcp).

    ## FIXME: per https://wiki.dovecot.org/Authentication/Penalty, we
    ##        should meter/block IPv6 sources by /48 instead of by single address (as we do for IPv4).
    ##        Each corresponds to the typical allocation of a single ISP subscriber.

    chain my_IPS {
        ct state != new  return  comment "Operate per-flow, not per-packet (my_prologue guarantees this anyway)"
        iiftype != ppp   return  comment "IPS only protects against attacks from the internet"

        # Track the rate of new connections (my_IPS_IPvX_meter).
        # If someone (ip saddr) connects to a service (ip daddr . tcp dport) too often,
        # then blacklist them (my_IPS_IPvX_blacklist).
        tcp dport @my_IPS_TCP_ports  \
            add @my_IPS_IPv4_meter { ip saddr . ip daddr . tcp dport  limit rate over 1/minute  burst 3 packets }  \
            add @my_IPS_IPv4_blacklist { ip saddr }  \
            log level audit log prefix "Blacklist SRC: "
        tcp dport @my_IPS_TCP_ports  \
            add @my_IPS_IPv6_meter { ip6 saddr . ip6 daddr . tcp dport  limit rate over 1/minute  burst 3 packets }  \
            add @my_IPS_IPv6_blacklist { ip6 saddr }  \
            log level audit log prefix "Blacklist SRC: "

        # If someone is NOT whitelisted, and IS blacklisted, then drop their connection, AND reset their countdown (hence "update" not "add").
        # In other words, once blacklisted for brute-forcing SSH, you REMAIN blacklisted until you STFU for a while (on ALL ports).
        ip  saddr != @my_IPS_IPv4_whitelist  ip  saddr @my_IPS_IPv4_blacklist  update @my_IPS_IPv4_blacklist { ip  saddr }  drop
        ip6 saddr != @my_IPS_IPv6_whitelist  ip6 saddr @my_IPS_IPv6_blacklist  update @my_IPS_IPv6_blacklist { ip6 saddr }  drop
    }
    set my_IPS_IPv4_meter     { type ipv4_addr . ipv4_addr . inet_service; timeout 10m; flags dynamic; }
    set my_IPS_IPv6_meter     { type ipv6_addr . ipv6_addr . inet_service; timeout 10m; flags dynamic; }
    set my_IPS_IPv4_blacklist { type ipv4_addr; timeout 10m; }
    set my_IPS_IPv6_blacklist { type ipv6_addr; timeout 10m; }
    set my_IPS_IPv4_whitelist { type ipv4_addr; timeout 10h; }
    set my_IPS_IPv6_whitelist { type ipv6_addr; timeout 10h; }
    set my_IPS_TCP_ports      { type inet_service; elements={
            ssh,
            telnet,             # we don't use it
            ftp, ftps,          # we don't use it
            3389, 5900,         # we don't use it (VNC & RDP)
            pop3, pop3s, imap,  # we don't use it
            microsoft-ds,       # we don't use it (SMB)
            mysql, postgresql, ms-sql-s,  # we don't use it (from the internet, without a VPN)
            pptp,                         # we don't use it
            login,                        # we don't use it
        }; }

