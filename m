From: "Michael K" <micke@klintan.se>
Subject: Portmapping to DC++ client
Date: Mon, 17 Feb 2003 14:19:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c2d687$39e47e00$0200a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I'm trying to make so my DC++ Client can connect using "Active mode"

I have the following rules


modprobe iptable_nat

iptables -t nat -A POSTROUTING -o $externalIF -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

for i in `seq 400 450` ;
do
        iptables -t nat -A PREROUTING -p UDP -i $externalIF -d
$externalIP --dport $i -j DNAT --to 192.168.0.2:$i;
        iptables -t nat -A PREROUTING -p TCP -i $externalIF -d
$externalIP --dport $i -j DNAT --to 192.168.0.2:$i;
done

In DC++ client I have changed the settings to report my "$externalIP"
port "411"

Still I can't connect to other passive DC users. What am I doing wrong?

The iptables counters is counting up on port 411. So something works.
Should I do anything on the POSTROUTING chain?

Thanks

/Klintan



