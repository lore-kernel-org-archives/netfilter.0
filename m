From: "VDMB mail" <conradw@vdmb.com.au>
Subject: Netfilter Denies everything, even --Policy ACCEPT
Date: Sun, 16 May 2004 15:27:07 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <KIEKJEOOGJONEKMFNHLHCELLCHAA.conradw@vdmb.com.au>
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


Hi,

IPTABLES is blocking all network traffic, whilst all connections work fine
without it.

Setup : Redhat 8 / 2.4.18-27.8.0  with HP Raid driver patch. (I hope this is
not a cause of the problem.)

IPtables version v1.2.8

Without iptables, i.e. stopping the service  '/etc/init.d/iptables stop'
everything works and communicates fine. Ping anything on my network, and the
loopback interface just nicely.

When starting the service '/etc/init.d/iptables start' any form of network
communication is totally blocked, even with the following (BUT VERY OPEN)
script;

iptables --flush
iptables --policy INPUT ACCEPT
iptables --policy OUTPUT ACCEPT

iptables -A INPUT -j LOG
iptables -A OUTPUT -j LOG

Have checked services with chkconf, iptables is running, as well as echo, in
fact most things are, although there is no ipchains present(thus no clash).
Have checked ps -aux, syslogd, klogd and xinetd are all running.

Output from 'iptables -L' is;

Chain INPUT(policy ACCEPT)
LOG 	all -- anywhere 	anywhere 	LOG level debug prefix 'Trace INPUT: '
Chain FORWARD(policy DROP)
Chain OUTPUT (policy ACCEPT)
LOG 	all -- anywhere 	anywhere 	LOG level debug prefix 'Trace OUTPUT: '

Output from ping (for any ip address) is;
ping 127.0.0.1
ping: sendmsg: Operation not permitted

Nothing appears in either /var/log/messages or /var/log/kernel (from
syslog.conf  kern.*    /var/log/kernel ). This is the worst part. I can't
see anything happening anywhere. I have a Samba server running, and it is
logging the same sendmsg error for the netbios port(137).

I have searched for hours to solve this, and there appears to be something
stopping packets at the iptables level, as without iptables installed, there
is clear connections everywhere. Even rebooting the machine made no
difference, as much as I expected.

Being a novice, with a few years experience, I have always been able to get
things solved with stuff on the net. This one has really got me beat.

Thanks in advance,
Conrad
---
This email has been checked by a virus scanner, although the end reciever is
responsible for their own scanning and checking of email and attachments.
Outgoing mail is certified Virus Free by Virus scanner.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.668 / Virus Database: 430 - Release Date: 24/04/2004


