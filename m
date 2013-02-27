From: Jon Lewis <jlewis@lewis.org>
Subject: Re: Block all input but two non-contiguous networks
Date: Wed, 27 Feb 2013 16:09:19 -0500 (EST)
Message-ID: <Pine.LNX.4.61.1302271605040.26706@soloth.lewis.org>
References: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>   
 <Pine.LNX.4.61.1302271336130.26706@soloth.lewis.org>
 <50999.23.25.137.89.1361998761.squirrel@www.meridianenv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50999.23.25.137.89.1361998761.squirrel@www.meridianenv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: jboyce@meridianenv.com
Cc: netfilter@vger.kernel.org

On Wed, 27 Feb 2013 jboyce@meridianenv.com wrote:

> The list below is from my /etc/sysconfig/iptable file.  I rules I would
> propose to add are preceeded with ***.
>
> *filter
> :FORWARD ACCEPT [0:0]
> :INPUT ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -i tun0 -j ACCEPT
> ***-A INPUT -s 192.168.112.0/24 -j ACCEPT
> ***-A INPUT -s 10.9.8.0/24 -j ACCEPT

You could add those lines, but keep in mind, by doing so, you're allowing 
all IP traffic from those networks.  Not just Samba-related traffic.  That 
may be fine...it's up to you.

> -A INPUT -p udp -m state -m udp --dport 1194 --state NEW -j ACCEPT
> -A INPUT -p udp -m state -m udp --dport 137 --state NEW -j ACCEPT
> -A INPUT -p udp -m state -m udp --dport 138 --state NEW -j ACCEPT
> -A INPUT -p tcp -m state -m tcp --dport 139 --state NEW -j ACCEPT
> -A INPUT -p tcp -m tcp -m state --dport 445 --state NEW -j ACCEPT
> -A INPUT -p tcp -m state -m tcp --dport 22 --state NEW -j ACCEPT
> -A INPUT -p tcp -m state -m tcp --dport 10000 --state NEW -j ACCEPT
> -A INPUT -p udp -m state -m udp --dport 1195 --state NEW -j ACCEPT
> -A FORWARD -j REJECT --reject-with icmp-host-prohibited
> -A INPUT -j REJECT --reject-with icmp-host-prohibited

The rest of this is troubling.  Your above rules open Samba, SSH, and 
whatever is using 1194, 1195, and 10000 to the world.  What's the point of 
explicitly allowing traffic from the two private networks if you have 
these ports wide open anyway?  If this machine is on a non-filtered 
internet connection, you're probably also seeing SSH brute force login 
attempts.

----------------------------------------------------------------------
  Jon Lewis, MCP :)           |  I route
  Senior Network Engineer     |  therefore you are
  Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
