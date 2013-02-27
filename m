From: jboyce@meridianenv.com
Subject: Re: Block all input but two non-contiguous networks
Date: Wed, 27 Feb 2013 13:46:38 -0800 (PST)
Message-ID: <51089.23.25.137.89.1362001598.squirrel@www.meridianenv.com>
References: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>   
    <Pine.LNX.4.61.1302271336130.26706@soloth.lewis.org>
    <50999.23.25.137.89.1361998761.squirrel@www.meridianenv.com>
    <Pine.LNX.4.61.1302271605040.26706@soloth.lewis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.1302271605040.26706@soloth.lewis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jon Lewis <jlewis@lewis.org>
Cc: netfilter@vger.kernel.org




On Wed, February 27, 2013 1:09 pm, Jon Lewis wrote:
> On Wed, 27 Feb 2013 jboyce@meridianenv.com wrote:
>
>
>> The list below is from my /etc/sysconfig/iptable file.  I rules I would
>>  propose to add are preceeded with ***.
>>
>> *filter
>> :FORWARD ACCEPT [0:0]
>> :INPUT ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> -A INPUT -p icmp -j ACCEPT
>> -A INPUT -i lo -j ACCEPT
>> -A INPUT -i tun0 -j ACCEPT
>> ***-A INPUT -s 192.168.112.0/24 -j ACCEPT
>> ***-A INPUT -s 10.9.8.0/24 -j ACCEPT
>>
>
> You could add those lines, but keep in mind, by doing so, you're allowing
>  all IP traffic from those networks.  Not just Samba-related traffic.
> That
> may be fine...it's up to you.

Yes, I would be fine with that.

>
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
>>
>
> The rest of this is troubling.  Your above rules open Samba, SSH, and
> whatever is using 1194, 1195, and 10000 to the world.  What's the point of
>  explicitly allowing traffic from the two private networks if you have
> these ports wide open anyway?  If this machine is on a non-filtered
> internet connection, you're probably also seeing SSH brute force login
> attempts.

Interesting, that makes sense, and that is why I was originally thinking
of using a negated rule in my iptables.  I was also thinking that the
INPUT REJECT at the end was address most everything else.  I just used the
standard firewall configuration tool in RHEL6 when I set it up, and since
then using Webmin.  The 1194 and 1195 are the ports for my OpenVPN, and
10000 is the port for Webmin.  I do have to keep SSH, OpenVPN, and Webmin
open because I have to have access to the system from wherever I am, when
I am not in the office.  This could be from my home, or from anywhere I
might be doing fieldwork (my duties are also as a forester), essentially a
non-fixed public ip address.

I do see occassion hits from SSH login attempts.  I have /etc/hostsallow
to accept SSH and Samba from my lan and vpn networks, and /etc/hostdeny to
reject all.  So the hits to SSH and Samba are getting rejected at host
allow/deny, which is what I am seeing in my daily logwatch email.  If you
have an idea for some simple changes that I should make, I am all ears.  I
have always avoided doing a firewall script like I see discussed
everywhere, so if you have something that I can add or change via Webmin I
am game to try it.  Thanks.

Jeff Boyce
Meridian Environmental


>
> ----------------------------------------------------------------------
> Jon Lewis, MCP :)           |  I route
> Senior Network Engineer     |  therefore you are
> Atlantic Net                |
> _________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
>
>
>


