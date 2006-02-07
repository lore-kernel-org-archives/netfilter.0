From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: I don't want the LOG be writed to /var/log/messages
Date: Tue, 7 Feb 2006 07:09:28 +0100
Message-ID: <000101c62bad$0d95de60$0101000a@sterenborg.info>
References: <6ff3e7140602062127u58c56046u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6ff3e7140602062127u58c56046u@mail.gmail.com>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

> I write a line in /etc/syslog.conf:
> kern.=info
> /var/log/iptables
> 
> Now the log of iptables write to /var/log/iptables, but I found that
> the log still write in /var/log/messages, now I have 2 copies of the
> log, how can I stop the write to /var/log/messages, and only write to
> /var/log/iptables? Thanks.

If you want all iptables messages in one file, use ulogd and the ULOG
target.
http://freshmeat.net/projects/ulogd/


Gr,
Rob


