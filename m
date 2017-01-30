From: deva seetharam <deva.seetharam@gmail.com>
Subject: Re: ssh tunnels and iptables
Date: Mon, 30 Jan 2017 06:03:08 +0530
Message-ID: <CAGU6BD=-W-YwLXbYgNgCOwd-nO1RGK=0=GOEUauK00u+rEiQDQ@mail.gmail.com>
References: <CAGU6BDkW2C3JvsryWFzZT02MUZfOA6woZjB9NZqnQnJf_7ViQA@mail.gmail.com>
 <159eb2fe630.27c2.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YF2PTVQ9amy1jPztVUk364G9hSefuuGII+J/TTYH2ao=;
        b=lWkY6cJg0U+6+gtnq0r4vmbrzowlz0YUAZuTUpmCZ84iks2W9j5D3KyoJ/iRLRYozj
         eq1q+JrNEg7R/b4GwNnZL+zWSVQ7E+lkQdCwc01uoEApNnVi/j0foHenXs2DIdeWOtlq
         gG7DoqS0eEKQy4fmI1ryaop1G3qeg51YgwC3Qx+kbHg2lwnJ8eP2ZsHteAq4+CyThXwI
         KPIIOwq8+eLIg6ILaLYAHza7XNYM7wOumBIpasGseJiC9VDtMpmSr/3obpUrPO1yriKm
         cEzffEkJx7hFvyNzAJ7MDMpUQPfU53Oc2VMcL1sd8jIAdsIs4aW+PFlDHku5o0Sq+p3L
         oHiQ==
In-Reply-To: <159eb2fe630.27c2.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Coetser <mark@pkfnet.co.za>
Cc: netfilter@vger.kernel.org

sorry, it does not make sense because it is a reverse tunnel. that is,
the server that is running the firewall  gets the connection requests
on that port (2222). i see that the port opens (can see it using nmap)
up as soon as the tunnel is up. however, IPTABLES does not have that
port open. that is what is confusing.

On Sun, Jan 29, 2017 at 10:35 PM, Mark Coetser <mark@pkfnet.co.za> wrote:
> Your ssh tunnel is from Port 2222 to 22 so iptables with port 22 is valid.
>
> Thank you,
>
> Mark Adrian Coetser
> mark@pkfnet.co.za
>
>
>
>
> On 29 January 2017 5:35:08 PM deva seetharam <deva.seetharam@gmail.com>
> wrote:
>
>> I have setup a reverse ssh tunnel using the following command between
>> a Linux laptop and a remote server:
>>
>>     ssh -4nNT -R 2222:localhost:22 somehost.com
>> That is, the laptop, which is behind a firewall, can be accessed over
>> ssh using the following command:
>>
>>     ssh -p 2222 -l joe somehost.com
>>
>> on sshd_config of somehost.com, i have enabled Gatewayports=yes.
>>
>> I am glad to say all these work fine. However, one thing beats me:
>> there is an `iptables` running on somehost.com that does NOT have the
>> port 2222 opened. In spite of this tunnel works, how is that possible?
>> how does iptables handle gateway ports of ssh? could anyone kindly
>> explain? thanks in advance.
>>
>> here is the output of iptables -L:
>>
>>       target     prot opt source               destination
>>
>>       ACCEPT     icmp --  anywhere             anywhere
>> icmp destination-unreachable
>>       ACCEPT     icmp --  anywhere             anywhere
>> icmp time-exceeded
>>       ACCEPT     icmp --  anywhere             anywhere
>> icmp echo-request
>>       ACCEPT     icmp --  anywhere             anywhere
>> icmp echo-reply
>>       DROP       tcp  -f  anywhere             anywhere
>>       DROP       tcp  --  anywhere             anywhere
>> tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
>>       DROP       tcp  --  anywhere             anywhere
>> tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
>>       DROP       tcp  --  anywhere             anywhere
>> tcp flags:FIN,SYN/FIN,SYN
>>       DROP       tcp  --  anywhere             anywhere
>> tcp flags:FIN,ACK/FIN
>>       DROP       tcp  --  anywhere             anywhere
>> tcp flags:SYN,RST/SYN,RST
>>       DROP       tcp  --  anywhere             anywhere
>> tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
>>       DROP       udp  --  anywhere             anywhere
>> udp spt:bootps dpt:bootpc
>>       DROP       tcp  --  anywhere             anywhere
>> tcp dpt:kazaa
>>       DROP       udp  --  anywhere             anywhere
>> udp dpt:kazaa
>>       LOG        tcp  --  anywhere             somehost.com  tcp
>> dpt:ssh state NEW LOG level warning tcp-options ip-options prefix
>> "firewall-> ssh1: "
>>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:ssh
>>       LOG        tcp  --  anywhere             somehost.com  tcp
>> dpt:2023 state NEW LOG level warning tcp-options ip-options prefix
>> "firewall-> Check: "
>>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:2023
>>       LOG        tcp  --  anywhere             somehost.com  tcp
>> dpt:http state NEW LOG level warning tcp-options ip-options prefix
>> "firewall-> HTTP: "
>>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:http
>>       LOG        tcp  --  anywhere             somehost.com  tcp
>> dpt:https state NEW LOG level warning tcp-options ip-options prefix
>> "firewall-> HTTPS: "
>>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:https
>>
>>       Chain FORWARD (policy ACCEPT)
>>       target     prot opt source               destination
>>
>>       Chain OUTPUT (policy ACCEPT)
>>       target     prot opt source               destination
>>       ACCEPT     tcp  --  anywhere             anywhere             tcp
>> spt:http
>>
>>
>> --
>> best regards,
>> Deva P. Seetharam
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>



-- 
best regards,
Deva P. Seetharam
