From: jboyce@meridianenv.com
Subject: Re: Block all input but two non-contiguous networks
Date: Wed, 27 Feb 2013 15:43:33 -0800 (PST)
Message-ID: <52573.23.25.137.89.1362008613.squirrel@www.meridianenv.com>
References: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>
    <Pine.LNX.4.61.1302271336130.26706@soloth.lewis.org>
    <50999.23.25.137.89.1361998761.squirrel@www.meridianenv.com>
    <201302271706.45667.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201302271706.45667.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

On Wed, February 27, 2013 2:06 pm, Neal Murphy wrote:
> On Wednesday, February 27, 2013 03:59:21 PM you wrote:
>
>> The list below is from my /etc/sysconfig/iptable file.  I rules I would
>>  propose to add are preceeded with ***.
>>
>> *filter
>>
>>
>> :FORWARD ACCEPT [0:0]
>> :INPUT ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>>
>>
>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> -A INPUT -p icmp -j ACCEPT
>> -A INPUT -i lo -j ACCEPT
>> -A INPUT -i tun0 -j ACCEPT
>> ***-A INPUT -s 192.168.112.0/24 -j ACCEPT
>> ***-A INPUT -s 10.9.8.0/24 -j ACCEPT
>> -A INPUT -p udp -m state -m udp --dport 1194 --state NEW -j ACCEPT
>> -A INPUT -p udp -m state -m udp --dport 137 --state NEW -j ACCEPT
>> -A INPUT -p udp -m state -m udp --dport 138 --state NEW -j ACCEPT
>> -A INPUT -p tcp -m state -m tcp --dport 139 --state NEW -j ACCEPT
>> -A INPUT -p tcp -m tcp -m state --dport 445 --state NEW -j ACCEPT
>> -A INPUT -p tcp -m state -m tcp --dport 22 --state NEW -j ACCEPT
>> -A INPUT -p tcp -m state -m tcp --dport 10000 --state NEW -j ACCEPT
>> -A INPUT -p udp -m state -m udp --dport 1195 --state NEW -j ACCEPT
>> -A FORWARD -j REJECT --reject-with icmp-host-prohibited
>> -A INPUT -j REJECT --reject-with icmp-host-prohibited
>> COMMIT
>>
>
> These rules will ACCEPT *every* new conn from the two subnets regardless
> of destination (that is, will not limit them to SMB/CIFS, SSH, openVPN,
> etc), then accept new UDP/TCP conns from hosts on *other* subnets destined
> to the specified ports. This probably isn't what you want.

I am ok with accepting every new connection from these two subnets.  We
have a small company here and I don't have to worry about anyone within
the company snooping around.  As a matter of fact there is probably no one
else here besides me that has the knowledge to take advantage of it.

I am pretty good with understanding logic, my problem is understanding the
iptables language.  So I think that adding these two accept rules is all
that I need.  I already have the -A INPUT -j REJECT at the bottom of my
input chain.  Please enlighten me if I am still not understanding how I
need to meet my objective.

>
> You also jumbled your port and state options.

That is interesting, because that is how Webmin wrote the rules.  From
your statement does this mean that the rule is not working properly, and I
should fix something?

>
>
> Jon's solution is much closer, but addresses only SMB/CIFS. It also must
> have a DROP at the end of input (via explicit rule or by chain policy. A
> LOG rule
> (with an optional DROP rule) at the end of SAMBA would be good if you
> wanted to keep an eye on who tries to access your server.
>
> If you want to limit only SMB/CIFS to those two subnets, allow all
> traffic sources to the other ports, and don't want to use sub-chains, try:
>
>
> ---------
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -i tun0 -j ACCEPT
> -A INPUT -p udp -m state --state NEW -m multiport --dports 1194,1195 -j
> ACCEPT
> -A INPUT -p tcp -m state --state NEW -m multiport --dports 22,10000 -j
> ACCEPT
> -A INPUT -p udp -s 192.168.112.0/24,10.9.8.0/24 -m state --state NEW \
> -m multiport --dports 135,137,138 -j ACCEPT
> -A INPUT -p tcp -s 192.168.112.0/24,10.9.8.0/24 -m state --state NEW \
> -m multiport --dports 139,445 -j ACCEPT
> -A INPUT -j REJECT --reject-with icmp-host-prohibited
> -A FORWARD -j REJECT --reject-with icmp-host-prohibited
> ---------
>
>
> Assuming, of course, you are using a new-enough version of
> netfilter/iptables.
>
I am not sure what my version is.  I am running a stock RHEL6 system here.

Thanks.

Jeff Boyce
Meridian Environmental




