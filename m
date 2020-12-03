From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Thu, 3 Dec 2020 11:39:17 +0300
Message-ID: <7c63ca9b-408e-580b-7097-0f57cfebde57@gmail.com>
References: <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
 <X8d5JZT5cmBFUvNA@flatwhite> <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
 <X8eKYjtPSINtYYnl@flatwhite> <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
 <X8e8+YL653hAkGe9@flatwhite> <004f01d6c8d1$7c068350$741389f0$@gmail.com>
 <X8fXNs9Qt6XfwqlA@flatwhite>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=18klTQsl19W40Sw394OV09fOG5fPDh0mK0qGwYOxNNk=;
        b=me0uZWmmZKIci+9j+cza6eYzakepmgnKsLMk+DTvTIxU3bxLad+iPmRdZZbAVg71bY
         Qg56GyHDjYqppfkGgXMFe8Lc/F5jL+miJmr9apBs+QC/CeR2RpFuSls2etOaQe94cDaB
         EjjzdLSCw0Y3GQ3SWjJGN8PmKLE+Z26PpBeCrNQPSGGqLImQoM4fc69M2f/CumUgUxXh
         DzauAe56OqdJLGdLFrR4O9/NTywcK+xb9o7CDxGc4OE2IcmFnwTFLvWj2GEyat48BYgs
         UXRMr/+WFmFON+nyV4fZLwIe85X87JLtJ6qZEDliimKal2tOepn1MNB53cIJohbglNUh
         +wFA==
In-Reply-To: <X8fXNs9Qt6XfwqlA@flatwhite>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Cc: 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

I looked your old mail and I tested on debian buster.

"ip rule dport" not working like fwmark. How did you tested? Share your 
setup step-by-step with example commands.(Please use veth with namespace)

Kernel doesn't forward multicast traffic to an other interface without 
user-level multicast routing daemon.(mrouted,smcroute,pimd etc.)
Am I wrong? Can someone correct me?

Kernel enable multicast forwarding feature with multicast daemon 
otherwise you don't have permission for this.

echo 1 > /proc/sys/net/ipv4/conf/all/mc_forwarding
-bash: /proc/sys/net/ipv4/conf/all/mc_forwarding: Permission denied

When started the daemon you will see the forwarding enable.

Routing deamon will be add this route automatically to routing table.
ip route show table all type multicast
multicast 225.1.2.3/32 from 10.0.1.2/32 table default proto 17 iif s-eth10
     nexthop dev c-eth10 weight 2


Anyway. If you want to example for "fwmark" with mcast daemon, than flow 
these steps.

iptables -t mangle -A PREROUTING -d 225.1.2.3/32 -p udp -m pkttype 
--pkt-type multicast -m udp --dport 3000 -m mark --mark 0x0 -j MARK 
--set-mark 12

ip mrule add fwmark 12 table 12 pref 12  # don't use 0 for pref.

cat > /etc/mrt12.conf <<EOF
mgroup from s-eth10 group 225.1.2.3
mroute from s-eth10 group 225.1.2.3 to c-eth10
EOF

smcrouted -n -I mrt12 -t 12

-I instance name
-t routing table id

ip route show table all type multicast
multicast 225.1.2.3/32 from 10.0.1.2/32 table 12 proto 17 iif s-eth10
     nexthop dev c-eth10 weight 2


Regards.

Fatih USTA

On 2.12.2020 21:04, Marcin Szewczyk wrote:
> On Wed, Dec 02, 2020 at 07:35:07PM +0200, Eliezer Croitor wrote:
>> There is a difference between packets which are dropped to the nic itself
>> and traffic which is bounded to a specific ip address.
>>  From what I remember( and my memory is not the best as it was..) the last
>> time I checked on Debian jessie you couldn't do any routing
>> decision on a bounded socket.
>> Maybe on newer versions of the kernel or another OS it's not the same.
> But remember that `ip rule dport…` works (available in Buster) and it
> interacts with the same sockets as fwmark does but `ip rule fwmark…`
> doesn't work. So evidence suggest that there are indeed routing
> decisions being made for those sockets.
>
> Also note that I have done tests on sockets with sendto() without
> explicit binding with any address or interface.
>
