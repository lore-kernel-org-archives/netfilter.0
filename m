From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Internal machines can't resolve external addresses
Date: Wed, 12 Jun 2002 07:30:20 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <003801c2120c$eb198160$020aa8c0@matttm9svd8lrh>
References: <001d01c211bd$413cf400$054da8c0@rita>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Michael Hudin <hudin@zoetrope.com>, netfilter@lists.samba.org

There is potentially another solution if you don't want to run your own bind
server.  Add a third nic to your firewall and put these boxes in a DMZ.
Then you can use PREROUTING/DNAT.

Goodluck,
Matt

----- Original Message -----
From: "Michael Hudin" <hudin@zoetrope.com>
To: <netfilter@lists.samba.org>
Sent: Tuesday, June 11, 2002 10:00 PM
Subject: Internal machines can't resolve external addresses


Machines in the outside world, can view my websites fine, but whenever I try
to go to one of them from a machine on my internal network behind the
firewall, neither the domain name nor the IP will resolve.  I also have the
same problem with my mail server and have to use the internal address of the
mail server.  I am going to guess that the best solution to this is to run
some kind of local DNS server on the inside of the firewall which resolves
all my sites internally, but since I don't have a server at my disposal for
it, is there some way around this?  I had the POSTROUTING MASQ line on and
that did allow the internal machines to resolve, but it also hid the
originating address for any outside machine, thus creating a security
disaster.

-michael

*nat
:PREROUTING ACCEPT [241:88600]
:POSTROUTING ACCEPT [0:9862]
:OUTPUT ACCEPT [68:4275]
-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 110 -j
DNAT --to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 25 -j
DNAT --to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.251 -p tcp -m tcp --dport 80 -j
DNAT --to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 80 -j
DNAT --to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 22 -j
DNAT --to-destination 192.168.77.2
-A POSTROUTING -o eth0 -j SNAT --to-source 10.10.10.254
#-A POSTROUTING -o eth1 -j MASQUERADE
COMMIT

*mangle
:PREROUTING ACCEPT [18365:3221456]
:INPUT ACCEPT [10886:760348]
:FORWARD ACCEPT [7269:2438049]
:OUTPUT ACCEPT [8009:752540]
:POSTROUTING ACCEPT [15177:3182145]
COMMIT

*filter
:INPUT ACCEPT [0:229546]
:FORWARD ACCEPT [363:1553786]
:OUTPUT ACCEPT [2:619341]
-A INPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
-A INPUT -p tcp -j ACCEPT
-A INPUT -p esp -j ACCEPT
-A INPUT -p ah -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A FORWARD -i eth1 -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 110 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 25 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 80 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 22 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
-A OUTPUT -p tcp -j ACCEPT
-A OUTPUT -p esp -j ACCEPT
-A OUTPUT -p ah -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
COMMIT





