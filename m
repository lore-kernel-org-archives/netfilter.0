From: Peteris Krumins <newsgroups@lf.lv>
Subject: REJECT target
Date: Thu, 10 Apr 2003 22:23:29 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43614623471.20030410222329@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
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

Hello netfilter,

 Holy christ, i relied i could REJECT packets in any table, but
 unfortunately after launching the program i was working on i got
 ugly 'iptables: Invalid argument' after executing
 `iptables -A PREROUTING -t mangle .. -j REJECT`

 why cant i put -j REJECT in the PREROUTING chain of mangle table?

 Manual says it makes no sense, but it makes sense for me.
 
 I mark certain packets (-j MARK) in the mangle table, and those
 which are not marked should be REJECTed.
 The only way, i think, i can solve it is using FORWARD and INPUT
 chains of the filter table. Match any not marked packets in these
 chains and REJECT from there. But this adds some extra time (packet
 has to traverse other chain) and i have to duplicate the rules
 (because of putting on both INPUT and FORWARD).

 Is there a patch or smth to this problem, or it cant be done (REJECT
 in mangle)?

 
P.Krumins


