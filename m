From: "Ben Prince" <ben@cyberpixels.com>
Subject: Dropping connections
Date: Wed, 24 Dec 2003 23:27:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AZN5M-0004j4-0w@orcrist.cyberpixels.com>
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

Hello All,

I am running Redhat 7.3 and installed iptables from the
iptables-1.2.5-3.i386.rpm found on ftp.redhat.com .  The problem I am having
is that I can't seem to DROP connections at all.

I am using the following syntax

$IPTABLES -A INPUT -s ip.address.he.re -j DROP

Did I just newb something up somewhere?  Any help at all?

Thanks in advance,

Ben Prince
Cyber Pixels
Systems Administrator
ben@cyberpixels.com 


