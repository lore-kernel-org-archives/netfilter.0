From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Logging src/dst ip ftp
Date: 19 Jul 2004 10:10:01 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090212001.2721.14.camel@joel.d2visp.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Dear all,

Again with some doughts and want to implement on iptables.

I have redhat 9.0 working as a gateway. around 80 to 90 users connect
uses this server.
lets say 10.0.0.2 is the client user.
For this we just take ftp protocol.

I want to keep a soft copy of 10.0.0.2 ip about his ftp connection.

10.0.0.2 ---ftp out ---> some internet ftp site.
10.0.0.2 ---ftp in <<<-----some internet friend.

I want to keep track of this things so that no users can say me that i
havent use ftp service ..or i havent use internet connection.


Any ideas about this. Anyone here have implemented this ?

Joel n.solanki
Systems Administrator
D2V ISP PVT LTD.




