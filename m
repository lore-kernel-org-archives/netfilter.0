From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 08 Sep 2011 11:14:11 +0200
Message-ID: <4E688763.2060209@freemail.hu>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Coda <marco.coda7@gmail.com>
Cc: netfilter@vger.kernel.org

Hi!

> For example, here we have 2 Mb in upload. I want to leave to the server 1 Mb max
>
>

> Here there is the script I ran:
> ############################################################################
> # path of iptables
> IPTABLES=/sbin/iptables
> # ethernet interface that I want to limit
> nic=eth0
> # Port I want to limit
> port=25
> # Maximum upload limit...
> upload=10
> # ...and relative unit
> unit=kbit
Or: upload='1Mbit'
> # Maximum LAN speed (we have 100Mb switch so..)
> maxspeed=100Mbit
I would set: bandwidth='2Mbit'
> # weight of the limit...
> weight=1
Not really needed...
> # ...and relative unit
> unit2=kbit
>
> tc qdisc del dev $nic root&&  iptables -t mangle -F
> $IPTABLES -t mangle -A OUTPUT -p tcp --sport $port -j MARK --set-mark 1
$IPTABLES -t mangle -A OUTPUT -p tcp -o $nic --sport $port -j MARK 
--set-mark 1
> tc qdisc add dev $nic root handle 10: cbq bandwidth $maxspeed avpkt 1000 mpu 64
tc qdisc add dev $nic root handle 1:0 cbq bandwidth $bandwidth avpkt 
1000 mpu 64
> tc class add dev $nic parent 10:0 classid 10:1 cbq rate $upload$unit
> weight $weight$unit2 allot 1514 prio 1 avpkt 1000 bounded
tc class add dev $nic parent 1:0 classid 1:1 cbq rate $upload allot 1514 
prio 1 avpkt 1000 bounded isolated
# Check if you need isolated.... man tc-cbq

> tc filter add dev $nic parent 10:0 protocol ip handle 1 fw flowid 10:1
tc filter add dev $nic parent 1:0 ip handle fw flowid 1:1


Swifty

