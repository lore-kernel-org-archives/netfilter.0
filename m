From: Michael Rash <mbr@cipherdyne.org>
Subject: fwsnort-1.0 release
Date: Sat, 21 Apr 2007 18:20:10 -0400
Message-ID: <20070421222010.GA23691@minastirith>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

fwsnort-1.0 has been released (http://www.cipherdyne.org/fwsnort).  If
you are running fwsnort along with psad, you might want to upgrade
fwsnort.  Here is a blog post that discusses a strategy for using
fwsnort to enhance the performance of snort_inline:

http://michaelrash.blogspot.com/2007/04/kernel-string-matching-and-ips.html

Here is the ChangeLog for the fwsnort-1.0 release:

- Major update to include support for the NFQUEUE and QUEUE targets
  with new command line options --NFQUEUE and --QUEUE.  This changes the
  default LOG target to the NFQUEUE or QUEUE targets instead, and at the
  same time builds a parallel Snort rule set in the
  /etc/fwsnort/snort_rules_queue directory.  Every Snort rule in this
  directory has at least one "content" keyword, which fwsnort uses in
  the resulting iptables policy.  This policy only sends those packets
  to snort_inline via the NFQUEUE or QUEUE target that match a content
  field within some Snort rule.  The end result is that snort_inline
  should run faster because the vast majority of packets (which are not
  malicious) are processed via the Linux kernel without ever having to
  be sent to userspace for analysis.  There is a tradeoff here in terms
  of attack detection; snort_inline does not receive all packets
  associated with a stream, so it cannot detect attacks quite as
  effectively (snort_inline does not have an opportunity to look at
  reassembled buffers).  However, this trade off may be acceptable for
  large sites where performance is more important.
- Bug fix to remove any existing jump rules from the built-in INPUT,
  OUTPUT, and FORWARD chains before creating a new jump rules.  This
  allows the fwsnort.sh script to be executed multiple times without
  creating a new jump rule into the fwsnort chains for each execution.
- Added the -X command line argument to allow fwsnort to delete all of
  the fwsnort chains; this emulates the iptables command line argument
  of the same name.
- Minor output enhancements and bugfixes to give more insight into the
  translation process.  For example, if fwsnort is run in --snort-sid
  mode but is unable to translate the specified signatures, the user is
  notified.  Also, any existing /etc/fwsnort/fwsnort.sh script is not
  archived and erased until fwsnort is actually going to write a new
  one.
- Added sid values to iptables comment match string.
- Bugfix for iptables string match --from and --to values to skip past
  packet headers.  This is an approximation until a new --payload
  option can be added to the string match extension.
- Added a single iptables rule testing API internally within fwsnort;
  this adds a measure of consistency and removes some duplicate code.
- Added fwsnort mailing list at SourceForge.


--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

