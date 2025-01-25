Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7FA6A33B
	for <netfilter@vger.kernel.org>; Sat, 25 Jan 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737822235; cv=none; b=bRdUkLv1+I59NGNgAeK7rqpv8vdbhC7x4mr+0VZLboHDk50FZVVgTpG8+ZfS98+9x9EbeyyutN/nyeRhl1ZHj2ZAxR6Am5C5LNzuL9kyfzQiqmcAVBaSjNVKKxuLdIa53+do5VNhFnRyvKudCMgmcoxA//n2mBQRjz7w8qSTsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737822235; c=relaxed/simple;
	bh=PtY2uT+gnNDmIykZfu1DghNWVhdTTSI2EVoXAn2VcFQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKdrtbNwihowox1QkIYRcXAeJmCEWQ2ZCKBYc1PrQt1y58YzGVZyBWC8wA2i0ka5kRNDWjtDYJlTrtLN/TjzOHREAXs2jMUU0WoABeZxxMZTye70HV/39ZDubrqKiVQMp98NQhCZzvU1WCZDix2hlXTtTcFh+ibrJxbMotWukhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=FEnUZi01; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="FEnUZi01"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id 6AE7512418A2; Sat, 25 Jan 2025 16:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1737820549; bh=PtY2uT+gnNDmIykZfu1DghNWVhdTTSI2EVoXAn2VcFQ=;
	h=Date:From:To:Subject:From;
	b=FEnUZi01ucnqwvQsykP7c9EvJmrJF0jHCONe+VCIYAClrl31K7JaiyHSOHIEIwR4Q
	 uZn53uZrQj0JeNRYJ6YCOIT/xMnCxz1he4aZOoBEeWFfTHjabYD9UtAtQPywBgiRHC
	 lqkeXwmjV7r6JxZ94GGILIqt7GZft0tw/EjWQXKaL5CDAB93pYPsd4eCt/imvczwaz
	 RR1ZB5ZoGIc3hkBglSx8VHxXdIDMsFIM7RD0TNSp+4hCt/9qrkI7i97UOYQzRIKAvL
	 6Q65vyNZIrnCg46DE53erjdV2fJVfaSO7Sscyg0xdt8IhBwuOEMM3g47z3rSIqHZMM
	 ir8suNPZCAiOQ==
Date: Sat, 25 Jan 2025 16:55:49 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: netfilter@vger.kernel.org
Subject: nftables DNAT routes to wrong iface
Message-ID: <Z5UJheaMk+bZsEFe@alphanet.ch>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I am trying to do this:

Both local IP addresses, when access from outside:

   enp2s0.310: 193.72.186.130:8080
   br0: 46.140.72.218:8080

are DNATed to

   enp2s0.202: 192.168.202.10:80 (a remote machine)

I know there are two steps:

   - the incoming DNAT in prerouting (and the forward accept)
     -> this part I am stuck, see below

   - then when the reply comes back, route to the proper interface where
     it came from (using conntrack + marks + specific routing tables)
     -> this part I have not done yet -- it would be required for
        193.72.186.130:8080 obviously because the default route
        does not go there.

What I observe:

   telnet 46.140.72.218 8080 from outside works (*), it connects to 192.168.202.10:80
   and there is nothing bizarre in tcpdump either on br0 nor on
   enp2s0.202 (no delays, lost packets, e.g.) (**)

   telnet 193.72.186.130 8080 gives this on enp2s0.300

      IP 193.72.186.190.52636 > 193.72.186.130.8080 (normal)
      IP 193.72.186.190.52636 > 192.168.202.10.80   (good, it was DNATted, BUT should be on enp2s0.202!)

   aka the DNAT is executed, but then 192.168.202.10 is not routed
   correctly.  From the diagram https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks
   I thought that routing would be done AFTER prerouting/DNAT.

The routing table has:

default via 46.140.72.217 dev br0 onlink 
46.140.72.216/29 dev br0 proto kernel scope link src 46.140.72.218 
192.168.202.0/24 dev enp2s0.202 proto kernel scope link src 192.168.202.2 
193.72.186.128/26 dev enp2s0.300 proto kernel scope link src 193.72.186.130 

(*) not from 193.72.186.0/24, however, gets the same bug.

The nftables config:

table ip filter {
        # obviously a later goal is also to encode the L4 protocol here
        # and not hardcode it in the prerouting
        map multihoming_ext {
                type ipv4_addr . inet_service : ipv4_addr . inet_service
                elements = { 193.72.186.130 . 8080 : 192.168.202.10 . 80,
                             46.140.72.218 . 8080 : 192.168.202.10 . 80 }
        }

        set w_all {
                type ipv4_addr
                flags interval
                elements = { 46.140.72.216/29,
                             192.168.202.1, 193.72.186.0/24
                           }
        }

        chain input {
                type filter hook input priority filter; policy drop;
                ct state invalid counter packets 3 bytes 120 drop
                ct state { established, related } counter packets 1092 bytes 76846 accept
                iif "lo" counter packets 0 bytes 0 accept
                counter packets 324 bytes 13539 jump whitelist
                counter packets 323 bytes 13455 jump blacknets
                counter packets 323 bytes 13455 jump blacklist
                counter packets 323 bytes 13455 jump incoming
        }

        chain forward {
                type filter hook forward priority filter; policy drop;
                ct state invalid counter packets 0 bytes 0 drop
                ct state { established, related } counter packets 12 bytes 548 accept

                # already after DNAT, obviously
                iifname "br0" ip daddr 192.168.202.10 tcp dport 80 accept
                iifname "enp2s0.300" ip daddr 192.168.202.10 tcp dport 80 accept
        }

        chain output {
                type filter hook output priority filter; policy accept;
                ct state invalid counter packets 0 bytes 0 drop
                ct state { established, related } counter packets 890 bytes 182096 accept
                oif "lo" counter packets 0 bytes 0 accept
                counter packets 1 bytes 76 jump outgoing
        }

        chain rejectcounter {
                meta l4proto tcp counter packets 0 bytes 0 reject with tcp reset
                meta l4proto udp counter packets 0 bytes 0 reject
                counter packets 0 bytes 0 drop
        }

        chain dropcounter {
                counter packets 320 bytes 13349 drop
        }

        chain whitelist {
                ip saddr @w_all counter packets 1 bytes 84 accept
        }

        chain blacknets {
        }

        chain blacklist {
        }

        chain incoming {
                icmp type echo-request counter packets 3 bytes 106 accept
                icmp type echo-reply counter packets 0 bytes 0 accept
                tcp dport 22 ip saddr { 46.140.72.216/29, 192.168.202.1, 193.72.186.0/24 } counter packets 0 bytes 0 jump dropcounter
                udp dport 22 ip saddr { 46.140.72.216/29, 192.168.202.1, 193.72.186.0/24 } counter packets 0 bytes 0 jump dropcounter
                counter packets 320 bytes 13349 jump dropcounter
        }

        chain outgoing {
        }

        chain multihoming_prerouting {
                type nat hook prerouting priority dstnat; policy accept;

                # this is the DNAT
                dnat ip to ip daddr . tcp dport map @multihoming_ext
        }
}
table ip myhelpers {
        chain prerouting {
                type filter hook prerouting priority filter; policy accept;
        }
}

[ I removed ip6 entries ]

Any idea what could be wrong?

Thank you.

(**) very nice:
br0:
IP 46.140.72.222.60394 > 46.140.72.218.8080
IP 46.140.72.218.8080 > 46.140.72.222.60394
IP 46.140.72.222.60394 > 46.140.72.218.8080

enp2s0.202 (another connection):
IP 46.140.72.222.57790 > 192.168.202.10.80
IP 192.168.202.10.80 > 46.140.72.222.57790
IP 46.140.72.222.57790 > 192.168.202.10.80

