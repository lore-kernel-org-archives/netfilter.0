From: Peteris Krumins <newsgroups@lf.lv>
Subject: Match bits
Date: Sun, 30 Mar 2003 21:23:24 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <115493390628.20030330212324@lf.lv>
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

Hello,

 Is there a way to match single bit (two bits, byte etc.) in a packet using iptables?
 (without queuing to userspace)

 For example i'd like to match bit 41 in IP packet - reserved flag.
 or if bits 42 and 43 both are not set..

 
P.Krumins


