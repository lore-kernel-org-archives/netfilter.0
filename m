From: "Manish Jain" <manish.jain@globallogic.com>
Subject: Sometimes SNAT is not working
Date: Mon, 27 Aug 2007 14:05:06 +0530
Message-ID: <A192455967CC5A498A520879D99A5775E30B08@ex2-del1.synapse.com>
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

Hello,

I am using some internal IPs (169.254.x.x) on my box and then performing
SNAT and DNAT from/to this IP to/from actual public IP.

It has been observed that sometimes SNAT does not work and internal IP
exposed to outside world.

Please share your experiences. Whether it has to do with connection
tracking in some way or other?

Best Regards,
Manish Jain

