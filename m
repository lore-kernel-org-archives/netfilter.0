From: Jon Lewis <jlewis@lewis.org>
Subject: Re: Block all input but two non-contiguous networks
Date: Wed, 27 Feb 2013 13:42:32 -0500 (EST)
Message-ID: <Pine.LNX.4.61.1302271336130.26706@soloth.lewis.org>
References: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50296.23.25.137.89.1361987914.squirrel@www.meridianenv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: jboyce@meridianenv.com
Cc: netfilter@vger.kernel.org

On Wed, 27 Feb 2013 jboyce@meridianenv.com wrote:

> iptables -I INPUT ! -s 192.168.112.0/24 -j DROP
> iptables -I INPUT ! -s 10.9.8.0/24 -j DROP
>
> With the use of negation, this would cause a problem because the second
> network range would not be allowed through, regardless of which rule was
> listed first.

You need to just turn those into ACCEPT rules and then either have a 
default policy of drop or a drop rule following the ACCEPT rules.

i.e. if samba is listening on

Port 135/TCP - used by smbd
Port 137/UDP - used by nmbd
Port 138/UDP - used by nmbd
Port 139/TCP - used by smbd
Port 445/TCP - used by smbd

I'd do something like:

iptables -N SAMBA
iptables -A SAMBA -s 192.168.112.0/24 -j ACCEPT
iptables -A SAMBA -s 10.9.8.0/24 -j ACCEPT
iptables -A INPUT -m tcp -p tcp --dport 135 -j SAMBA
iptables -A INPUT -m udp -p udp --dport 137 -j SAMBA
iptables -A INPUT -m udp -p udp --dport 138 -j SAMBA
iptables -A INPUT -m tcp -p tcp --dport 139 -j SAMBA
iptables -A INPUT -m tcp -p tcp --dport 445 -j SAMBA

You can finish this with either
iptables -A SAMBA -j DROP
or a default policy of DROP on the INPUT chain, or an explicit DROP rule 
at the end of the INPUT rules.


----------------------------------------------------------------------
  Jon Lewis, MCP :)           |  I route
  Senior Network Engineer     |  therefore you are
  Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
