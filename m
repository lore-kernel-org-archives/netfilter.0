From: openbsd shen <openbsd.shen@gmail.com>
Subject: I don't want the LOG be writed to /var/log/messages
Date: Tue, 7 Feb 2006 13:27:57 +0800
Message-ID: <6ff3e7140602062127u58c56046u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter <netfilter@lists.netfilter.org>

I write a line in /etc/syslog.conf:
kern.=3Dinfo                                              /var/log/iptables

Now the log of iptables write to /var/log/iptables, but I found that
the log still write in /var/log/messages, now I have 2 copies of the
log, how can I stop the write to /var/log/messages, and only write to
/var/log/iptables?
Thanks.

