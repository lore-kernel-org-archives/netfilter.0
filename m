From: Erdal Mutlu <emutlu@fonts.de>
Subject: Re: FTP Forwarding
Date: Fri, 22 Nov 2002 12:53:31 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211221138270.21420-100000@bhows40003.fonts.de>
References: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bantam <netfilter@end.yorks.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Hello,

On Fri, 22 Nov 2002, Bantam wrote:

> Hi,
>
> I've been trying to forward port 21 to an ftp server on another machine, IP
> address  10.0.0.199.
>
> eth1 - external (connected to the net)
> eth0 - internal
>
> /sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21 -j ACCEPT
> /sbin/iptables -A PREROUTING -t nat -p tcp -i eth1 --dport 21 -j DNAT --to
> 10.0.0.199:21
>
> but can't get it to work..
>
> any ideas ?
>
> Thanks
>
> Wasim

I think you need to specify -o eth0 in the FORWARD table like this:

/sbin/iptables -A FORWARD -p tcp -i eth1 -o eth0 --dport 21 -j ACCEPT


You will also need:

/sbin/iptables -A FORWARD -p tcp -i eth0 -o eth1 --sport 21 -j ACCEPT

for packets comming from your ftp server.

Generally for FTP connections you will also need to forward port 20, the
ftp data stream.

Is your 10.0.0.199 serving th Internet or is it only local network.
If it is for the Internet, then you need SNAT to a real IP on the
firewall.

I would suggest you to use IP connection tracking instead:

ipt=iptables
GW_IP=your firewall's IP on eth1 (a real IP)

### Enable ESTABLISHED,RELATED connections
$ipt -A FORWARD -i eth1 -o eth0 --match state --state ESTABLISHED,RELATED
--jump ACCEPT

### Enable FTP data
$ipt -A FORWARD -i eth1 -o eth0 -d 10.0.0.199 --dport 20 -m state
--state NEW -j ACCEPT

### Enable FTP
$ipt -A FORWARD -i eth1 -o eth0 -d 10.0.0.199 --dport 21 -m state
--state NEW -j ACCEPT

### DNAT FTP data
$ipt -t nat -A PREROUTING -i eth1 -d $GW_IP --dport 20 -j DNAT
--to-destination 10.0.0.199:20

### DNAT FTP
$ipt -t nat -A PREROUTING -i eth1 -d $GW_IP --dport 21 -j DNAT
--to-destination 10.0.0.199:21

### SNAT
$ipt -t nat -A POSTROUTING -o eth1 -s 10.0.0.199 -j SNAT
--to-source $GW_IP

Hope it helps.


Erdal Mutlu









