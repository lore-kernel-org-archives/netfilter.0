From: Steve Comfort <steve@4Dllc.com>
Subject: TCP SYN FIN
Date: Fri, 02 Jul 2004 14:27:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E554BE.1010402@4Dllc.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi All,

I'm running Nessus to check my firewall rules, and its telling me :

"remote host does not drop TCP SYN packets with the FIN flag set .... "

I've tried adding the following rule :

$ipt -A INPUT -i $iface -d $network -p tcp --tcp-flags SYN,FIN SYN, FIN 
-j DROP

and a few permutations, but the warning still appears.

How do I fix this?

Best regards
Steve


