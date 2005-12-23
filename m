From: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Subject: Re[2]: patch-o-matic help
Date: Fri, 23 Dec 2005 10:15:29 +0300
Message-ID: <1222862567.20051223101529@progtech.ru>
References: <20051223044928.31767.qmail@web35912.mail.mud.yahoo.com>
	<20051223065634.87014.qmail@web35913.mail.mud.yahoo.com>
Reply-To: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051223065634.87014.qmail@web35913.mail.mud.yahoo.com>
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

Hello Noman,

Friday, December 23, 2005, 9:56:34 AM, you wrote:

NL> [root@mail iptables-1.3.4]# iptables -A INPUT -p tcp
NL> -m string --string "/bin/sh" -j DROP iptables v1.3.4:
NL> STRING match: You must specify `--algo'
NL> Try `iptables -h' or 'iptables --help' for more
NL> information.

    You can use --algo bm for Boyer-Moore algorithm, or --algo kmp for
    Knuth-Pratt-Morris algorithm.

-- 
Best regards,
 Oleg                            mailto:sysoleg@progtech.ru


