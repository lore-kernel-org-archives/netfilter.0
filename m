From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Iptables Email Alerting
Date: Mon, 15 Mar 2004 10:08:15 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040315180815.18699.qmail@web40701.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Does anyone know if it is possible to have IPtables
send email alerts 
based on certain traffic?
 
I'm looking for something similair to the -j LOG
option, perhaps a -j MAIL ?

I realize that I could setup a manual cronjob to scan
the logfiles via grep and search for certain
activities, but it would obviously be much better to
have alerts sent in realtime.

Any ideas?



__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

