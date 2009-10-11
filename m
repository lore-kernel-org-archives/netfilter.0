From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: Port Forwarding
Date: Sun, 11 Oct 2009 19:16:25 +1100
Message-ID: <4AD19459.10708@standarduniversal.com.au>
References: <1572887654.20091011013039@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1572887654.20091011013039@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jen140@gmail.com
Cc: netfilter@vger.kernel.org

and dont forget to enable ip forwarding, or nothing will get through!



jen140@gmail.com wrote:
> Hello.
> I am running Debian(5.0.3), and have kernel version: 2.6.26-2-686.
> And I have just installed the iptables v1.4.5.
> After  searching for help on debian and ubuntu forums, i didnt get any
> response, so I'm writing here.
> My network configuration is next:
> eth0 is my internet interface and has dinamic ip(83.x.x.x).
> eth1 is my intranet interface and has static ip(192.168.0.1).
> The server machine(thise pc) shares internet with other machines.
> At debian start iptables has the next config:
> iptables -P FORWARD ACCEPT
> iptables --table nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> So now getting to the problem.
> I  wanted  to configure port forwarding, and forward port 135 from Any
> address  that  comes from eth0 (internet) to ip 192.168.0.200 and same
> port(135).
> I've tryied running the next:
> iptables -F
> iptables -t nat -F
> iptables -P FORWARD ACCEPT
> iptables --table nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> iptables --table nat -A PREROUTING --in-interface eth0 -j DNAT -p tcp --dport 135 --to 192.168.0.200:135
> But   the   problem   is   that  it  is  filtered  (I  check  it  with
> nmap-online.com service).
> Am i doing anything wrong or my kernel doesnt support it ?
> Thanks in advance.
> Have a good day.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
