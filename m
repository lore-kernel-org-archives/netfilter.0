From: "Paul Albert" <palbert@rovingplanet.com>
Subject: iptables and 802.1q tagging
Date: Tue, 27 May 2003 11:22:44 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <661F9268BBA8CB4EB92CC12B8C42F06901F63B@pluto.rovingplanet.com>
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

I'm using a box with 2 network interfaces as a bridge with iptables.  I
was attempting to send packets that were 802.1Q tagged to the QUEUE
target and didn't see them as expected.  After checking out my
configuration, it seemed that everything was working as expected (I
fully expected something to be incorrect).

I googled to determine whether an iptables bridge that is filtering on
IP addresses would be smart enough to pick up on the fact that the
packets have 802.1Q tags or not.  No definitive answer was found.  My
question is just that - does iptables notice that the tag is present or
will it not know what to do with such a packet?

Thanks,
Paul

