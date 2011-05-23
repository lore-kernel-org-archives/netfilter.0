From: "cc" <cc@kdtc.net>
Subject: icmp packets
Date: Mon, 23 May 2011 16:23:29 +0800
Message-ID: <20110523081547.M25256@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a 'weird' problem that's most likely attributed to a
bad netfilter rules policy.  

I am trying to ping from an internal machine to an external
site.  

$IPTB -A INPUT -i $INET_IF -p icmp -s $EXT_SITE -j ACCEPT
$IPTB -A OUTPUT -o $INET_IF -p icmp -d $EXT_SITE -j ACCEPT

$IPTB -A FORWARD -i $DMZ_IF -o $INET_IF -p icmp -d $EXT_SITE -j ACCEPT
$IPTB -t nat -A POSTROUTING -o $INET_IF -p icmp -d $EXT_SITE \
              -j SNAT --to-source $INET_IP

Now when I ping from an internal IP, I do not get a response
until the nth icmp_seq, where n > 100 (so far my testing). 
Is there something wrong with the above rules?

Apparently I'm not getting a echo reply until n > 100?  
I feel my understanding of ICMP packets requires some
further expanding.

Thanks

Ed
