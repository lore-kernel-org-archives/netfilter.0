From: Torne Wuff <torne-netfilter@wolfpuppy.org.uk>
Subject: MARK and ping packets
Date: Tue, 22 Oct 2002 12:10:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021022111008.GB405@wolfpuppy.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

If I use the MARK target to set a mark on an incoming ping packet, then
the ping reply has source == destination == original ping destination,
i.e. it sends the ping response back to itself, not to the requestor.

This happens with no rules in the filter table at all (other than the
LOG statements), and only a single rule in the mangle table marking all
packets as 0x1.

I have no patches applied - it's a stock 2.4.19 kernel

Any ideas?

Torne

