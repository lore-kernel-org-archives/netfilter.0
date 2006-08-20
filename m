From: "Kelvin Proctor" <Kelvin.Proctor@citect.com>
Subject: RE: possibility to multiply packets?
Date: Sun, 20 Aug 2006 14:53:12 +1000
Message-ID: <DE7AB3268C8CB149ADA35F54287DC68F0652CA98@TEL-MAIL01.citect.com>
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

> Is there any possibility to intentionally (mis)configure
> netfilter to duplicate packets?

Marcus,

I needed to do something a bit crazy like this recently. I was wanting
to get packets to be re-transmitted to multiple interfaces.

I have found the ROUTE target module to be really great for this
purpose.  If you use the --tee option a duplicate of the packet is
create and routed in some manner that you select.

This would certainly be an option.

I was using a Fedora Code 5 box which unfortunately does not have the
ROUTE module patched into the kernel, but in this case patch-o-matic is
your friend.

For more details see:

http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra
-ROUTE

for more information.

Hope this helps,

Kelvin

