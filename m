Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955C2CAB
	for <netfilter@vger.kernel.org>; Sun, 12 Jan 2025 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736712185; cv=none; b=mR8smxwqPV+b4MrO62h3KjGCJxA/eQNuMmtaWdQtetDiXZtRwBQc8ieIdMyb331Dwg9sY4jI5ZE2IfFhRENpTA3ULAcIz8+hXaicBkkjSC2TK53xQaMLooqlLI2Aoqlx+IqcFKen3guONOrZB2e34qtSkHEWBXy8WIpB85Of8J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736712185; c=relaxed/simple;
	bh=McRPG2nI9uYKeBQTJy1QlAm1hcnQEQv2T8JQCcyifKU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xz9PtIED9VLkQkdsHoynu5k2CBxxq97Hh3n2lPO7f4Ub59b+1o0Vd9YMz6zCg0/Oy6AZIbl3xgY/JWtliKuLgtjcwf+NFfWtQ2EdXcLAjKuB7cjGRW5voer7PqD+haGKETuNtgyWNJaCZKeCQau3GZ7jHAF4jgGBEvxt0+x+nfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=Wni2K2CQ; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="Wni2K2CQ"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id 141B412418A4; Sun, 12 Jan 2025 20:30:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1736710206; bh=McRPG2nI9uYKeBQTJy1QlAm1hcnQEQv2T8JQCcyifKU=;
	h=Date:From:To:Subject:From;
	b=Wni2K2CQx4YYZfaf3hEyy5mpnsl6KgN21P33qIZAHvEFrIDA0DVGAx2vb55xKWLhQ
	 +Nwc9qb0wTzxxVaVuamS2EEFDYKDjV7Kp2VGjcYcfTS60KRrwC4KLvM4ZfNoch1o2Y
	 62GqKhpgc4xDAt+B9YLIj5x9Ud8bKnD5iUprLH1VbDe9lu+2a0bW4dXqy3EEtiBndQ
	 qe9eaBlJ8UoX6eqxov0dMWfQ8ixv5VC5h8LtaDvfMYVoCao0b2QJE9vJIU/xQzuDl1
	 MDOyQIcrX0JKHzo9wjKFBaOUxnwmrQCmdRj02Z9OPocsFrrqiK216+c77sLm1CRVy8
	 BNG4c6S1o7sGw==
Date: Sun, 12 Jan 2025 20:30:06 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: netfilter@vger.kernel.org
Subject: Delay replying to SYN (or requires two SYN to react)
Message-ID: <Z4QYPtJKVr8yFgKK@alphanet.ch>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

With a somewhat complex NAT/multiple routing tables under Linux kernel
5.10.0-33-amd64 (Debian bullseye) I experience bizarre behaviour.

case 1: a request comes from the default route iface, from an IP address which
        would also be routed to the default route (this is normal,
        works)

16:27:35.530078 IP other-ip.43334 > external-ip-on-that-iface.53: Flags [S], seq 2127337110, win 64240, options [mss 1460,sackOK,TS val 2877979869 ecr 0,nop,wscale 7], length 0
16:27:35.531035 IP external-ip-on-that-iface.53 > other-ip.43334: Flags [S.], seq 3677232446, ack 2127337111, win 65232, options [mss 1220,sackOK,TS val 960370014 ecr 2877979869,nop,wscale 7], length 0
16:27:35.550075 IP other-ip.43334 > external-ip-on-that-iface.53: Flags [.], ack 1, win 502, options [nop,nop,TS val 2877979888 ecr 960370014], length 0

case 2: a request comes from the default route iface, from an IP address
        which could be replied through another interface ("triangular
        routing") but can't because of the other side does not know that
        and addresses us through the public WAN interface; the obvious
        fix would be to tell the remote end of
        this interface (a VPN) about all my public IP addresses, but
        it can't be done.
        So, I use a combination of iptables mangle marks, CONNTRACK save,
        to mark the real origin of the packet and then when
        the reply is sent, a CONNTRACK restore, and an ip rule to select 
        a routing table which does not have the route to other-ip 2 so
        it gets sent to the default iface (non triangular routing):

[1] 20:08:38.611344 IP other-ip2.50947 > external-ip-on-that-iface.53: Flags [S], seq 1740989724, win 64240, options [mss 1460,sackOK,TS val 1666684952 ecr 0,nop,wscale 7], length 0
[2] 20:08:39.633570 IP other-ip2.50947 > external-ip-on-that-iface.53: Flags [S], seq 1740989724, win 64240, options [mss 1460,sackOK,TS val 1666685975 ecr 0,nop,wscale 7], length 0
[1] 20:08:39.634355 IP external-ip-on-that-iface.53 > other-ip2.50947: Flags [S.], seq 2064528821, ack 1740989725, win 65232, options [mss 1220,sackOK,TS val 3005011650 ecr 1666684952,nop,wscale 7], length 0
[2] 20:08:41.641926 IP external-ip-on-that-iface.53 > other-ip2.50947: Flags [S.], seq 2064528821, ack 1740989725, win 65232, options [mss 1220,sackOK,TS val 3005013658 ecr 1666684952,nop,wscale 7], length 0

See the strange delays: either those are real delays, or are because
the first SYN gets stuck until a second one is received?

The real ugly truth is that external-ip-on-that-iface:53 actually get
then DNATed (*) on the same system to another interface, here it what it
looks like there in case 2:

20:08:38.609363 IP other-ip2.50947 > 192.168.101.100.53: Flags [S], seq 1740989724, win 64240, options [mss 1460,sackOK,TS val 1666684952 ecr 0,nop,wscale 7], length 0
20:08:38.609521 IP 192.168.101.100.53 > other-ip2.50947: Flags [S.], seq 2064528821, ack 1740989725, win 65232, options [mss 1220,sackOK,TS val 3005010628 ecr 1666684952,nop,wscale 7], length 0
20:08:39.623067 IP 192.168.101.100.53 > other-ip2.50947: Flags [S.], seq 2064528821, ack 1740989725, win 65232, options [mss 1220,sackOK,TS val 3005011642 ecr 1666684952,nop,wscale 7], length 0
20:08:39.631454 IP other-ip2.50947 > 192.168.101.100.53: Flags [S], seq 1740989724, win 64240, options [mss 1460,sackOK,TS val 1666685975 ecr 0,nop,wscale 7], length 0
20:08:39.631586 IP 192.168.101.100.53 > other-ip2.50947: Flags [S.], seq 2064528821, ack 1740989725, win 65232, options [mss 1220,sackOK,TS val 3005011650 ecr 1666684952,nop,wscale 7], length 0
20:08:41.639076 IP 192.168.101.100.53 > other-ip2.50947: Flags [S.], seq 2064528821, ack 1740989725, win 65232, options [mss 1220,sackOK,TS val 3005013658 ecr 1666684952,nop,wscale 7], length 0

So it looks that this is not a delay problem but the first reply packet
is always lost.  Actually, looking at the interface where
other-ip2 should be routed without our hack, we see that the first
packet is routed there!

This is an iptables setup; I am going to switch to nftables in the
future.

So my question: did you already see that kind of bizarre behaviour?
Any hint where to look? Am I right that that a saved CONNMARK should
be available for all further packets of that flow or connection?

The rules are (too) complex, but it looks like this:

      # --- PREROUTING/nat
      # mark this as special
      # (nat: only has effect for the 1st packet of a connection!)
      # (out -> in)
      $iptables -t nat -A $special_fw_nat \
                -d $2 -p $3 --dport $4 \
                -j MARK --set-mark $mark_special

      # save mark
      # (out -> in)
      $iptables -t nat -A $special_fw_nat \
                -d $2 -p $3 --dport $4 \
                -m mark --mark $mark_special \
                -j CONNMARK --save-mark

      # --- PREROUTING/mangle
      # (so executed at every packet)
      # restore mark
	      # (in -> out)
	      $iptables -t mangle -A $special_fw_mangle \
                -i $if_ds -s $1 -p $3 --sport $5 \
                -j CONNMARK --restore-mark

      # DNAT
      # (out -> in)
      $iptables -t nat -A $special_fw_nat \
                -d $2 -p $3 --dport $4 \
                -j DNAT --to-destination $1:$5

      # --- FORWARD
      # accept
      # (in -> out)
      $iptables -A $special_fw \
                -i $if_ds \
                -s $1 -p $3 --sport $5 \
                -m state --state ESTABLISHED,RELATED -j ACCEPT
      # (out -> in)
      $iptables -A $special_fw \
                -o $if_ds \
                -d $1 -p $3 --dport $5 \
                -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


If not, I will simply try to migrate to nftables earlier, on dedicated
hardware this time, than I initially planned.  I cannot simply migrate
to a more recent kernel on this machine, because it is not just a
firewall/router.  It will be easier to debug on the dedicated hardware.

Thank you for your time and have a nice day.

(*) actually two levels of DNAT, one to another public address, one to
    a private address. One DNAT is on the same machines which does
    the routing hack, and one is on another separate system down the
    line.
