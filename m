From: Eric Marchionni <mailing-lists@gmx.ch>
Subject: portforwarding
Date: Tue, 06 May 2003 01:32:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB6F495.7090900@gmx.ch>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi list

my buddie is trying to get his webserver working behind his 
debian router.
this is what i gave him (we tried once with --dport and once with 
--dports):

iptables -t nat -A PREROUTING -i $WAN_IFACE -p tcp -m multiport 
--dports 22,80 -j DNAT --to-destination $SERVER

i'm not able to connect to his webserver with http://his_ip/
what am i doing false? got any ideas?

thanx
eric


