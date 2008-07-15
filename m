From: Arnaud MARTIN <arnaud@bsa.net.my>
Subject: ebtables brouting of all tcp and udp traffic
Date: Tue, 15 Jul 2008 15:26:21 +0800
Message-ID: <200807151526.21545.arnaud@bsa.net.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have created a bridge on my server and I would like to bridge only the protocols other than tcp and udp. For these protocols I have an application running on the box that is listening in promiscuous mode to catch these packets. 
The application is only interested in the packets not directly destined to the server itself.

I'm using the scrpt below to realize that:

MAC_OF_BR0=<MAC of my bridge>

ebtables -t broute --flush
ebtables -t broute -A BROUTING -d $MAC_OF_BR0 -p ipv4 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp -i eth0 -j DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp -i eth1 -j DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto udp -i eth0 -j DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto udp -i eth1 -j DROP

So far the brouting seems to work but as soon as I run this script, I'm not able to ssh to the server anymore. Also my application running on the server, has to connect to other server in the same configuration but it is not able to do it anymore. This is the reason why I added the 2nd line in the script but it doesn't work.

To sum up I need to broute all udp and tcp traffic, except the traffic destined to the bridge IP/interface.
How can I do it ?
