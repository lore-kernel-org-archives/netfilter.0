From: dhiraj.2.bhuyan@bt.com
Subject: RE: clearing basics: semi-OT
Date: Thu, 10 Apr 2003 15:17:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E0926877A@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: linux@rpayal.cjb.net, netfilter@lists.netfilter.org

Answers inline -

> Hi,
> I am trying to clear some of my basics. I am reading IP-Masquerading
HOWTO. 
> In it these things were mentioned,

> UNIVERSE="0.0.0.0/0"
> $IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

> What exactly does 0.0.0.0/0 mean? And why should we be concerned with

sending 0.0.0.0 is a standard way of asking for a dhcp address. 


> it? And what is the use of rule given after it?

read iptables manpage (-i interface -s source -d destination)

> INTNET="192.168.1.0/24"
> INTIP="192.168.1.1/24"

> The first one means the entire network of 192.168.1.x? What exactly is
> the second one. Does it just means 192.168.1.1 then why "/24"?

192.168.1.0/24 is the subnet (/24 is the subnet mast - can also be
represented by 255.255.255.0)
similarly the 192.168.1.1/24

> And lastly,

> $IPTABLES -N drop-and-log-it
> $IPTABLES -A drop-and-log-it -j DROP

-N adds a new chain
-A appends a rule

> Why was this rule made? And why was it "dropped"? What is the logic
> behind this? Shouldn't it be,
> $IPTABLES -P drop-and-log-it DROP

Can't see any logic unless you show how this chain is hooked to the default
chains.


> Thanks a lot for the patience and bye.
> With warm regards,
> -Payal

> p.s please make a cc to me too.


dhiraj

