From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Thu, 9 Feb 2012 23:44:51 -0600 (CST)
Message-ID: <12775433.2910.1328852691898.JavaMail.root@ixer.mx>
References: <26800503.2896.1328827967506.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <26800503.2896.1328827967506.JavaMail.root@ixer.mx>
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

Hello Andy, I have three interfaces 
