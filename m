From: =?ISO-8859-1?Q?Martin_K=F6hling?= <mk@lw1.cc-computer.de>
Subject: REJECTing ident requests (was: FTP problems)
Date: Fri, 28 Feb 2003 14:06:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302281404260.9684-100000@lw2.cc-computer.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>

Hi!

> Am Don, 2003-02-27 um 21.23 schrieb Del Winiecki:
> Might be an issue with identd. Many ftp servers do reverse identd lookups on
> the client. If you drop these on your firewall they have to wait for the timeout.
> Reject identd on your firewall:
> iptables -A INPUT -p tcp --dport 113 -j REJECT

Better use "--reject-with tcp-reset".

Quite some time ago, I had strange problems with some (broken?) mail
servers refusing to accept mail when I simply REJECTed ident connects -
apparently they didn't like the default ICMP error message
(icmp-port-unreachable, I think)...

Martin


