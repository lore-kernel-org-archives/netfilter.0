From: Rob <netfilter@cloudtown.com>
Subject: IPTABLES trouble
Date: Sun, 01 Dec 2002 23:11:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20021201230632.009f1bf0@64.83.193.200>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Attempting to adjust my firewall to allow me to run a

IRC server    and
Counter-Strike server.


Using a premade firewall script called;  rc.firewall-2.4-stronger
line I tried is the following.

UNIVERSE="0.0.0.0/0"
EXTIP="my ip"
EXTIF="eth0"

$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
  -p tcp -s $UNIVERSE -d $EXTIP --dport 6667 -j ACCEPT

or is an IRC server and Counter Strike game server using UDP ?? not tcp?

Thanks,
Rob


