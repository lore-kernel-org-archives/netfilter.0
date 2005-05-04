From: BJ Premore <bj-netfilter@renesys.com>
Subject: changing packet length?
Date: Wed, 4 May 2005 09:34:55 -0400
Message-ID: <20050504133455.GA12527@tigris.renesys.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everyone.  I've been pulling my hair out lately, using
netfilter/ipq to try to add options to the TCP headers of
outgoing packets.  However, even just adding 4 bytes of
no-op options results in subsequent incoming packets (via
ipq_get_packet) looking mangled.  (After adding the options,
all appropriate fields were updated--checksums, length
fields, etc.  Also, I was extremely carefully to follow the
specifications for adding the TCP options, proper padding,
etc., etc.  I'm pretty sure my problems do not have to do
with the formatting of the packet.)

So my hopefully simple question is, can packet sizes be
changed and then reinjected using ipq_set_verdict?  I found
one reference that seemed to suggest that modified packets
had to stay the same size.  I've tested modifying packets
without changing their overall byte sizes, and that does in
fact seem to work (Eg, I changed the TTL field.).

If the answer to the above question is 'yes', then I'll
provide more details in the follow-up, in hopes of getting
to the bottom of my troubles.

Thanks in advance,

-bj

BJ Premore

