From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time yet?
Date: Thu, 09 Jul 2020 14:40:33 +1000
Message-ID: <875zaxz4fy.fsf@goll.lan>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
        <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
        <a140ef1f-b238-3c8b-d8ec-3e266a893aea@thelounge.net>
        <874kqih2ca.fsf@goll.lan>
        <44067eef-0cfe-ac29-f3e6-463c20d8e38d@thelounge.net>
        <20200708103656.GA22743@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Pablo Neira Ayuso <pablo@netfilter.org> writes:

>> "iptables-translate" comments out much more than just upset related
>> stuff, in my case xt_recent and connlimit rules are also just comments
>
> If you could post what kind of rule examples are commented out, it
> would help us keep this in the radar.
>
> It is not too hard to add new translations, there is a _xlate()
> function under iptables/extensions/libxt_*.c that provides the
> translation. The important thing is to validate that the translation
> is semantically equivalent, or if not possible, provide a close
> translation.

Here's the one that bit me when I started with nft:

    ## An automated SSH brute-force blacklist.  Requires xtables.  Unlike
    ## fail2ban or DenyHosts, there are NO userspace requirements -- not
    ## even sshd is needed!  echo +1.2.3.4 >/proc/net/xt_recent/whitelist
    ## to whitelist 1.2.3.4 for an hour.  Protects both this host AND all
    ## hosts "behind" this one.
    ##
    # New connections from IPs blacklisted within the last ten minutes are
    # chaotically rejected, AND reset the countdown back to ten minutes.
    # This is in PRELUDE such that blacklisted attackers are refused ALL
    # services, not just rate-limited ones.
    -A PRELUDE -m recent --name blacklist --update --seconds 600 --rttl -j BLACKLIST
    # This NON-TERMINAL chain counts connections passing through it.  When
    # a connection rate exceeds 3/min/srcip/dstip/dstport, the source IP
    # is blacklisted.  Acting on the blacklist is done elsewhere, as is
    # accepting or rejecting this connection.
    -A PRELUDE -i ppp+ -p tcp --dport ssh -m hashlimit --hashlimit-name maybe-blacklist --hashlimit-mode srcip,dstip,dstport --hashlimit-above 1/min --hashlimit-burst 3 -m recent --name blacklist --set -j LOG --log-prefix "Blacklisted SRC: "
    -A BLACKLIST -m recent --name whitelist --rcheck --seconds 3600 -j RETURN -m comment --comment "whitelist overrides blacklist"
    -A BLACKLIST -j CHAOS --tarpit

Here's the hand-written translation (not exactly the same):

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
    ##     UPDATE: sshguard supports apache/nginx if you tell it to read
    ##     the relevant NCSA-format logfile.
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
    # CONSIDERED AND REJECTED FOR my_IPS_TCP_ports
    # ============================================
    #
    #  * http, https:
    #
    #    HTTP/0.9 and HTTP/1.1 is one TCP connect per request.
    #
    #    HTTP/1.1 has workarounds that still suck due to head-of-line blocking.
    #    https://en.wikipedia.org/wiki/HTTP_persistent_connection
    #    https://en.wikipedia.org/wiki/HTTP_pipelining
    #
    #    HTTP/2 solves this fully, but is /de facto/ never used on port 80.
    #
    #    The end result is that as at August 2019,
    #    GUI browsers still routinely burst many HTTP connections to a single DST:DPT.
    #    This IPS only measures burstiness, so it can't work for HTTP/S.
    #
    #  * imaps:
    #
    #    If the server (and client) speak IMAP IDLE but not IMAP NOTIFY,
    #    the client will make ONE CONNECTION PER MAILBOX FOLDER.
    #    This looks very bursty, so the IPS can't do it's thing.
    #
    #    See also:
    #    https://tools.ietf.org/html/rfc5465
    #    https://wiki2.dovecot.org/Plugins/PushNotification  (??? -- different RFC)
    #    https://bugzilla.mozilla.org/show_bug.cgi?id=479133  (tbird)
    #    https://blog.jcea.es/posts/20141011-thunderbird_notify.html
    #    https://en.wikipedia.org/wiki/JMAP  (just ditch IMAP entirely)
    #
    # * smtp, submission:
    #
    #   For smtp (25/tcp), can't do shit because we have to talk to
    #   whatever the fuck crackhead MTAs are out there.
    #
    #   For submission, we could limit connection rate IFF we knew
    #   ALL STAFF were running an MSA that batched up the messages.
    #   We know that at least msmtp does not, so this is a no-go.
    #
    #   (Consider a manager sending 4+ one-liner "yes" or "do it!"
    #   emails in a single minute.  We might be able to mitigate this
    #   by matching on submission with a more forgiving burst limit,
    #   e.g. 1/min burst 10?  Otherwise, we have to rate-limit in the
    #   postfix->dovecot SASL backend, or the dovecot->ad LDAP
    #   backend.  UGH.)
    #
    # * msrpc:
    #
    #   FIXME: wtf even.  I don't want to read enough about this to
    #   know if it's reasonable to IPS it.
    #
    # * openvpn:
    #
    #   Normally UDP, and we currently only IPS TCP.
    #   Normally cert-based (but can use PSKs).
    #   Might be worth considering if we do this later.
    #
    # * ident:
    #
    #   I think when you irssi -c irc.oftc.net,
    #   OFTC tries to ident back to you?
    #   I don't want to accidentally block OFTC/Freenode.

