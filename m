From: MOUDARIR Mohamed <moudarir@Richbond.ma>
Subject: MSN throught Linux
Date: Fri, 26 Sep 2003 18:48:34 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14C5057BC852D611BAC400E0299AA10F02042D@MAILSERV>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi
Can we use MSN voice conversation behind a Linux firwall ( redhat ) 
I suppose all iptables rules are in ACCEPT mode
the only the rule that exist is : iptables  -t nat -A POSTROUTING -o
$INET_IFACE -j SNAT --to-source $EXT_IP
This rule is to nat the private Lan


