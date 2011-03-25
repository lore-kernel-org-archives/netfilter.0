From: "cc" <cc@kdtc.net>
Subject: netfilter pecularities
Date: Fri, 25 Mar 2011 17:05:01 +0800
Message-ID: <20110325090527.M18530@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a netfilter-based firewall running and recently its behaviour
has been very puzzling (to the point of suspicious).  However, this
can also be attributed to user-error.

Please correct me if I'm wrong here.

I have a filter that forwards (via NAT prerouting) SMTP packets
to my e-mail server behind the firewall.  Here are the
following rules:

$IPT -t nat -A PREROUTING -p tcp -i $INET_IF -d $INET_IP \
           --dport $SMTP -j DNAT --to $DMZ_EM:$SMTP
$IPT -t nat -A PREROUTING -p tcp -i $DMZ_IF -d $INET_IP \
           --dport $SMTP -j DNAT --to $DMZ_EM:$SMTP

$IPT -t nat -A PREROUTING -p tcp -i $DMZ_IF -d $INET_IP \
            -s $LAN_NET --dport $SMTP -j DNAT --to $DMZ_EM:$SMTP

These rules are the only one that has anything to do with
SMTP port forwarding and it doesn't include SNAT as it's
obvious from the rules.  If you can bear with me for a bit.

Now theoretically speaking, if I comment out the above lines,
NONE of the SMTP traffic will be going anywhere, am I correct?

My setup is this.  It's a 2.4.x based netfilter firewall.
(distribution is Slackware).

Now here's where I need a bit of clarification and/or
explanation.  What happens is the following.

If I comment out the aforementioned rules,  the SMTP traffic
still finds its way to the DMZ_EM machine.  (I'm a bit stumped here.)

If I reset the firewall by flushing the rules, the SMTP traffic
still finds its way to the DMZ_EM machine.  

When I run iptables, is it supposed to 'insmod' ip_tables, etc
to the modules list?  Even if it's compiled into the kernel?

Any clarifications appreciated.  

Ed



