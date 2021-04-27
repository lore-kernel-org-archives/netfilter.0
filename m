From: "Quentin, Lars" <lars.quentin@stud.uni-goettingen.de>
Subject: Why is it impossible to DNAT 127.0.0.0/8?
Date: Tue, 27 Apr 2021 07:04:54 +0000
Message-ID: <4da21aab607c40b08c3e1343ca003244@stud.uni-goettingen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hey,

For the last few days I tried to DNAT a port on localhost to a local VM living inside a virtual bridge network.
I got it working using the external IP with a OUTPUT rule in the NAT table, as it can't be done via PREROUTING:
`iptables -t nat -A OUTPUT -p tcp --dport 8080 -d <MY_IP> -j DNAT --to-destination 192.168.1.2:80`
which allows me to `curl <MY_IP>:8080`.

I'd expect that it `curl localhost:8080` would work with something like this:
`iptables -t nat -A OUTPUT -p tcp -o lo --dport 8080 -d localhost -j DNAT --to-destination 192.168.1.2:80`
but this just results in packages getting stuck.

After reading a lot I found [1] which tries to define it as a feature to conform the RFCs 5735/1700/1812.
Is this really the only reason or is it technically impossible due to sth like the limitations of `lo` since it is not a real device?
I feel way to much of a novice to navigate the kernel source.

Cheers
Lars Quentin

[1]: https://serverfault.com/questions/363899/iptables-dnat-from-loopback


