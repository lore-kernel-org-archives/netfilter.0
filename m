From: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Subject: Re: NAT wont work for my OpenVPN
Date: Fri, 25 Sep 2009 18:59:27 +0300
Message-ID: <4ABCE8DF.6020002@edu.physics.uoc.gr>
References: <200909251540.21114.Thomas.Hluchnik@netcologne.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200909251540.21114.Thomas.Hluchnik@netcologne.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 25/09/09 16:40, Thomas.Hluchnik@netcologne.de wrote:
> Hello,
>
> I am a bit new to ipfilter stuff and didnt succeed in forwarding my OpenVPN traffic. Maybe someone is able to tell me the iptables commands.
>
> Situation: I got a dedicated Rootserver with one network interface. Some days ago I setup a OpenVPN server (IP-Range 10.47.11.0/24) on that box which works for itself. At home I have a OpenVPN client connected to the server, which works, too. I can ping the tun Interface of the server, I can login through the VPN channel on the server and I can dig @tun-interface any-domain.
>    

Check that you have ip forwarding enabled.
cat /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/ip_forward (to enable it)

man sysctl (also check openvpn startup script)
to make the changes permanent.

There should also be a FORWARD line in you firewall
something like this (if you use the tun interface):

iptables -A FORWARD -i tun+ -s 10.47.11.0/24 -j ACCEPT

Giannis
