From: Guillaume Vachon <gvachon@infoglobe.ca>
Subject: iptables + 2 isp + dnat problem
Date: Wed, 10 Mar 2010 16:09:50 -0500
Message-ID: <1268255390.15912.109.camel@gvachon-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all, 

I have a Centos5.4 that act as a firewall. I have 2 isp and 3 different
lan. Everything is working fine using 1 isp. 

Now this is the first time i configure a second isp on a firewall. Here
is what i did. (eth4 is my second isp, eth5 my first)

In /etc/iproute2/rt_tables i added :
201	videotron1
202	videotron2

In /etc/sysconfig/network-script :
cat route-eth4
default via 69.x.x.17 dev eth4 table videotron2 
add 69.x.x.16/29 dev eth4 src 69.x.x.19 table 202

cat route-eth5
default via 69.x.x.229 dev eth5 table 201
add 69.x.x.229/32 dev eth5 src 69.x.x.230 table 201

cat rule-eth4 
from 69.x.x.16/29 table 202
fwmark 1 table 202

cat rule-eth5
from 69.x.x.230/32 table 201

My default gw being eth5


With that configured and the proper iptables modification i can now ssh
on that box from the internet using either my isp1 or isp2 (being eth4
or eth5)

So that work fine so far. 

Now the point that i dont understant is this. How can i dnat incoming
traffic on my second isp to a lan server? For example. Im iptables i
added this :
-t nat -A PREROUTING -d 69.x.x.18 -p tcp -m tcp --dport 22 -j DNAT
--to-destination 10.10.200.11:22

Now the traffic gets in my firewall on eth5 that send it localy to
10.10.200.11 but when the traffic comes back to the firewall it does not
try to get out using my second isp but the first one. I know i can mark
packet to solve this. But i dont know how to do it. Should i mark all
traffic that come in using second isp with a mark so that it can exist
through that interface?

Thanks in advance
And i am sorry if i did a bad explanation!

Guillaume Vachon



