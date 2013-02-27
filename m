From: jboyce@meridianenv.com
Subject: Re: Block all input but two non-contiguous networks
Date: Wed, 27 Feb 2013 12:59:21 -0800 (PST)
Message-ID: <50999.23.25.137.89.1361998761.squirrel@www.meridianenv.com>
References: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>
    <Pine.LNX.4.61.1302271336130.26706@soloth.lewis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.1302271336130.26706@soloth.lewis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jon Lewis <jlewis@lewis.org>
Cc: netfilter@vger.kernel.org

Thanks for the clear and concise description, Jon.  I appreciate it since
I try very hard to give a good description of my problem or issue on
mailing lists.  Since I am not famailiar with creating a user defined
chain I had to do a little more research to understand your description,
but I think that is going to be the way for me to go with this.

On second thought, after writing out my rules and figuring how and where
to call the user defined chain, I realized that I can probably just put
the two accept rules right into my input chain.

Since I already have some Samba port rules in my input chain, and an
explicit reject at the end of my input chain, I thought I would bounce
back my proposed configuration change so you could give me your opinion on
whether I have this right.  I am a novice Linux admin and generally make
my firewall changes via Webmin so I want to fully understand what it
should look like before making the change.

The list below is from my /etc/sysconfig/iptable file.  I rules I would
propose to add are preceeded with ***.

*filter
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i tun0 -j ACCEPT
***-A INPUT -s 192.168.112.0/24 -j ACCEPT
***-A INPUT -s 10.9.8.0/24 -j ACCEPT
-A INPUT -p udp -m state -m udp --dport 1194 --state NEW -j ACCEPT
-A INPUT -p udp -m state -m udp --dport 137 --state NEW -j ACCEPT
-A INPUT -p udp -m state -m udp --dport 138 --state NEW -j ACCEPT
-A INPUT -p tcp -m state -m tcp --dport 139 --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp -m state --dport 445 --state NEW -j ACCEPT
-A INPUT -p tcp -m state -m tcp --dport 22 --state NEW -j ACCEPT
-A INPUT -p tcp -m state -m tcp --dport 10000 --state NEW -j ACCEPT
-A INPUT -p udp -m state -m udp --dport 1195 --state NEW -j ACCEPT
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
-A INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT


Thanks for you help.

Jeff Boyce
Meridian Environmental



On Wed, February 27, 2013 10:42 am, Jon Lewis wrote:
> On Wed, 27 Feb 2013 jboyce@meridianenv.com wrote:
>
>
>> iptables -I INPUT ! -s 192.168.112.0/24 -j DROP iptables -I INPUT ! -s
>> 10.9.8.0/24 -j DROP
>>
>>
>> With the use of negation, this would cause a problem because the second
>>  network range would not be allowed through, regardless of which rule
>> was listed first.
>
> You need to just turn those into ACCEPT rules and then either have a
> default policy of drop or a drop rule following the ACCEPT rules.
>
> i.e. if samba is listening on
>
> Port 135/TCP - used by smbd
> Port 137/UDP - used by nmbd
> Port 138/UDP - used by nmbd
> Port 139/TCP - used by smbd
> Port 445/TCP - used by smbd
>
>
> I'd do something like:
>
>
> iptables -N SAMBA iptables -A SAMBA -s 192.168.112.0/24 -j ACCEPT iptables
> -A SAMBA -s 10.9.8.0/24 -j ACCEPT
> iptables -A INPUT -m tcp -p tcp --dport 135 -j SAMBA iptables -A INPUT -m
> udp -p udp --dport 137 -j SAMBA iptables -A INPUT -m udp -p udp --dport
> 138 -j SAMBA
> iptables -A INPUT -m tcp -p tcp --dport 139 -j SAMBA iptables -A INPUT -m
> tcp -p tcp --dport 445 -j SAMBA
>
> You can finish this with either
> iptables -A SAMBA -j DROP or a default policy of DROP on the INPUT chain,
> or an explicit DROP rule at the end of the INPUT rules.
>
>
> ----------------------------------------------------------------------
> Jon Lewis, MCP :)           |  I route
> Senior Network Engineer     |  therefore you are
> Atlantic Net                |
> _________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
>
>
>


