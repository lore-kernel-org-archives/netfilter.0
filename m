From: "Michael P. Brininstool" <mikepb@hoplite.org>
Subject: RE: mac match and FORWARD chain
Date: Mon, 23 Oct 2006 13:34:29 -0600
Message-ID: <00f901c6f6da$45b04080$c84f949b@nasw.ds.army.mil>
References: <20061023162435.GA2441@animx.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061023162435.GA2441@animx.eu.org>
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
To: netfilter@lists.netfilter.org

 I think you are doing this the hard way.  This is what I do and it works
just fine
(MAC's altered, I control eth[0134] via physical access security i.e. locked
room):

===============================================
-A FORWARD -i eth2 -j macchk
...
===============================================
-A macchk -m mac --mac-source 00:xx:xx:xx:8F:FD -j RETURN
...
-A macchk -m mac --mac-source 00:xx:xx:xx:8C:B6 -j RETURN
-A macchk -j logmac
===============================================
-A logmac -j LOG --log-prefix "PACKET_FROM_MAC_DROPPED "
-A logmac -j DROP
===============================================

Remove first line of FORWARD (shown above) to remove the restrictions.

I have a program generate macchk whenever the database of allowed machines
changes.  It does this by removing the reference to macchk in the forward
change, flushing the macchk chain, rebuilding it (with the logmac reference
on the end, and it re-inserts the reference to macchk at beginning of
FORWARD.



