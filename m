From: "Julius Wijaya" <wijayaj@gmx.net>
Subject: ! means on iptables
Date: Sat, 17 May 2003 22:29:32 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305172229320387.009A0DC3@mail.gmx.net>
Reply-To: wijayaj@gmx.net
Content-Type: text/plain; charset="us-ascii"
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
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

iptables rule chain:

iptables -A FORWARD -i eth1 -p tcp \
	   -s ! 172.16.30.185 \
	   -d www.yahoo.com -j DROP

if i am not mistaken that rules means to drop all connection to
www.yahoo.com except from address 172.16.30.185

is this correct?

regards.
JW


