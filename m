From: chad@isolv.net
Subject: broadcasting netbios into a dmz
Date: Mon,  2 Jun 2003 07:23:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054563806.3edb5dde3306b@www.isolv.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I have an interesting problem.  We are trying to forward NetBIOS packets from a 
single host to our dmz, with out much success.  We have our protected network 
on eth1 and the DMZ is attached to eth0.  We have one host that we would like 
to broadcast via both apple talk and NetBIOS, but we don't want to let all 
netbios/appple talk traffic out to the DMZ.  

I came up with the following statements:

$IPT  -A FORWARD -i $localnet -o eth0+ -p udp --sport 137:139 -d 128.59.47.127 -
-dport 137:139 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPT -t nat -A PREROUTING -p udp -s 10.0.0.137 --sport 137:139 -j DNAT --to 
128.59.47.127:137:139

but it doesn't work.  Any ideas?

C  




