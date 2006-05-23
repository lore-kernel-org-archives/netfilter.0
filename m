From: "Padraig Houlahan" <pjh@lowell.edu>
Subject: precedence and redundancy questions re ACCEPT vs NEW
Date: Tue, 23 May 2006 16:58:30 -0700
Message-ID: <4473a1a6.109.4e72.1299307770@lowell.edu>
Reply-To: pjh@lowell.edu
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Greetings:

If my firewall receives a packet from 1.2.3.4, which rule
accepts it?

-A INPUT -s 1.2.3.4                       -j ACCEPT
-A INPUT -s 1.2.3.4 -m state --state NEW  -j ACCEPT
-A INPUT -s 1.2.3.4 -p TCP   --syn        -j ACCEPT      

Does it matter if the packet is the first of a new
connection?

Are these lines redundant in the sense they will all allow a
first connection packet through?

Are rules #2 and #3 the same?

Regards,

PH

++++++++++++
Padraig Houlahan
IT Manager
Lowell Observatory
Flagstaff, AZ
928-774-3358 x 214

