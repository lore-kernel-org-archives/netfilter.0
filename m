From: pfy <david@ife.ee.ethz.ch>
Subject: problems in tcp connection tracking
Date: Wed, 2 Oct 2002 21:40:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021002194011.GB16386@firestorm.zhadum.ch>
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

hi
there sems to be a bug in tcp connection tracking: if a
connection does NOT close with a RST, then the state of the
connection rests ESTABLISHED. So if you put a rule up like this
on a attacker machine:
iptables -A OUTPUT --dst <victim> -p tcp --tcp-flags ALL, RST  -j DROP
and then connection flood the victim, the connection track table
will overflow and connection tracking will fail. This can be
used as DOS against server who uses the state match.

Sample Code is available:
http://zhadum.ch/david/cdos.tgz



-- 
-----------------------------------------------
+++ath0  --- Don't quote me --- +++ath0
Bofh excuse 9/424
The cause of the problem is:
hardware stress fractures
-----------------------------------------------

