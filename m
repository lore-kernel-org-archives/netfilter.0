From: Payal Rathod <linux@rpayal.cjb.net>
Subject: clearing basics: semi-OT
Date: Thu, 10 Apr 2003 13:36:51 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030410080650.GA1720@linux.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I am trying to clear some of my basics. I am reading IP-Masquerading HOWTO. 
In it these things were mentioned,

UNIVERSE="0.0.0.0/0"
$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

What exactly does 0.0.0.0/0 mean? And why should we be concerned with
it? And what is the use of rule given after it?

INTNET="192.168.1.0/24"
INTIP="192.168.1.1/24"

The first one means the entire network of 192.168.1.x? What exactly is
the second one. Does it just means 192.168.1.1 then why "/24"?
And lastly,

$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j DROP

Why was this rule made? And why was it "dropped"? What is the logic
behind this? Shouldn't it be,
$IPTABLES -P drop-and-log-it DROP


Thanks a lot for the patience and bye.
With warm regards,
-Payal

p.s please make a cc to me too.

-- 
"Visit GNU/Linux Success Stories"
www.geocities.com/rpayal99
Guest-Book Section Updated.

