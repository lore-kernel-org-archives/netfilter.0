From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: h.323 firewall
Date: Thu, 14 Nov 2002 21:18:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20021114211658.02688eb8@of23sm3>
References: <000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: vincent blondel <vincent.blondel@chello.be>, netfilter@lists.netfilter.org

Hi

Try take a look at http://linux-igd.sourceforge.net/ - it works for me. And 
also surf the achives for today and yesterday, since this topic also was 
discussed earlier today.


/Rasmus

At 19:18 14-11-2002 +0100, vincent blondel wrote:
>Hi,
>
>I want to implement in our organisation a complete video conferencing
>infrastructure but I am completely novice
>in this matter. I read a lot of documentation these last days but there are
>some points that stay not clear.
>
>As you can see it above, we want to open domains DEV1 and DEV2 to the net
>for h.323 traffic.
>
>The current situation incorporates :
>
>           10.66.0.xxx
>      +---------------+
>      | SMC7008BR |
>      +---------------+
>           10.66.1.xxx
>                    DEV2
>                 |           |
>   +---------+-+   +--+--------+
>   | slack 8.0 |   | Slack 8.0 |
>   +-----------+   +-----------+
>                       192.168.0.xxx   +-----+       10.66.0.xxx
>                                              | pp0 |  +---------------+
>                                              +--+--+  |   switch      |
>                                                  |       +---------------+
>                                                  |         DMZ
>                                                  +-------+  +-------------+
>                                                  |  NS2  |   | NS1
>|
>                       10.66.0.xxx          |  HTTP2| | HTT1        |
>                  +---------------+         +-------+  | FTP           +--ISP
>                  |  SMC7008BR|                        | SMTP       |
>                  +---------------+                        +-------------+
>                   192.168.0.xxx                            192.168.0.xxx
>                      DEV1
>                   |            |
>  +-----------+-+      +-+---------+
>  |   linux         | .... |    w2k      |
>  +-------------+      +-----------+
>   GnomeMeeting         NetMeeting
>
>- a firewall iptables on NS1 and NS2
>- communcication with the net is passing through our DMZ zone
>- DMZ integrates 2 servers linux slackware 8.0 / kernel 2.4.18 /
>patch-o-matic-20020825 / iptables 1.2.7a
>- DMZ is configured with nat feature for traffic between DEV1/DEV2 and the
>net
>- DEV1/DEV2 includes some 15 users with webcams and/or H323 compliant
>equipment.
>
>So the problems I encounter are the following :
>
>- As all I could see on the net, all config examples represent configuration
>with one client using h.323 protocol
>
>   #! /bin/bash
>   EXTERNAL_IF=eth0
>   EXTERNAL_IP=mon.ip.pub.lic
>   PCA_HOST=mon.ip.pri.vee
>
>   $IPTABLES=/usr/local/sbin/iptables
>
>   /sbin/modprobe -a -k -s -v ip_nat_h323
>
>   logger -s "H323 Ports"
>   H323_PORTS="389 522 1503 1720 1731 8080"
>   for PORT in $H323_PORTS; do
>   $IPTABLES -t nat -A PREROUTING -i $EXTERNAL_IF -p tcp -d $EXTERNAL_IP \
>   --dport $PORT -m state --state NEW,ESTABLISHED,RELATED \
>   -j DNAT --to-destination $PCA_HOST -v
>   done
>
>   logger -s "H323 Ports"
>   H323_PORTS="389 522 1503 1720 1731 8080"
>   for PORT in $H323_PORTS; do
>   $IPTABLES -t nat -A PREROUTING -i $EXTERNAL_IF -p udp -d $EXTERNAL_IP \
>   --dport $PORT -m state --state NEW,ESTABLISHED,RELATED \
>   -j DNAT --to-destination $PCA_HOST -v
>
>   ... I found above iptables config example but problem for me is I have 15
>users and not one
>
>- I have installed iptables/NAT on my DMZ servers but I remarked some
>clients as GnomeMeeting 0.94 are full NAT compliant
>   ... so what does it mean, that my linux clients will have some troubles
>because I use two products producing NAT
>   ... capabilities ??? and what about Ms Netmeeting and ip_nat_h323 ???
>
>- I patched my kernels 2.4.18 with patch-o-matic-20020825 to use ip_nat_h323
>   ... ok but is this module a solution for me to redirect h.323 traffic
>between
>   ...     internet          --> 10.66.0.xxx --> 192.168.0.xxx
>   ...     internet          --> 10.66.0.xxx --> 10.66.1.xxx
>   ...     192.168.0.xxx --> 10.66.0.xxx --> internet
>   ...     10.66.1.xxx     --> 10.66.0.xxx --> internet
>
>   but the problem is I have concurrent connections .
>
>- I read yesterday that it is possible to concentrate h.323 connections on a
>gatekeeper as OpenH323 Gatekeeper
>   ... do you think I have to use a gatekeeper with iptables ???
>
>So maybe you can find my questions stupid or without any sense but I repeat
>it I got no experience with this.
>
>So, with information I received I imagine to impelement my h.323
>infrastructure as mentionned below.
>
>- configuring iptables on NS1 (10.66.0.1) with the script mentionned above
>and replacing PCA_HOST with ip adress of NS2 (10.66.0.2)
>- installing OpenH323 gatekeeper on NS2 (10.66.0.2)
>- configuring all clients with gatekeeper NS2 (10.66.0.2).
>
>So, thanks for any comment, remark, experience, suggestions and/or
>corrections on what I mentionned above.
>Thanks in advance.
>
>Vincent


