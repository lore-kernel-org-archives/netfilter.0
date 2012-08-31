From: <mabra@manfbraun.de>
Subject: IPTABLES:Let external address appear as an internal address
Date: Fri, 31 Aug 2012 13:11:16 +0200
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACcGGLxSfBNPu0OwD65yae8BAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All !

Just this moment, I am completely "destroyed", I am working on iptables
rules and cannot make it work.

[usining debian squeeze, iptables, monit monitoring program].
[eth1: internet==$EXTIF, eth0: local==$INTIF]
[192.168.6.254 ist the LAN port of the firewall at eth0]

The problem is this: The monit daemon is configured to accepts
packtes on the internal address only and I think, this is right.
Usually nearly nothing internal should accepts packets from outside.
The daemon cannot be bind to a specific interface, but just by
ip address and mask. Internally, everything works fine [http requests
from inside 192.168.26.0/24 are working]. To allow to redirect packtes
from outside to this daemon, I wrote this two filters, where the
incoming external trafiic should use port 9995:

$IPTABLES -t nat -A PREROUTING -p tcp -d $EXTADDR --dport 9995 \
-j DNAT --to-destination 192.168.6.254:2812

$IPTABLES -t nat -A POSTROUTING -p tcp -d 192.168.6.254 --dport 2812 \
-j SNAT --to-source 192.168.6.254:3000

The deamon gets accessed, but denies the request, because it's seen
source address is not from the LAN, but the external client ip address.
So my SNAT does not seem to work.

I used the same pair of rules to redirect the traffic to another LAN
machine. Making a tcpdump there shows, that it works. That
tcpdump shows 192.168.6.254:3000 as the source address.

Could someone probably give me some help??

Thanks anyway,
++mabra




