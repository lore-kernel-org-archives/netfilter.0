From: "Dhyanesh Ramaiya" <dhyanesh@intafrica.com>
Subject: iplimit
Date: Sat, 31 Jan 2004 07:17:32 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MDBBKGIIDBFKOMNNKBCDIEOCCAAA.dhyanesh@intafrica.com>
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

Dear all,

I am having difficulties in getting iplimit to work. I have iptables 1.2.7a
and kernel 2.4.20. iplimit is compiled in the kernel. However, whenever I
try to run the rule below it gives the error "iptables: No
chain/target/match by that name":

iptables -A INPUT -p tcp --syn --destination 1.2.3.4 --dport 80 -j DROP -m
iplimit --iplimit-above 4

Please advise off the mailing list as temporarily I have disabled to receive
Netfilter's member posts.

Thank you very much.

Dhyanesh Ramaiya
dhyanesh@intafrica.com



