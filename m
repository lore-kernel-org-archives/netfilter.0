From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: 2 ISPs again
Date: Fri, 10 Dec 2004 11:06:34 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E3A3@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Andreas Grabner <andi@vnc.at>, netfilter@lists.netfilter.org

Andreas Grabner wrote:
> Hi,
> i try to get the following work for days now and realy need some
> hints. My situaution:
> I have 2 independent links to the internet. I would like to get
> connections from the internet to an internal host work, regardless to
> which of my external IP.
> I tried it by marking packets coming in EXTIF1 and set up a own
> routing table for marked packets. But it seems the routing does not
> work bacause teh packets disappear between PREROUTING and FORWARD.
> Please help!

If your own IP's on the firewall aren't bound to the network, you'll
have to disable rp_filtering. echo "0" >
/proc/sys/net/ipv4/eth_whatever/rp_filter

You'll also want to make sure outgoing packets are getting natted
correctly (if you're natting). Routing the reply usually requires
connmark to work properly.


