From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Fri, 10 Feb 2012 00:05:19 -0600 (CST)
Message-ID: <20909671.2928.1328853919518.JavaMail.root@ixer.mx>
References: <5634144.2926.1328853844897.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5634144.2926.1328853844897.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

>> Apply the rule: "iptables -t nat -I POSTROUTING -o ppp0 -j
>> MASQUERADE", this masks the port 22 (tcp) but not the 1195 (udp),
>> because I can
>> connect via ssh.
>
>What do you mean by "masks"? What are you expecting the MASQUERADE
>target to do? From the little information I've seen, it looks like you
>are sending packets from a single interface from the local machine, in
>which case the MASQUERADE will have no effect anyway.
>
>> It seems the problem is that does not mask the port 1195 (udp).
>>
>
>MASQUERADE works fine with UDP whenever I have used it.
>
>Andy


Hello Andy, thank you for the atention.

I have four interfaces and the default gateway is eth1

- eth0 (LAN)
- eth1 (internet link)
- eth3 (internet link)
- ppp0 (internet link)

I mark (mangle) package udp (1195) for out by interface ppp0.
"iptables -t mangle -I OUTPUT -p udp -m udp --dport 1195 -j MARK --set-mark 1

and when i try MASQUERADE the package udp (1195) with "iptables -t nat -I POSTROUTING -p udp -m udp --dport 1195 -o ppp0 -j MASQUERADE", does not work!!

Any idea?

E.Huerta
