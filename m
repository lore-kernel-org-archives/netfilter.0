From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: Please, see this firewall and say (have pity...:)
Date: Thu, 10 Jun 2004 09:55:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040610095503.521ce916.leslie.polzer@gmx.net>
References: <BAY1-DAV32gyeG6Hbit000332cc@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-DAV32gyeG6Hbit000332cc@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 10 Jun 2004 01:36:28 -0300
"Ricardo C" <racham@hotmail.com> wrote:

> You could give me your opinions????
I don't have enough time to comment on all of this, but using loops increases
readability, so

$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4661 -j DNAT --to-destination 192.168.111.2:4661
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4662 -j DNAT --to-destination 192.168.111.2:4662
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4711 -j DNAT --to-destination 192.168.111.2:4711
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4000 -j DNAT --to-destination 192.168.111.2:4000
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4665 -j DNAT --to-destination 192.168.111.2:4665
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4672 -j DNAT --to-destination 192.168.111.2:4672

should become

for port in 4661 4662 4711 4000 4665 4672; do
    $IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport $port -j DNAT
        --to-destination 192.168.111.2
done

Apply this to other apt locations in your firewall script as well.


Kind regards,

Leslie

