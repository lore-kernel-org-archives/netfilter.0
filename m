From: Esteban <eribicic@sinectis.com>
Subject: cat ip_conntrack
Date: 28 Feb 2003 03:07:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046412445.804.16.camel@debian>
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

hey,

im always bashing and its not very confortable..
like `cat ip_conntrack  | awk '{print $5}'  | sed s/src=// | sed
s/dst=// | sort -n | uniq -c  | sort -n` ..
bye




