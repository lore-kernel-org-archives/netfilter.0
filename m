From: "Andrew S. Johnson" <andy@asjohnson.com>
Subject: Many not-new hits from port 80 when surfing their site
Date: Mon, 29 Dec 2003 01:11:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312290111.30422.andy@asjohnson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Several times now, I have seen a lot of entries in syslog which
seem to be associated with browsing a particular site, but for
some reason get dropped as "not-new".  For example, when
browsing the thinkgeek site, messages like this appear maybe
50 times, with slightly different destination port numbers:

Dec 29 06:39:45 IPTABLES NOT-NEW-IN: SRC=66.35.250.160 \
     LEN=48 TTL=45 ID=0 DF PROTO=TCP SPT=80 DPT=4785 \
     WINDOW=5840 RES=0x00 ACK SYN URGP=0 

Always from port 80 on the remote machine, but the source
address is a site I'm accessing.  What's causing this, should
I be concerned, and can/should I fix it?  The rules that produce
this is (in iptables-restore format):

-A INPUT -p tcp -m tcp --tcp-flags ! SYN,RST,ACK SYN \
     -m state --state NEW -j LOG --log-prefix "IPTABLES NOT-NEW-IN: "
-A INPUT -p tcp -m tcp --tcp-flags ! SYN,RST,ACK SYN \
     -m state --state NEW -j DROP

If I already have a session open with the remote site, why are
these not being associated?  Any help will be appreciated.

Thanks,

Andy Johnson


