From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt1@systella.fr>
Subject: ROUTE target and --continue
Date: Tue, 22 Feb 2005 11:50:12 +0100
Message-ID: <20050222105012.GA16180@rayleigh.systella.fr>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

	Hello,

	I'm trying to use ROUTE target with SNAT. For me, ROUTE works very
	fine without --continue, but I need to add SNAT. Without SNAT, all
	routed packets come from 192.168.0.130 and they have to come from
	192.168.1.1...

	Without --continue, they are good routed. To do SNAT, I have added
	--continue and I obtain :

Root kant:[/var/lib/iptables] > iptables -t mangle -n -v -L | grep ROUTE
    7   280 ROUTE      tcp  --  *      *       192.168.0.130
	0.0.0.0/0           tcp spts:3000:3001 ROUTE gw:192.168.1.254
	continue

Root kant:[/var/lib/iptables] > iptables -t nat -n -v -L | grep LOG  
    0     0 LOG        tcp  --  *      *       192.168.0.130
	0.0.0.0/0           tcp spts:3000:3001 LOG flags 0 level 4 prefix
	`SNAT : ' 

	Look at "0" on the nat table... And without --continue, I can see my
	packets on eth2 (192.168.1.1). With continue, no one packet... Where
	is the mistake ?

	Regards,

	JKB

