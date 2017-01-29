From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: ssh tunnels and iptables
Date: Sun, 29 Jan 2017 19:05:02 +0200
Message-ID: <159eb2fe630.27c2.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
References: <CAGU6BDkW2C3JvsryWFzZT02MUZfOA6woZjB9NZqnQnJf_7ViQA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGU6BDkW2C3JvsryWFzZT02MUZfOA6woZjB9NZqnQnJf_7ViQA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: deva seetharam <deva.seetharam@gmail.com>, netfilter@vger.kernel.org

Your ssh tunnel is from Port 2222 to 22 so iptables with port 22 is valid.

Thank you,

Mark Adrian Coetser
mark@pkfnet.co.za



On 29 January 2017 5:35:08 PM deva seetharam <deva.seetharam@gmail.com> wrote:

> I have setup a reverse ssh tunnel using the following command between
> a Linux laptop and a remote server:
>
>     ssh -4nNT -R 2222:localhost:22 somehost.com
> That is, the laptop, which is behind a firewall, can be accessed over
> ssh using the following command:
>
>     ssh -p 2222 -l joe somehost.com
>
> on sshd_config of somehost.com, i have enabled Gatewayports=yes.
>
> I am glad to say all these work fine. However, one thing beats me:
> there is an `iptables` running on somehost.com that does NOT have the
> port 2222 opened. In spite of this tunnel works, how is that possible?
> how does iptables handle gateway ports of ssh? could anyone kindly
> explain? thanks in advance.
>
> here is the output of iptables -L:
>
>       target     prot opt source               destination
>
>       ACCEPT     icmp --  anywhere             anywhere
> icmp destination-unreachable
>       ACCEPT     icmp --  anywhere             anywhere
> icmp time-exceeded
>       ACCEPT     icmp --  anywhere             anywhere
> icmp echo-request
>       ACCEPT     icmp --  anywhere             anywhere
> icmp echo-reply
>       DROP       tcp  -f  anywhere             anywhere
>       DROP       tcp  --  anywhere             anywhere
> tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
>       DROP       tcp  --  anywhere             anywhere
> tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
>       DROP       tcp  --  anywhere             anywhere
> tcp flags:FIN,SYN/FIN,SYN
>       DROP       tcp  --  anywhere             anywhere
> tcp flags:FIN,ACK/FIN
>       DROP       tcp  --  anywhere             anywhere
> tcp flags:SYN,RST/SYN,RST
>       DROP       tcp  --  anywhere             anywhere
> tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
>       DROP       udp  --  anywhere             anywhere
> udp spt:bootps dpt:bootpc
>       DROP       tcp  --  anywhere             anywhere
> tcp dpt:kazaa
>       DROP       udp  --  anywhere             anywhere
> udp dpt:kazaa
>       LOG        tcp  --  anywhere             somehost.com  tcp
> dpt:ssh state NEW LOG level warning tcp-options ip-options prefix
> "firewall-> ssh1: "
>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:ssh
>       LOG        tcp  --  anywhere             somehost.com  tcp
> dpt:2023 state NEW LOG level warning tcp-options ip-options prefix
> "firewall-> Check: "
>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:2023
>       LOG        tcp  --  anywhere             somehost.com  tcp
> dpt:http state NEW LOG level warning tcp-options ip-options prefix
> "firewall-> HTTP: "
>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:http
>       LOG        tcp  --  anywhere             somehost.com  tcp
> dpt:https state NEW LOG level warning tcp-options ip-options prefix
> "firewall-> HTTPS: "
>       ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:https
>
>       Chain FORWARD (policy ACCEPT)
>       target     prot opt source               destination
>
>       Chain OUTPUT (policy ACCEPT)
>       target     prot opt source               destination
>       ACCEPT     tcp  --  anywhere             anywhere             tcp spt:http
>
>
> --
> best regards,
> Deva P. Seetharam
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


