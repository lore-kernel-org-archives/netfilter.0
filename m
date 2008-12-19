From: sean darcy <seandarcy2@gmail.com>
Subject: can't port forward on multihome
Date: Fri, 19 Dec 2008 15:38:27 -0500
Message-ID: <gih0o4$45n$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a multihomed server: eth0 is a static T1, and eth3 is a Verizon 
dsl line. I want eth3 as the default for general traffic, and eth0 for 
VOIP traffic.

eth1 is the internal interface. eth3 works fine as the masquerade out 
for NAT'd lan.

I've used ip to set up eth0 so I can ssh into it:

## eth0 is static
ETH0_IP_ADDR=www.xxx.yyy.zzz
ip rule add from $ETH0_IP_ADDR/32 table 128 priority 128
## this is the route through the gateway ip
ip route add default via <eth0 gateway ip> table 128


and that works. Which is important since that's the static address; the 
Verizon dsl address is dynamic.

The VOIP server ( asterisk ) is on the lan. I've tried to port forward 
ssh to the voip server:

$IPT -t nat -A PREROUTING  -p tcp --dport 2280 -j DNAT --to 10.10.10.180:22
$IPT -A FORWARD -p tcp --dport 22 -m state --state NEW -d 10.10.10.180 
-j ACCEPT

This works if I ssh to the eth3, the dynamic dsl interface:

ssh -p 2280 voip@<dsl ip address>

I get an ssh session on the voip server.

But:

ssh -p 2280 voip@<static ip address>

doesn't work. But I need to have others access the voip server using a 
static ip, but not give them access to the multihomed server.

AFAICT, the ssh on the voip server never sees anything ( at LogLevel 
DEBUG1 ) if I try over the static interface.

I assume I need some additional ip magic, but I'm clueless as to what's 
needed.

Thanks for any help.

sean

