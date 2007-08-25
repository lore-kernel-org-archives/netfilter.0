From: "Gary W. Smith" <gary@primeexalia.com>
Subject: netfilter optimization.
Date: Sat, 25 Aug 2007 10:38:46 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B7@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

I'm looking for some firewall tweaking advice.  We have a dedicated
firewall which hit ran out of conntrack slots recently.  We had already
tweaked the number max_conntracks to 131072. That box was an RHEL 4 box.
We are building a new firewall, based on 2.6.22.  Reading some older
docs, they mention that if you can, set conntrack_buckets to the same as
conntack_max, if memory permits.  This box has plenty 512mb.  In the
sample reference doc, it says that you can do about 1048576 at a cost of
about 300mb of ram.  This is fine.

Since this is a dedicated firewall box, with only ssh, cron, smartd and
sysstat running on it, what would you recommend the settings to be?  And
what is the best way to set these (/etc/sysctl.conf)?

Playing around I found that I can set nf_conntrack_max to the value, but
when I set nf_conntrack_buckets to the same I get permission denied.
nf_conntrack_buckets is set to 4096, which if I read the documentation
correctly, would slow down the link list parsing as it would have to
refer to the conntrack list more often.


