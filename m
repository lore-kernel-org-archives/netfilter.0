From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables, DNAT, and SMTP
Date: Sat, 3 Mar 2007 04:04:01 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703030403120.23714@yvahk01.tjqt.qr>
References: <1832A25C-5FC3-4F24-B55A-C6069A71CD5D@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1832A25C-5FC3-4F24-B55A-C6069A71CD5D@gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brandon Seaver <brandon.seaver@gmail.com>
Cc: netfilter@lists.netfilter.org


On Mar 1 2007 15:41, Brandon Seaver wrote:
>
> Hello,
>
> I've been reading for a couple days now and my mind has gone numb.
>
> I'm hoping to get some help from the community, and I'm sure I'm just
> overlooking something simple. My goal is to forward smtp traffic destined for
> one machine to another based on source.
>
> I have done this: echo 1 > /proc/sys/net/ipv4/ip_forward
>
> I've enabled the loading of iptable_nat in the iptables config file.
>
> This is the base of what I'm using in my /etc/sysconfig/iptables file. Any
> direction on what I'm missing would be greatly appreciated.
>
> *filter
> : INPUT ACCEPT [0:0]
> : FORWARD ACCEPT [0:0]
> : OUTPUT ACCEPT [52442:19228811]
> COMMIT
> *mangle
> : PREROUTING ACCEPT [60986:54771131]
> : INPUT ACCEPT [60982:54770891]
> : FORWARD ACCEPT [0:0]
> : OUTPUT ACCEPT [52445:19228943]
> : POSTROUTING ACCEPT [52445:19228943]
> COMMIT
> *nat
> :PREROUTING ACCEPT [1581:83538]
> -A PREROUTING -s xxx.xxx.66.0/24 -i eth0 -p tcp -d xxx.xxx.64.3 --dport 25 -j
> DNAT --to-destination xxx.xxx.65.15:25
> : POSTROUTING ACCEPT [74:4438]
> : OUTPUT ACCEPT [525:34512]
> COMMIT

Please show us the output of `ip a` and `ip r`.


Jan
-- 

