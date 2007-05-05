From: Jaap Winius <jwinius@umrk.to>
Subject: Re: Advanced routing problem
Date: Sat, 05 May 2007 21:12:13 +0200
Message-ID: <1178392333.463cd70d4571a@www.umrk.to>
References: <1178377643.463c9daba4959@www.umrk.to> <463CA718.4060509@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <463CA718.4060509@rtij.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Quoting Martijn Lievaart <m@rtij.nl>:

(nice website, interesting hobby)

> That's strange. that means you have some very funny routing. You'd
> better explain how your routing is set up. Also post the output of
> 'ip ro'.

Here's the output from 'ip ro':

196.190.250.17 dev ppp0  proto kernel  scope link  src 63.58.236.234
88.215.195.176/29 dev eth0  proto kernel scope link  src 88.215.195.178
63.58.50.0/25 via 63.58.236.234 dev ppp0  scope link
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.1
192.168.14.0/24 dev eth2  proto kernel  scope link  src 192.168.14.1
192.168.13.0/24 dev eth1  proto kernel  scope link  src 192.168.13.1
10.0.0.0/8 dev eth0  proto kernel  scope link  src 10.0.0.100
default via 88.215.195.177 dev eth0

The route to 63.58.50.0/25 is to make some of that ISP's servers
available, including an SMTP relay that would not be accessible any
other way.

The second routing table, secnet, has only one line:

   default via 63.58.236.234 dev ppp0

The output of 'ip rule' look like this:

   0:      from all lookup local
   1000:   from 63.58.236.234 lookup secnet
   32766:  from all lookup main
   32767:  from all lookup default

Interfaces:

eth0 -- Primary external interface.
     address 88.215.195.178
     netmask 255.255.255.248
     gateway 88.215.195.177

eth0:0 -- Priv. net behind the prim. external interface's ADSL modem.
     address 192.168.1.1
     netmask 255.255.255.0

eth0:1 -- Priv. net behind the sec. external interface's ADSL modem.
     address 10.0.0.100
     netmask 255.0.0.0

eth1 -- Internal segment (UTP)
     address 192.168.13.1
     netmask 255.255.255.0

eth2 -- Internal segment (wireless)
     address 192.168.14.1
     netmask 255.255.255.0

ppp0 -- Secondary external interface.
     address 63.58.236.234
     netmask 255.255.255.255
     P-t-P:  196.190.250.17


A diagram of the network:

                  The
                Internet
               /        \
              /          \
             /            \
            /              \
            |               |
       Sec. |         Prim. |
           ADSL            ADSL    modem
          modem-----------modem   /
                            |    /
                            |   /
                       eth0 |  / ttyS0
            ------------Firewall-------------
           |        eth1        eth2         |
           |                                 |
           |                              Wireless
           |                               Access
           |                               Point
        Ethernet
         switch--------Workstation
           |
           |
        Windows
         Server

The secondary ADSL modem has only one Ethernet interface, while the
firewall (a little Soekris box) has only one interface available for
Internet connectivity. However, the primary ADSL modem has a built-in
Ethernet switch, and since the secondary Internet connection uses PPtP
anyway, I connected it to the primary ADSL modem's switch so that I
could get to it from the firewall.

The secondary ADSL modem is part of a cheap-o consumer subscription
that the client did not want to part with. It was there before I became
responsible for the system, so I thought I might be able to put it to
good use this way -- it gives the remote users an alternative access
route in case the primary external interface goes down.

The primary ADSL modem is part of a business subscription. The ISP
doesn't allow its clients to fiddle with the modem's configuration, so
I wouldn't have recommended it, but this subscription had been
requested by the client before I arrived on the scene. Anyway, I fixed
the situation by asking for a public IP address for the firewall and
was given 87.215.195.176/29, which allows me to bypass their modem.

Did I leave anything out? If so, just ask and I'll post it ASAP.
Thanks very much for your help!

Cheers,

Jaap

