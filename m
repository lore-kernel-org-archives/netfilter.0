From: "Paul Albert" <palbert@rovingplanet.com>
Subject: Seeing all packets
Date: Tue, 17 Jun 2003 14:38:55 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <661F9268BBA8CB4EB92CC12B8C42F06901F64D@pluto.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hi -=20

I'm trying to do some firewalling on every packet that goes through our
firewall.  We're doing our filtering in the PREROUTING chain (not
recommended, I realize), because we must do our firewalling to determine
whether we need to NAT a request.  There are times when the NAT
PREROUTING chain is bypassed, and I'm not exactly sure why.  The docs
say that "it will be bypassed in certain cases," however I cannot
determine what these cases are.

Why are the packets getting sent past the NAT PREROUTING chain?
Is there a way to send all of the data through this chain?

Regards,
Paul

