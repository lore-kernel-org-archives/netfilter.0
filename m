From: Johan Cimen <c99jcn@cs.umu.se>
Subject: Logging issue!
Date: Sun, 28 Dec 2003 12:41:04 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.58.0312281236220.12664@peppar.cs.umu.se>
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
To: netfilter@lists.netfilter.org


Hi!

I want to log incomming packets at PREROUTING. Packets destinated to a
specific port on my box and with UDP protocol. Informations within those
packets that I am interested of is TOS and TTL fields.

I have been looking at ulog-acctd using the ULOG target in iptables, but
this daemon does not logg TOS and TTL.

Using LOG target in iptables will logg my packets among other syslog
information. Isn't it correct? I want a seperate file for my loggs.

I have also been looking at syslogd, but this seems to be complicated.

Is there a way that I can logg information using LOG/ULOG target to a
specific file, where there will only be my selected information that I
later can grep?

-Johan-


