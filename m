From: "Paul " <lists@loudas.com>
Subject: A haunting problem
Date: Thu, 25 Nov 2004 15:40:21 +1300
Message-ID: <20041125015806.19EB36E7@mail.loudas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I've got a problem that I have ignored for a month or 3 :-)

 

I have 2 ISP connection, with load balancing.

 

here's some routing stuff:

rama-kandra root # ip route show

202.37.230.64/26 dev eth2  proto kernel  scope link  src 202.37.230.93

192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.1

203.96.216.0/24 via 203.96.212.1 dev eth3  proto static  src 203.96.213.73

203.96.212.0/23 dev eth3  proto kernel  scope link  src 203.96.213.73

172.30.0.0/20 dev eth1  proto kernel  scope link  src 172.30.7.4

127.0.0.0/8 via 127.0.0.1 dev lo  scope link

rama-kandra root #cat /etc/init.d/multi_routes 

        ebegin "Starting MultiPATH routes ..."

 

        /sbin/ip rule add prio 50 table main

 

        /sbin/ip rule add prio 201 from 202.37.230.64/26 table 201

        /sbin/ip route add default via 202.37.230.65 dev eth2 \

                src 202.37.230.93 proto static table 201

 

        /sbin/ip route append prohibit default table 201 metric 1 proto
static

 

        /sbin/ip rule add prio 202 from 203.96.212.0/23 table 202

        /sbin/ip route add default via 203.96.212.1 dev eth3 \

                src 203.96.213.73 proto static table 202

 

        /sbin/ip route append prohibit default table 202 metric 1 proto
static

        /sbin/ip route add 203.96.216.0/24 via 203.96.212.1 dev eth3 \

                src 203.96.213.73 proto static

 

        /sbin/ip rule add prio 222 table 222

        /sbin/ip route add default table 222 proto static \

                nexthop via 202.37.230.65 dev eth2 \

                nexthop via 203.96.212.1 dev eth3

 

from inside the Lan everything works perfectly.

I can surf the net which load balances across eth2 and eth3

I can cruise around a private network eth1 (172.x.x.x)

I have forwarded some ports from eth2 to 192.168.1.x and it responds
perfectly

I have forwarded some ports from eth3 to 192.168.1.x and it responds
perfectly

 

example: telnet 203.96.213.73 80

example: telnet 202.37.230.93 80

 

and the request is answered using the correct interface.

 

On the same router I have configured raccoon (kernel 2.6 obviously)

 

rama-kandra root # cat /etc/racoon/racoon.conf

path include "/etc/racoon";

 

path pre_shared_key "/etc/racoon/psk.txt";

 

path certificate "/etc/cert";

 

padding

{

        maximum_length 20;      # maximum padding length.

        randomize off;          # enable randomize length.

        strict_check off;       # enable strict check.

        exclusive_tail off;     # extract last one octet.

}

 

# if no listen directive is specified, racoon will listen to all

# available interface addresses.

#listen

#{

        #isakmp ::1 [7000];

        #isakmp 202.37.230.93 [500];

        #admin [7002];          # administrative's port by kmpstat.

        #strict_address;        # required all addresses must be bound.

#}

 

# Specification of default various timer.

timer

{

        # These value can be changed per remote node.

        counter 5;              # maximum trying count to send.

        interval 20 sec;        # maximum interval to resend.

        persend 1;              # the number of packets per a send.

 

        # timer for waiting to complete each phase.

        phase1 30 sec;

        phase2 15 sec;

}

 

remote anonymous

{

        exchange_mode aggressive;

        doi ipsec_doi;

        generate_policy on;

        passive on;

        lifetime time 24 hour;

        #my_identifier user_fqdn "REMOVED";

        peers_identifier user_fqdn "REMOVED";

        verify_identifier on;

        proposal_check obey;

 

        proposal {

                encryption_algorithm 3des;

                hash_algorithm sha1;

                authentication_method pre_shared_key;

                dh_group modp1024;

        }

}

 

sainfo anonymous

{

        lifetime time 12 hour;

        encryption_algorithm 3des;

        authentication_algorithm hmac_md5;

        compression_algorithm deflate;

}

 

now here's my problem.

if I try to ipsec in from the big bad world, sometimes the router responds
on the correct interface, sometimes it doesn't

if I shutdown one interface (ifdown eth3) and ipsec into eth2 everything
works 100% :-)

if I shutdown the other interface (ifdown eth2 && ifup eth3) and ipsec into

eth3 everything works 100% :-)

if I start both interfaces (ifup eth && ifup eth3) sometimes it works,
sometimes it doesn't :-(

 

My guess is that it has something to do with connection tracking in the
kernel, but I'm not sure.

I'm hoping that you uber network guru's might be able to shed some light on
how I can achieve what I want.

 

I want to be able to ipsec into either device (eth2 or eth3) and have all
the traffic passed through the correct interface.

 

any help . please :-)

 

Paul.

P.S. I've posted this to the Shorewall list (because I'm using Shorewall)
and Tome recommended I post it here.

 

