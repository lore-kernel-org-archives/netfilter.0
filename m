From: sillysausage <sillysausage@privatedemail.net>
Subject: Re: Creating a LAN only null routed network (no access to internet)
Date: Thu, 13 Aug 2015 15:10:36 +0930
Message-ID: <55CC2DD4.6090706@privatedemail.net>
References: <55CB462D.6040203@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55CB462D.6040203@privatedemail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 12/08/15 22:42, sillysausage wrote:
> I'm a bit stuck as to what the default route should be for the LAN
> table.
> 
> In the past I've used something like:
> 
>   /sbin/ip route add table <table> default via ${IPLOCAL}
> 
> However this table shouldn't be routed to ppp0 or tun0's IP.
> 

I solved this problem it was as simple as creating an unreachable range
and then setting that to the default route:

# Add an unreachable subnet
ip route add unreachable 192.168.4.0/24

# Make the unreachable subnet the default gateway for members of LAN
/sbin/ip route add table LAN default via 192.168.4.0


> Likewise the from rule I've used in the past has usually been
> something like:
> 
>   /sbin/ip rule add from ${IPLOCAL} table <table>
> 

This wasn't needed either, all I had to do was add an entry in each
table to see the 192.168.3.0/24 range eg:

# Add route to ISP from LAN
/sbin/ip route add 192.168.3.0/24 dev eth0 table ISP

# Add route to VPN from LAN
/sbin/ip route add 192.168.3.0/24 dev eth0 table VPN


> gateway:~# ip route add 192.168.1.0/24 dev eth0 table LAN
> gateway:~# ip route add 192.168.2.0/24 dev eth0 table LAN
> gateway:~# ip route add 192.168.3.0/24 dev eth0 table LAN

And of course this.

I removed all the fwmark 0x3 rules because that was me over thinking the
problem.

It does turn out I will need to buy myself a managed switch at some
point and use VLANs instead of virtual interfaces if I want to assign IP
addresses in this range. Virtual interfaces such as eth0:3 (192.168.3.1)
currently have the same broadcast as eth0 (192.168.1.1) which would mean
this will never work:

eg the printer will be assigned something in the 192.168.1.0/24 range.

gateway:~# cat /etc/dhcp/dhcpd.conf
authoritative;
ddns-update-style interim;
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.10 192.168.1.240;
    default-lease-time 259200;
    max-lease-time 518400;
    option subnet-mask 255.255.255.0;
    option broadcast-address 192.168.1.255;
    option routers 192.168.1.1;
    option ntp-servers 192.168.1.1;
    option domain-name-servers 192.168.1.1;
}

subnet 192.168.3.0 netmask 255.255.255.0 {
    range 192.168.3.2 192.168.3.240;
    default-lease-time 259200;
    max-lease-time 518400;
    option subnet-mask 255.255.255.0;
    option broadcast-address 192.168.3.255;
    option routers 192.168.3.1;
    deny unknown-clients;

    host printer {
        hardware ethernet XX:XX:XX:XX:XX:XX;
        fixed-address 192.168.3.25;
        option subnet-mask 255.255.255.0;
        option routers 192.168.3.1;
    }
}
