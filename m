From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Problems receiving UDP multicast traffic on bridge interface
Date: Sun, 4 Oct 2015 19:28:43 +0300
Message-ID: <CAEzD07L_ik1je3bCE_drJX2_-Zjf0pq68gzbLbMCy_eKbxftGg@mail.gmail.com>
References: <CAAP7uc+7f3ZU7ROvWvYDvLQp_GgzGiumx+KeFNPY1VxxK-g2jw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Pfk1up8wIODBzitj8neGur9tOOPWDIhzjas1I6pMyzA=;
        b=rg7leEFgU5Zti7pFS9E8CisqUb7X/24TbKMmS5CB3YVRwRP33zPivV2cud1IoZ8qA3
         5j3b/ouUUnzs4VS2QfKmpSi0b9BYu2gAVQrVFWho6Fi553h4V/2uoUpm2PViqbMiCfM6
         YYVdjYkq8tOAYcR3xUr8yYMF/+wGU5tHpIZpmdpme4bXE2cF/sbuT5fvv6wTvoIi4t5i
         +YHm8AXajvh+8SJTsUmP9cO495yDPgV9XIGsMVOqghsy3+7Mt2AQojpZJGEWTj+0fagb
         CF6qdniD2i9UXue4U8GI4JeIQRkTTQkDRc2UIc5NEZyC4neWRR1YEFpNeV1FfTsqcjfv
         dLIQ==
In-Reply-To: <CAAP7uc+7f3ZU7ROvWvYDvLQp_GgzGiumx+KeFNPY1VxxK-g2jw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksander Morgado <aleksander@aleksander.es>
Cc: netfilter@vger.kernel.org

Hello!
Seems like you have igmp-snooping issue. Run tcpdump and check the
igmp-traffic: you should see igmp-join at your daemon start and
periodical igmp-queries and replied igmp-reports. Allow input
igmp-packets in your ruleset.

2015-10-04 19:13 GMT+03:00 Aleksander Morgado <aleksander@aleksander.es>:
> Hey,
>
> I'm trying to debug an issue where UDP multicast traffic isn't
> properly reaching a UDP server daemon behind iptables. The issue
> doesn't happen with iptables disabled.
>
> The system is a virtual machine which has a br0 bridge interface
> composed of 2 eths. The br0 interface has an IP address, while the
> eths don't. It's a CentOS 6.2 server with iptables 1.4.7, ebtables
> 2.0.9 and kernel 2.6.32-220.el6.i686.
>
> The input chain is set to drop by default, and I'm just adding one rule:
>    -A INPUT -p udp -d 239.25.90.6 --dport 25906 -j ACCEPT
>
> Now, as soon as I start the UDP server daemon, packets will flow
> through iptables nicely, but only for some 4 mins and 20s (!approx,
> not always exactly that). After that, no more packets are received in
> the UDP server, and no packets are shown as being dropped in iptables
> (as if the packets didn't arrive iptables).
>
> It looks like the 4mins and 20s limit is to be counted from when the
> UDP server daemon starts; if I add the routing rule e.g. 5 mins after
> the UDP server starts, no traffic would flow. The UDP server daemon is
> just binding to the multicast group and port, and joining the
> multicast group operation (IP_ADD_MEMBERSHIP).
>
> Interestingly, If I run a tcpdump on that interface while I'm testing,
> the packets will always arrive iptables, pass the rule I added and
> flow to the UDP server socket; i.e. traffic doesn't stop after 4mins
> 20s.
>
> Any hint on what could be happening?
>
> --
> Aleksander
> https://aleksander.es
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
