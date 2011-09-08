From: Marco Coda <marco.coda7@gmail.com>
Subject: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 8 Sep 2011 09:44:35 +0200
Message-ID: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=POjmw3kAQ3k+fJCEY1PyE4fWCJpYW7hUpGYzR6+SW0g=;
        b=v6tiDK1yXFQHd5RpUyypqYEYS4GGaaKFsnwInfFp7m9tNoRC3U9qTQ1vL8OWKeugHd
         VlB75G9azZqibNOF2qaxlmZYjXKOiVJb8e1s6DXpbttIABrptb2ktQwehm/2yxenyDu2
         N9uqzF3QIkk80BTiZCB3H+4x2gppacqAUA5TI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list!

I'm optimizing a mail server (postfix+cyrus) and I want to limit the
maximum outbound bandwith of the port 25 only, for not saturate all
the bandwith of the office.
For example, here we have 2 Mb in upload. I want to leave to the server 1 Mb max

Reading the LARTC and other articles on the web I tried some filtering
with tc command and they actually work, but they do no respect my
policies: if I write 10kbit the maximum speed is 48x (costant) fast!
480kbps instaead of 10kbps

Here there is the script I ran:
############################################################################
# path of iptables
IPTABLES=/sbin/iptables
# ethernet interface that I want to limit
nic=eth0
# Port I want to limit
port=25
# Maximum upload limit...
upload=10
# ...and relative unit
unit=kbit
# Maximum LAN speed (we have 100Mb switch so..)
maxspeed=100Mbit
# weight of the limit...
weight=1
# ...and relative unit
unit2=kbit

tc qdisc del dev $nic root && iptables -t mangle -F
$IPTABLES -t mangle -A OUTPUT -p tcp --sport $port -j MARK --set-mark 1
tc qdisc add dev $nic root handle 10: cbq bandwidth $maxspeed avpkt 1000 mpu 64
tc class add dev $nic parent 10:0 classid 10:1 cbq rate $upload$unit
weight $weight$unit2 allot 1514 prio 1 avpkt 1000 bounded
tc filter add dev $nic parent 10:0 protocol ip handle 1 fw flowid 10:1
######################################################################################

I tried also with the u32 filter, instead of iptables + handle fw, but
with the same speed moltiplicative constant:

################################################################################
tc qdisc del dev $nic root && iptables -t mangle -F
$IPTABLES -t mangle -A OUTPUT -p tcp --sport $port -j MARK --set-mark 1
tc qdisc add dev $nic root handle 10: cbq bandwidth $maxspeedt avpkt 1000 mpu 64
tc filter add dev $nic protocol ip parent 10: prio 1 u32 match ip
sport $port 0xffff flowid 10:1
#################################################################################

For calculating the real speed I use the "size" value (in bytes) that
I find in postfix's log, then I convert in bits and I divide for the
number of seconds between the connection and the disconnection of the
mail client.

Any ideas for resolving the problem?
