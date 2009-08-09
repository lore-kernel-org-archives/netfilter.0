From: Remi Pieternella <remi.pieternella@gmail.com>
Subject: Diverting part of the traffic over a bridged network
Date: Sun, 9 Aug 2009 16:26:27 +0200
Message-ID: <9c567de70908090726s72bb3678j4c24db8f2c89a1ef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=8JheFjGnROqBb4PKpD6sYHPYgPUerxzJU9TKqbN4W2I=;
        b=Ti6Syww/BuyQDhyMp3+QJxl9xYTsZKcsbbJwfHrZjHQiAt8GHdq1F/t4/r2bHvy7OD
         o/FVsZ5cp6J0Polr0R/xjuS0Y+8lf0s3MBJvWviSqvclTzQ3sRkL6HCyxeNsie7gJ4S+
         ke2TjznXZ67inRu017S5xhkDlxxXDMdKf9wiI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi

I'm fairly new to ebtables and netfiltering so I will start by
describing what I would like to achieve.

My setup is rougly the one below:

                /----------br0----------\           rest of computers
192.168.0.x
                |                       |                  |
Music box -----eth1-- xubuntu machine --eth0----------- router
--------> Internet
192.168.0.x     |                   192.168.0.x      192.168.0.1(DHCP server)
                \-----------------------/
                           |
                           | Non local 192.168.0.x traffic
                           |
                           \----> different internet gateway or VPN


On my network I have a music box (Sonos) which needs to be visible on
my 192.168.0.x subnet (other wise my other computers will not be able
find it). But for which I would like to divert all non local to an
external gateway (possibly through a VPN connection)

The bridge now seems to work properly which mean that as soon as my
xubuntu machine (actually a virtual machine) starts the Sonos show up
on the network.

Next step however is to divert the non local traffic to a 2nd gateway.

Judging form what i have read so far I am assuming I will need ebtables for this

I found the following example but am not quite sure whether this
indeed what I need.

http://ebtables.sourceforge.net/examples/example3.html

Any help on the next step is appreciated!

p.s.
below some settings I am currently using

/etc/network/interfaces

----------------------
auto lo
iface lo inet loopback

# Bridge between eth0 and eth1
auto br0
iface br0 inet dhcp

  pre-up ifconfig eth0 down
  pre-up ifconfig eth1 down
  pre-up brctl addbr br0
  pre-up brctl addif br0 eth0
  pre-up brctl addif br0 eth1
  pre-up ifconfig eth0 0.0.0.0
  pre-up ifconfig eth1 0.0.0.0
  post-down ifconfig eth0 down
  post-down ifconfig eth1 down
  post-down ifconfig br0 down
  post-down brctl delif br0 eth0
  post-down brctl delif br0 eth1
  post-down brctl delbr br0
--------------------------------

I currently also have shorewall setup but basically this has been
setup to allow everything
(I was planning to tighten things up once i have got things working)

/etc/shorewall/policy
-------------------------
#SOURCE        DEST        POLICY        LOG LEVEL    LIMIT:BURST

loc        net        ACCEPT
loc        $FW        ACCEPT
loc        all        ACCEPT

$FW        net        ACCEPT
$FW        loc        ACCEPT
$FW        all        ACCEPT

net        $FW        ACCEPT
net        loc        ACCEPT
net        all        ACCEPT

all        all        ACCEPT
----------------------------------


Also I used to have masquerading setup
/etc/shorewall/masq
---------------------------

#INTERFACE        SOURCE        ADDRESS        PROTO    PORT(S)    IPSEC    MARK
eth0                    eth1
--------------------------

I guess I don't need this anymore since I have since setup the bridge
to bridge the traffic form eth1 to eth0 (i.s.o. routing it)
