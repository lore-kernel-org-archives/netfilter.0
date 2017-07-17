From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: FTP NAT fails after kernel upgrade
Date: Mon, 17 Jul 2017 18:47:35 -0300
Message-ID: <c1b4d15d-1049-42fd-4a6b-d5f48a32392d@riosoft.com.br>
References: <26299185-e18e-bf19-f52e-969c0744594c@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <26299185-e18e-bf19-f52e-969c0744594c@riosoft.com.br>
Content-Language: pt-BR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Ok, external clients can now connect with the previous rules. I thought 
nf_nat_ftp was loaded but it wasn't.
Now I'm stuck at the same part I was when using nf_conntrack_helper = 1 
(now it's 0).
Not even the control connection completes (port 21 itself). Once more 
the connection goes all the way to the POSTROUTING chain but it doesn't 
even reach the destination.
The following rule was appended to try to make internal clients go back 
to LAN and reach the FTP. For the moment I'm using port 21 to make 
testing easier.

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d 192.168.0.10 -p tcp 
--dport 21 -j SNAT --to-source 192.168.0.1

(192.168.0.1 would be my internal firewall IP)

Any clues?
Thanks!

Em 17/07/2017 17:35, Bruno de Paula Larini escreveu:
> I've missed Adel's response (sorry!), and now I'm trying to load the 
> helper directly in the rules as suggested.
> However, now even external clients can't connect with the new ruleset 
> (the data connection fails).
> I'm not sure if I understood it completely, so here's what I'm trying 
> to do in my test environment:
>
>     #!/bin/bash
>
>     iptables -P FORWARD ACCEPT
>
>     ...
>
>     echo 1 > /proc/sys/net/ipv4/ip_forward
>
>     ...
>
>     iptables -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
>     iptables -t nat -A PREROUTING -p tcp --dport 21 -j DNAT 
> --to-destination 192.168.0.10
>
>     iptables -A FORWARD -d 192.168.0.10 -p tcp --dport 1024: -m 
> conntrack --ctstate ESTABLISHED -m helper --helper ftp -j ACCEPT
>
>     iptables -t nat -A POSTROUTING -s 192.168.0.10 -p tcp --sport 21 
> -j SNAT --to-source $public_ip
>
>
> Would this be enough? I've searched for more info about helpers and 
> how to use them but didn't find much.
> I had to add the raw table rule because the module wasn't being shown 
> as loaded on lsmod.
> In this case the FORWARD policy is ACCEPT.
>
> Also, I was already setting nf_conntrack_helper to 1 and it works for 
> users outside my LAN as I explained before, but it doesn't work when 
> trying to make a connection go back to my LAN with SNAT (which works 
> on 4.6).
>
> Thanks for the help.
>
>> There was a change in kernel 4.7 related to conntrack/nat helper.  I'm
>> quite sure that's your issue. Before 4.7, you got this dmesg warning,
>> for years:
>> nf_conntrack: automatic helper assignment is deprecated and it will 
>> be removed soon. Use the iptables CT target to attach helpers instead.
>>
>> Search "nf_conntrack_helper" in:
>> linux/Documentation/networking/nf_conntrack-sysctl.txt
>>
>> A good explanation of the "new way" including an FTP example:
>> https://home.regit.org/netfilter-en/secure-use-of-helpers/
>>
>> If it's down, like it appears to me now, Wayback Machine:
>> https://web.archive.org/web/20170704141901/https://home.regit.org/netfilter-en/secure-use-of-helpers/ 
>>
>>
>> You can still (for how long?) revert the change by setting
>> nf_conntrack_helper to 1 before loading any helper module.
>>
>> regards,
>> Adel Belhouane.
>

