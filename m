From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Strange behaviour
Date: Tue, 10 Dec 2002 10:18:30 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF5721E.80806@inbox.lv>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NETFILTER <netfilter@lists.netfilter.org>

hi all,

i noticed a peculiar behaviour as in the /var/log/syslog

Dec 10 09:24:58 ICG kernel: vs-500: unknown uniqueness 1073741824
Dec 10 09:24:58 ICG last message repeated 3 times

this happens when i start squid & then give iptables command for 
transparent proxy...

our is slackware 8.1, kernel 2.4.19 squid 2-5s1 & iptables 1-2s7a.
im not sure but is it a kernel related problem ?.. the number, shown in 
syslog (1073741824) is _ALWAYS_ the same...

any ideas or do you forsea any majour problem ?

thanking in advance ...
A.H


