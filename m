From: "Peter S. Mazinger" <ps.m@gmx.net>
Subject: iptables-1.3.4/5 and 2.4.32
Date: Fri, 7 Apr 2006 18:28:35 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0604071821200.18645-100000@lnx.bridge.intra>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello!

I am running 2.4.32 kernel w/ pom patches applied (tried the last pom-ng 
that has the 2.4 related files, also combined this w/ the newer pom-ng by 
replacing the old files w/ the new ones). Independently of the pom-ng 
version, if I use iptables-1.3.3 my rules (mainly NAT and some incoming 
filters) work, but iptables-1.3.4 and 1.3.5 work only for about 10 
minutes, then the firewall begans to drop packages weirdly, nothing shows
up in the logs and the natting breaks within 15 minutes (forward chain 
does not forward anymore), the input/output chains work.

I haven't found any related messages, but it seems that the newer iptables 
concentrate on 2.6 series, even pom was stripped to add only what is 
missing from 2.6.

Should this be interpreted as "2.4 is not supported anymore, stick w/ 
1.3.3"?

Thanks, Peter

P.S. Please CC me.

-- 
Peter S. Mazinger <ps dot m at gmx dot net>           ID: 0xA5F059F2
Key fingerprint = 92A4 31E1 56BC 3D5A 2D08  BB6E C389 975E A5F0 59F2



