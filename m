From: kako@zhnet.hu
Subject: other conntrack question
Date: Mon, 28 Aug 2006 14:28:34 +0200 (CEST)
Message-ID: <2165.192.168.150.209.1156768114.squirrel@www.zhnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

hi,
do anybody know what could be the problem with this command?
conntrack -D conntrack -u UNREPLIED
answers:
conntrack v1.00beta2: Illegal option `-u' with this command
Try `conntrack -h' or 'conntrack --help' for more information.

the message is the same with any other state parameter like ASSURED
mentioned by the manpage etc.

