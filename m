From: "test" <psycho@farah.net.lb>
Subject: route marking pzckets in the mangle  FORWARD table
Date: Wed, 19 May 2004 14:03:44 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c43d90$f3eeb970$1101000a@accounting>
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

Good Day .....
I have a question regarding marked packets in the FORWARD mangle
table.......


suppose i have .......

iptables -A FORWARD -t mangle -i eth1 -p tcp --dport 1863 -j MARK --set-mark
0x1

then if i do :
ip ru add fwmark 0x1 table 1
ip ro add default via w.x.y.z table 1
and my default gw is a.b.c.d ..... packets will continue to go through
a.b.c.d .....
it seems that only routing decisions  takes place only in PREROUTING mangle
table for marked packets ......


Regards !!!!!
__________________________________________________________________ Faysal
Banna ICQ#: 213953617 Current ICQ status: + More ways to contact me Get ICQ!
__________________________________________________________________


