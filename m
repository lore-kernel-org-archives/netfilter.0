From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Packets being reflected back from firewall unintentionally...
Date: Mon, 27 Apr 2015 13:46:48 +0300
Message-ID: <CAEzD07+js1g2-1BEDnS2bDPNDDL52KG-fP55+UBBhU+aLcTOog@mail.gmail.com>
References: <CANDZmsURcr3k3msVhHe4ZUrHEW_B8kbHHNMom_uByWPcr2eoKA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=xJK63ZNSMLJMsq9FMJChoNWFRZjODGzkHwqW0+FeHUQ=;
        b=dV/D9dcwhFezmbE4xoq1nFrHbNNm5LywJOTDU7Y4km2Cr0guUGDfNpj9f2UzLKdvCg
         Z+yWi12Y5yG/24rdDamkoAp/KtISznykDmWKYaqkIevQlEzl13oVcm8rVDs0CXDxV3GB
         qFzu06/6iJ8Br3/vhoMJqe9Ex2IjUABk9BZXS9X9B/OZdh3S6Fjd6v3XcYURV3ry/WSW
         Dc158LQCGcUr5UZ2icyVEyDFVnJG/PVOGrq7jBVtCIEq7AfzqIed5Df28WCNJECgCItd
         sdwZUJnCJpV9wQhToXh4LL3N69Bc7lFfIs3/KETzhTDUpPZF+ucK+lqlOE8TpEodTN+3
         mCDA==
In-Reply-To: <CANDZmsURcr3k3msVhHe4ZUrHEW_B8kbHHNMom_uByWPcr2eoKA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Smith <gizmosmith@gmail.com>
Cc: netfilter@vger.kernel.org

Hello.
Check the full ruleset (iptables-save -c).
If you wont find the issue, use the TRACE target for packets from
internal LAN Asterisk server.
Also, you can ask the help on #netfilter irc-channel at freenode.

2015-04-27 8:03 GMT+03:00 Matthew Smith <gizmosmith@gmail.com>:
> I have a 192.168.1.14 host behind a linux firewall with ip
> 192.168.1.1.  The interface of the firewall facing the internet is
> "em1" and the private interface is "p1p1"
> I've enabled "masquerading" via SNAT for the whole 192.168.1/24 subnet
> with the following iptables rules:
>
> -t nat -A POSTROUTING -s 192.168.1/24 -o em1 -j SNAT --to (MY_PUBLIC_IP)
> -A FORWARD -i em1 -o p1p1 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i p1p1 -o em1 -j ACCEPT
>
> This works fine as all hosts in the 192.168.1/24 subnet can get out to
> the internet just fine.
>
> I opened a port forward up to an asterisk server inside the subnet to
> allow a remote asterisk server to connect to my asterisk server
> inside:
>
> $IPT -t nat -A PREROUTING -i em1 -s (REMOTE_ASTERISK_SERVER_IP) -d
> (MY_PUBLIC_IP) -p udp --dport 4569 -j DNAT --to-destination
> (PRIVATE_INTERNAL_ASTERISK_IP)
> $IPT -A FORWARD -s (REMOTE_ASTERISK_SERVER_IP) -p udp --dport 4569 -j ACCEPT
>
> So, the remote asterisk server can connect in just fine.  Packets
> coming from it to my asterisk server are handled perfectly accoridng
> to tcpdump.  The trouble is my internal asterisk server can't get out
> port 4569.  If it tries to send a packet to REMOTE_ASTERISK_SERVER_IP
> it gets reflected back from interface p1p1 on the firewall.  The
> packet doesn't even make it to em1 of the firewall.
>
> Here's the header of the packet leaving the asterisk server:
> Source: (PRIVATE_INTERNAL_ASTERISK_IP)
> Destination: (REMOTE_ASTERISK_SERVER_IP)
>
> This packet hits p1p1 and is immediately returned back to the internal
> asterisk server with the following header:
> Source:  (MY_PUBLIC_IP)
> Destination:  (PRIVATE_INTERNAL_ASTERISK_IP)
>
> So, both addresses are changed and the packet never gets past the
> firewall.  Any reason why this happens?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
