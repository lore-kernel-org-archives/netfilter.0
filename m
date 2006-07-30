From: switcher <switcher@linuxwall.info>
Subject: match 'account' in iptables 1.3.5
Date: Sun, 30 Jul 2006 23:32:24 +0200
Message-ID: <20060730233224.lmywd5qty7eog88k@webmail.microgate.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello,

i'm trying to use -m account with a 2.6.17.3 kernel and the last snapshot of
iptables but it doesn't work :

# iptables -m account --help
iptables: match `account' v1.3.3 (I'm v1.3.5-20060729).

the account lib is still the older version (installed with my debian testing)
# ls -al /lib/iptables/libipt_account.so
-rw-r--r-- 1 root root 4316 2005-08-07 00:05 /lib/iptables/libipt_account.so

how can i use the last version of account ? (published in june 2006)


Regards,

julien



-- 

www.linuxwall.info


