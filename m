From: "Paul Clark" <paul@xmill.com>
Subject: REDIRECT after SNAT?
Date: Fri, 23 May 2003 18:06:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EIEMLBOIBLCDHIEMFNPCCENKCDAA.paul@xmill.com>
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

Is there any way to force a REDIRECT to (e.g.) a local Web server _after_
SNAT has been done?  I have a Truly Evil Scheme to map VLANs to SNAT address
ranges, and I want it to work with a transparent proxy -on the same device-
(I'm pretty sure it would work fine split across two devices).

The problem is that the SNAT has to happen in nat:POSTROUTING, and REDIRECTs
have to happen in nat:PREROUTING - so by the time my Evil SNAT Hackery has
happened, it's too late to force it to the local machine.

Is there such a thing as a 'retry this packet from the beginning' target?

Thanks in advance

Paul



