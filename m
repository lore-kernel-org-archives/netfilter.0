From: Andrew Brooks <arb@sat.dundee.ac.uk>
Subject: REJECT sends more than just RST?
Date: Thu, 06 Nov 2003 12:54:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FAA4480.2D98@sat.dundee.ac.uk>
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

I'm trying to reject SMTP connections by sending a RST but it
seems to be sending SYN ACK before sending RST which isn't what
I want.  I'm using shorewall 1.2.8 and kernel 2.4.18.  Is this
a known problem, and, if so, which release fixes it?

Thanks,

Andrew.

