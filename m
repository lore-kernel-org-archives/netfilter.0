From: sillysausage <sillysausage@privatedemail.net>
Subject: Re: Creating a LAN only null routed network (no access to internet)
Date: Sun, 16 Aug 2015 00:02:13 +0930
Message-ID: <55CF4D6D.5040106@privatedemail.net>
References: <55CB462D.6040203@privatedemail.net>
 <55CC2DD4.6090706@privatedemail.net> <20150813023139.3d91a82d@playground>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150813023139.3d91a82d@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> It does turn out I will need to buy myself a managed switch at
> some point and use VLANs instead of virtual interfaces if I want
> to assign IP addresses in this range. Virtual interfaces such
> as eth0:3 (192.168.3.1) currently have the same broadcast as eth0
> (192.168.1.1) which would mean this will never work:

> What happens if you don't use virtual IFs? That is, use multiple
> primary addresses:

> ip addr add 192.168.1.1/24 dev eth0
> ip addr add 192.168.2.1/24 dev eth0
> ip addr add 192.168.3.1/24 dev eth0

> The system determines the correct broadcast address to use based
> on the source address. With correct primary CIDR addresses, you
> don't need to specify the broadcast address at all.

> Or does this make your routing impossible to achieve?

No it's possible. I miss-configured the DHCP server turns out you can
correctly configure it over virtual interfaces but they all need to
be a part of the same group.

Ie:

authoritative;
ddns-update-style interim;

shared-network home {
    # Subnet for regular nodes that require direct Internet access
    subnet 192.168.1.0 netmask 255.255.255.0 {
        range 192.168.1.10 192.168.1.240;
        default-lease-time 259200;
        max-lease-time 518400;
        option subnet-mask 255.255.255.0;
        option broadcast-address 192.168.1.255;
        option routers 192.168.1.1;
        option ntp-servers 192.168.1.1;
        option domain-name-servers 192.168.1.1;
        allow unknown-clients;

        host Gaming_Computer {
            hardware ethernet XX:XX:XX:XX:XX:XX;
            fixed-address 192.168.1.20;
            option subnet-mask 255.255.255.0;
            option routers 192.168.1.1;
        }
    }

    # Subnet for regular nodes that require VPN access
    subnet 192.168.2.0 netmask 255.255.255.0 {
        range 192.168.2.10 192.168.2.240;
        default-lease-time 259200;
        max-lease-time 518400;
        option subnet-mask 255.255.255.0;
        option broadcast-address 192.168.1.255;
        option routers 192.168.2.1;
        option ntp-servers 192.168.2.1;
        option domain-name-servers 192.168.1.1;
        ignore unknown-clients;

        host Linux_Workstation {
            hardware ethernet YY:YY:YY:YY:YY:YY;
            fixed-address 192.168.2.20;
            option subnet-mask 255.255.255.0;
            option routers 192.168.2.1;
        }
    }

    # Subnet for regular nodes that require no Internet access
    subnet 192.168.3.0 netmask 255.255.255.0 {
        range 192.168.3.10 192.168.3.240;
        default-lease-time 259200;
        max-lease-time 518400;
        option subnet-mask 255.255.255.0;
        option broadcast-address 192.168.1.255;
        option routers 192.168.3.1;
        option ntp-servers 192.168.3.1;
        option domain-name-servers 192.168.1.1;
        ignore unknown-clients;

        host printer {
            hardware ethernet ZZ:ZZ:ZZ:ZZ:ZZ:ZZ;
            fixed-address 192.168.3.9;
            option subnet-mask 255.255.255.0;
            option routers 192.168.3.1;
        }
    }
}

The rest of it was documented here:

http://wiki.alpinelinux.org/wiki/Linux_Router_with_VPN_on_a_Raspberry_Pi#Creating_a_LAN_only_Subnet

I used iptables to filter the subnet.
