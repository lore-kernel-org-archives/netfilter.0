From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 19:30:11 +0300
Message-ID: <c6c5895d-145a-3a04-3064-40d42db75be7@gmail.com>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
 <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
 <X8d5JZT5cmBFUvNA@flatwhite> <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
 <X8eKYjtPSINtYYnl@flatwhite> <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
 <X8e8+YL653hAkGe9@flatwhite>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1gsZF56lVP/LtCsYSLlrZPmRNMkGHNqdkWrd4c5wL5U=;
        b=E43pNv2a3VL/0h0l7rdhRnypq/hp9AE631Q0fiilooGHh+WvaDDk1qPq+eGedB2D3/
         V4Ii+VLMos+BXlUXjgMqiOKG9Ev1AyhUliCp9HWNGANCJnToDJ0QD3rjii7LHJP2kIa9
         ucpo8Te94+JRZLH5CMDXaRMDTdaMP6bP87jL2+M50GroB0Gptyw6k3IZwxKZYN7Fl2/g
         Xcy7PhMOvzrGuMsv6wArvdzbfvlifuSifSDRQMEDfmGgAfszjzqfqn3naIuDFDq7Xgqk
         p0RyJAiMWNmFBhCyIjIPEMf5CbARzF7csQ9/n70jDVy4cHcDPizoICs9dD+PY2LKxc5w
         /ihg==
In-Reply-To: <X8e8+YL653hAkGe9@flatwhite>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcin Szewczyk <marcin.szewczyk@wodny.org>, Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

I'm not sure, am I understand you correctly?
But I created testing topology with namespace for multicast routing and 
it worked.

I tested on ubuntu 18.04 but probably works on debian buster too.

install smcroute https://github.com/troglobit/smcroute
apt install smcroute

Get testing tool https://github.com/troglobit/mcjoin
wget 
https://deb.troglobit.com/debian/pool/main/m/mcjoin/mcjoin_2.7_amd64.deb

install tool
apt install ./mcjoin_2.7_amd64.deb

create network namespace
ip netns add client
ip netns add server

create veth interface and assign to the namespace
ip link add name c-eth10 type veth peer name eth0 netns client
ip link add name s-eth10 type veth peer name eth0 netns server

up local veth interface
ip link set dev c-eth10 up
ip link set dev s-eth10 up

Up the namespaces' interfaces
ip netns exec client ip link set dev lo up
ip netns exec client ip link set dev eth0 up
ip netns exec server ip link set dev lo up
ip netns exec server ip link set dev eth0 up

Assing IP address to host veth interfaces
ip addr add 10.0.0.1/24 dev c-eth10 brd +
ip addr add 10.0.1.1/24 dev s-eth10 brd +

assign IP address to namespace interfaces
ip netns exec client ip addr add 10.0.0.2/24 dev eth0 brd +
ip netns exec server ip addr add 10.0.1.2/24 dev eth0 brd +

set default gw in namespaces
ip netns exec client ip route add default via 10.0.0.1
ip netns exec server ip route add default via 10.0.1.1

enable ip forwarding
sysctl -w net.ipv4.ip_forward=1

Prepare multicast routing daemon
cat >> /etc/smcroute.conf <<EOF
mgroup from s-eth10 group 225.1.2.3
mroute from s-eth10 group 225.1.2.3 to c-eth10
EOF

restart service
systemctl restart smcroute

Watch forwarding multicast packetes for interfaces
watch -td -n 1 "cat /proc/net/ip_mr_vif"

or
tcpdump -i c-eth10 -nn multicast -c 10

Open two new terminal

Listen from client namespace
ip netns exec client mcjoin 225.1.2.3 -p 3000

Send multicast packets from server namespace
ip netns exec server mcjoin -t 5 -s 225.1.2.3 -p 3000


read this man page(-t option) for different routing table
ip mrule help
https://manpages.debian.org/buster/smcroute/smcroute.8.en.html#OPTIONS
https://github.com/troglobit/smcroute#multiple-routing-tables

may help you for broadcast relay
http://manpages.ubuntu.com/manpages/trusty/man8/bcrelay.8.html


Fatih USTA

On 2.12.2020 19:12, Marcin Szewczyk wrote:
> On Wed, Dec 02, 2020 at 05:57:25PM +0200, Eliezer Croitor wrote:
>> I have seen a similar "issue" with outgoing traffic generated locally.
>>  From what I understand the diagram:
>> * https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
>>
>> Doesn't talk about locally generated traffic..
> I am quite sure that it is not true.
>
> Take a look at the simplified chart:
> https://stuffphilwrites.com/2014/09/iptables-processing-flowchart/
>
> OUTPUT chains are specifically for locally generated traffic, not the
> forwarded traffic.
>
> Also see:
> https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_hooks
>
>> There is a big difference in the linux kernel routing cache since the time
>> of the test...
> My test is fresh. tcpdump output I pasted was created today.
>
>> If you want to re-produce this issue you can try to use iperf3 instead of
>> iperf.
>> iperf3 -c 224.1.1.1 -u  -b 10k
> I do not use iperf at all. I am using netcat.
>
>> Can you create a test lab using netns ?
>> You can see a fully automated example lab that I wrote at:
>> https://github.com/elico/mwan-nft-lb-example/blob/main/run-lab.sh
>>
>> Or another lab examples can be seen at Vincent blog posts github repository:
>> https://vincent.bernat.ch/en/blog/2018-route-based-vpn-wireguard
> I will take a look later to check if those are relevant.
>
