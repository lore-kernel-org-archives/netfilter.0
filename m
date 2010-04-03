From: Jeetu Golani <jeetu.golani@gmail.com>
Subject: Re: VLAN et iptables
Date: Sat, 3 Apr 2010 13:28:16 +0530
Message-ID: <201004031328.16411.jeetu.golani@gmail.com>
References: <201004030927.53528.jeetu.golani@gmail.com> <20100403080147.04d1add3@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=cCHSo+TQ2aEKPBzpLIDYEkyGwviuMxgZKr0t0XehlCk=;
        b=CEO+gB288/wINzcl7Q/o3+zPWEdVr2cg8Ew+aGvSETmVdaiLDHZNBJOLZPEIGud5f6
         92xrmCrpZ5iaMnsIo00nqafIEM0QqCO9uKQOiQ+z/EatTiykowoXzT/5XHimaAYIcKjp
         9/mifczqVGxLm1Bk/3sPhxlGVZ3aA2wNMJWyc=
In-Reply-To: <20100403080147.04d1add3@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org, elko <elko@clevertrace.com>, Arun Khan <arun.khan@silverarc.biz>, Erle Pereira <biz@erlepereira.com>

Hi Elko / Marek,

Thank you so much for replying back.

I've pasted down below the ifconfig output and the routing table at the router 
in the head office.

The routers can ping each other, they can also ping their respective PE's. The 
router at the head office, where we have the iptables script, can ping both 
the VPN PE and the gateway for the public IP.

Furthermore if all we have are the following rules, the HO LAN 192.168.0.0 
can reach the public gateway and surf the internet, the remote locations 
can't:

iptables -A FORWARD -i $EXTIF -o $INTIF1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF1 -o $EXTIF -j ACCEPT
iptables -A FORWARD -i $EXTIF -o $INTIF2 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF2 -o $EXTIF -j ACCEPT

iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

With the script I had posted earlier none of the locations can reach the 
public gateway.

Truly appreciate all the help.

Regards,
Jeetu
http://www.ebrain.in 
- An open (GPL) platform to discover and run software off someone in the 
meshed network pool and use it on your own device.

twitter:  @0topcat0 and @ebrainpool
 


--------------------------------
ifconfig output:

eth0      Link encap:Ethernet  HWaddr 00:27:0e:16:e1:a5  
          inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::227:eff:fe16:e1a5/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:482754 errors:0 dropped:0 overruns:0 frame:0
          TX packets:743399 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:38759551 (36.9 MiB)  TX bytes:1024701055 (977.2 MiB)
          Interrupt:27 Base address:0xe000 

eth1      Link encap:Ethernet  HWaddr 00:e0:1c:3b:a0:c1  
          inet6 addr: fe80::2e0:1cff:fe3b:a0c1/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1750085 errors:0 dropped:0 overruns:0 frame:0
          TX packets:623003 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:1103786909 (1.0 GiB)  TX bytes:48633230 (46.3 MiB)
          Interrupt:21 Base address:0x6000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:157 errors:0 dropped:0 overruns:0 frame:0
          TX packets:157 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:17134 (16.7 KiB)  TX bytes:17134 (16.7 KiB)

vlan105   Link encap:Ethernet  HWaddr 00:e0:1c:3b:a0:c1  
          inet addr:10.235.122.158  Bcast:10.235.122.159  
Mask:255.255.255.252
          inet6 addr: fe80::2e0:1cff:fe3b:a0c1/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:68906 errors:0 dropped:0 overruns:0 frame:0
          TX packets:68917 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:3445300 (3.2 MiB)  TX bytes:3170595 (3.0 MiB)

#public IP
vlan689   Link encap:Ethernet  HWaddr 00:e0:1c:3b:a0:c1  
          inet addr: a.b.c.d  Bcast:a.b.c.(d+1)  Mask:255.255.255.252
          inet6 addr: fe80::2e0:1cff:fe3b:a0c1/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:826133 errors:0 dropped:0 overruns:0 frame:0
          TX packets:554080 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:1022440202 (975.0 MiB)  TX bytes:42842359 (40.8 MiB)
------------------------------------------------------------------

Kernel IP routing table:

Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.235.122.186  0.0.0.0         255.255.255.255 UH    0      0        0 
vlan105
10.235.122.94   0.0.0.0         255.255.255.255 UH    0      0        0 
vlan105
a.b.c.16  0.0.0.0         255.255.255.252 U     0      0        0 vlan689
10.235.122.156  0.0.0.0         255.255.255.252 U     0      0        0 
vlan105
192.168.1.0     10.235.122.94   255.255.255.0   UG    0      0        0 
vlan105
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
172.16.0.0      10.235.122.186  255.255.0.0     UG    0      0        0 
vlan105
0.0.0.0         a.b.c.17  0.0.0.0         UG    0      0        0 vlan689



On Saturday 03 April 2010, Marek Kierdelewicz wrote:
> > Hi,
> 
> Hi Jeetu,
> 
> >I have a Debian system that I am trying to configure as a router for a
> >Network Description:
> >At the head office, the ISP facing router has two physical NICs (eth0
> >and eth1).
> 
> Your script looks good. It's probably on purpose but in current setup
> you won't be able to reach one private subnet from another.
> 
> Just to be sure - if you want the box to act as a router for subnets
> 192.168.1.0/24 and 172.16.0.0/16 then you need ip addresses from these
> subnets on vlan105 interface.
> 
> Regards,
> Marek
> 

