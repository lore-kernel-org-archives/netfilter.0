From: Hilko Bengen <bengen@vdst-ka.inka.de>
Subject: ulog-acctd 0.3.0 released
Date: Tue, 17 Dec 2002 04:56:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87n0n5uwl0.fsf@ataraxia.hilluzination.de>
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


The 0.3.0 version of ulog-acctd has been released.

ulog-acctd is a userspace network accounting daemon which generates
log files of network traffic for accounting purposes. It collects
headers of IP packets that travel through the Linux 2.4+ netfilter. It
writes accounting information to a log which can include protocol
type, source and destination address, port numbers, byte and packet
count, and incoming and outgoing interfaces.

Changes: Logging of local user ID (for TCP connections) and MAC
address have been added. It is now possible to include formatted dates
in the log file and to specify a PID file.

Homepage: http://savannah.nongnu.org/projects/ulog-acctd/

-Hilko

