From: "Paul Albert" <palbert@rovingplanet.com>
Subject: Some null MAC addresses
Date: Mon, 11 Nov 2002 11:21:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <661F9268BBA8CB4EB92CC12B8C42F06901F5CD@pluto.rovingplanet.com>
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

Hi -

I'm using kernel 2.4.18 with netfilter 1.2.7a, and I'm having a problem.
I'm writing some code to map MAC addresses to IP addresses using the
QUEUE target and ipq_get_packet(), since our bridge code doesn't put the
entries into the arp table.  I'm seeing the MAC addresses correctly of
most of the nodes on our network, however, several machines are
reporting an IP address of 00:00:00:00:00:00.  Ethereal, when running on
a different machine, shows the correct address.

Any thoughts?

TIA,
Paul

