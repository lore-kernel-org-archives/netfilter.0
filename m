From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Port forward/bounce no external interface
Date: Fri, 06 Feb 2009 22:12:08 +0100
Message-ID: <498CA7A8.1040103@chello.at>
References: <187458.73719.qm@web65516.mail.ac4.yahoo.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <187458.73719.qm@web65516.mail.ac4.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Don Hoover wrote:
> I want to forward all connections on a port to another box on the same internal network.
>
> For instance, I want to forward all traffic on my server:5000 to go anotherbox:9000
>
> I have little experience with iptables, and I am currently not using it at all on this server, so I will need to setup a small iptables configuration from scratch including any required setup before whatever command is needed to do this.
>
> This will all be in the same network and not actually be going across interfaces...the client, server, and otherbox are all located on the same internal network.
>
> I am sure this is probably easy for someone what really knows what they are doing.... AND...I have been reading as much as I can on this, and all the examples I have found via extensive google searching all deal with the apparently much more common case of forwarding incoming connections on a external facing network interface to a different port for a different IP on an internal facing interface, ala firewall router.  And that just does not apply here.  I kinda thought maybe what I wanted was a variation on that and I tried some different things but none of them worked.
>
> Any help?
>   
Hello,

Please try:

iptables -t nat -A PREROUTING -s your-network -d server -p tcp --dport 
-j DNAT --to-destination anotherbox:9000

this should do the forwarding.

now, that your other box does not talk to the original client (as this 
probably wont work), change the source address to the one of your server:

iptables -t nat -A POSTROUTING -d anotherbox -p tcp --dport 9000 -j SNAT 
--to-source server

keep the policy in all chains to ACCEPT as long you test.

after you get it working, get as restrictive as you like.
do not forget to allow the traffic in the FORWARD chain:

iptables -A FORWARD -i iface -o iface -d anotherbox -p tcp --dport 9000 
-j ACCEPT


this should be a good reference for creating your ruleset:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


greets

mart
