From: Jan Kanty Palus <atler@poczta.onet.pl>
Subject: DNAT + user defined chains
Date: Fri, 5 Mar 2004 18:00:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040305170028.GA7730@palus>
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

My firewall configuration consist of many rules which redirect some ports
on my server to particular hosts in lan. I wanted to reduce them so I tried
to do something like this:

iptables -t nat -N new
iptables -t -A PREROUTING -i ethX -p tcp --dport <port>:<port> -j new

and in chain 'new' redirect port to right machine. The problem is that in 
chain 'new' i have no option '--to-destination'. Is it possible to do 
this or where can i find some info about it?

