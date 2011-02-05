From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How can I test my tc script?
Date: Sat, 5 Feb 2011 21:21:51 +0100
Message-ID: <20110205212151.27f217e0@catus>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	<20110203120131.38cd818d@catus>
	<1296827153.3644.7.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296827153.3644.7.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

Hi,

>This method is somewhat complicated but, according to the documentation
>"very worth it". 
>Can someone please explain it a little better, thanks.

Sure... here goes the example:

We want to share 100mbit connection. Internet access is connected to
the router on eth0 and lan in on eth1. We do egress shaping of download
traffic on eth1.

---------------------complete script------------------------------
tc qdisc add dev eth1 root handle 1: htb default 1
tc class add dev eth1 parent 1: classid 1:1 htb rate 100Mbit
tc filter add dev eth1 parent 1:1 prio 11 handle 2: protocol ip \
u32 divisor 256 
tc filter add dev eth1 protocol ip parent 1:1 prio 11 u32 match \
ip dst 0.0.0.0/0 hashkey mask 0x000000ff at 16 link 2:

tc class add dev eth1 parent 1:1 classid 1:400 htb rate 5mbit
tc qdisc add dev eth1 parent 1:400 handle 400: sfq perturb 1
tc filter add dev eth1 protocol ip prio 11 u32 ht 2:46: match ip \
dst 10.5.0.70 flowid 1:400

tc class add dev eth1 parent 1:1 classid 1:401 htb rate 5mbit
tc qdisc add de eth1 parent 1:401 handle 401: sfq perturb 1
tc filter add de0 eth1 protocol ip prio 11 u32 ht 2:a: match ip \
dst 10.5.0.10 flowid 1:401
---------------------------------------------------------------------

Now lets go line by line.

>tc qdisc add dev eth1 root handle 1: htb default 1

add htb qdisc to eth1, direct all unclassified traffic to 1:1 by default

>tc class add dev eth1 parent 1: classid 1:1 htb rate 100Mbit

add main class 1:1 with rate 100mbit; we don't specify ceil, it's
automaticaly set to rate if ommited

>tc filter add dev eth1 parent 1:1 prio 11 handle 2: protocol ip \
>u32 divisor 256 

add hash table with 256 entries (maximal size), table is located at "2:"

>tc filter add dev eth1 protocol ip parent 1:1 prio 11 u32 match \
>ip dst 0.0.0.0/0 hashkey mask 0x000000ff at 16 link 2:

this filter defines how information in ip packet translates to entry in
hash table; 

"u32 match ip dst 0.0.0.0/0" - matches any ip traffic;

"hashkey mask 0x000000ff at 16" - number 16 defines location in ip
header [1] and it's destination IP addres; mask 0x000000ff defines that
we're interested in last octet of the destination ip address; example,
if the packet is directed to 10.0.0.192, then te mask will yild value
192; note: mask returns values in range of 0-255 - it coresponds with
divisor setting in previous rule;

"link 2:" - direct packets to table 2: (added in previous rule);

[1]
http://www.siongboon.com/projects/2006-03-06_serial_communication/IP-Header-v4.png

>tc class add dev eth1 parent 1:1 classid 1:400 htb rate 5mbit

add class fo this client, let if be 1:400;

>tc qdisc add dev eth1 parent 1:400 handle 400: sfq perturb 1

attach sfq qdisc to client's class

>tc filter add dev eth1 protocol ip prio 11 u32 ht 2:46: match ip \
>dst 10.5.0.70 flowid 1:400

add filter that directs traffic to 10.5.0.70 to class 1:400;
interesting parts:

"ht 2:46:" - use hash table 2:, 46 is the last octet of clients ip
address converted from decimal to hexadecimal notation; decimal 70 is
equal 0x46 hexadecimal;

>tc class add dev eth1 parent 1:1 classid 1:401 htb rate 5mbit

add class of second client, let if be 1:401;

>tc qdisc add dev eth1 parent 1:401 handle 401: sfq perturb 1

... sfq

>tc filter add dev eth1 protocol ip prio 11 u32 ht 2:a: match ip \
>dst 10.5.0.10 flowid 1:401

add filter that directs traffic to 10.5.0.10 to class 1:401;
interesting parts:

"ht 2:a:" - use hash table 2:, a is the last octet of clients ip
address converted from decimal to hexadecimal notation; decimal 10 is
equal 0xa hexadecimal;



I hope it'll clear things a bit.

Best regards,
Marek Kierdelewicz
