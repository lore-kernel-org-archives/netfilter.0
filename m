From: Joel Newkirk <firewalldude@newkirk.us>
Subject: ULOG problem
Date: Fri, 02 Jan 2004 21:22:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073096565.2340.214.camel@alpha.newkirk.us>
Reply-To: firewalldude@newkirk.us
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

Help!  :^)

I've been working with ULOG and ulog-acctd lately on our mailcluster,
and have a problem I simply cannot figure out.

I have the following three rules in a row:

iptables -A FORWARD -i eth1 -p tcp --dport 25 -m state --state NEW -j
ULOG --ulog-cprange 48 --ulog-nlgroup 1 --ulog-prefix "SMTP"
iptables -A FORWARD -i eth1 -p tcp --dport 25 -m state --state NEW -j
BLOCKS
iptables -A FORWARD -i eth1 -p tcp --dport 25 -m state --state NEW -j
ULOG --ulog-cprange 48 --ulog-nlgroup 3 --ulog-prefix "FILT"

ulog-acctd generates a single logfile based on both of these streams of
entries.  (and a third low-traffic one for POP3, ignored for simplicity)

My problem is that from the second ULOG rule above about 90% of the log
entries never get to the logfile.  If I change both to 'nlgroup 1' still
the same.  If I remove the first ULOG rule, then I get (apparently) 100%
of the log entries from the second ULOG rule.

The packet counts in 'iptables -vnxL FORWARD' properly show the numbers
of matching packets (IE, 32k for first ULOG and '-j BLOCKS', then ~18k
for second ULOG, and a summation of matches in the BLOCKS chain total
~14k packets) but it appears that I get all of the log entries from the
first rule, and ~10% of the entries from the second rule.

Traffic levels:  These rules typically see perhaps 35 connections per
second for the first ULOG rule, about 20/second for the second.  While
this can sometimes go much higher, (server throughput averages about 2.5
million SMTP connections daily) the problem exists at low levels like
5-10/second.

Log entries:  The actual log entries being generated consist of "FILT"
or "SMTP" (the designated ulog-prefix above), timestamp, and source IP,
so minimal information is being stored to disk.  (while that storage is
via NFS mount, I switched to local filesystem and ruled out NFS as any
contributor to the problem.)

I have ulog-acctd configured to not queue entries, but to write them
immediately.  Changing this had no effect. (other than to jumble
timestamp sequence slightly...)  I'm certainly not committed to
ulog-acctd if the problem lies there (it seems not, however) but I have
a program structure built around the expectation of the logfile format
being "FILT 1073095001 67.114.249.213", so obviously I'd prefer to
maintain that log format.

Using the kernel syslog with the LOG target is insane, given the
tremendous size the logfiles reach.  250-300 characters per logfile
entry times 2.5 million entries with SMTP prefix, another 1.5 million or
so with FILT prefix, >1gb daily logfile.  ULOG with a 'trimmed' entry
gives me ~125mb logfiles daily, so I can not only manage to analyze the
logfiles in realistic time, I can afford to retain 30 days of gzipped
logs for analysis, a feat that would consume a 30gb partition otherwise.

j

-- 
"Not all those who wander are lost."  - JRR Tolkien


