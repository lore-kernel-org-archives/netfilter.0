From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Bridge with iptables
Date: Thu, 3 Apr 2003 10:24:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304031024.03315.netfilter@newkirk.us>
References: <071f01c2f9ef$86489980$13fcc5cb@Housecall>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <071f01c2f9ef$86489980$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>, netfilter@lists.samba.org

On Thursday 03 April 2003 09:44 am, hare ram wrote:
> Hi
>
> iam trying to setup a bridge with iptable
> i have setup the transparent bridge,
>
> and iam try to mark the http packets for QOS
> iam not able to see the packets
>
> i was going through the Lartc.org
> some where i read at this stage ( kernel 2.4.18-27 Redhat iam using)
> bridge will not support iptables.
> it will support only on kernel 2.5, is this true
>
> if false, where can i get the right documentation which help me to
> setup bridge with packet filtering

It is possible to patch the 2.4.x kernel.  Then you select "802.1d=20
Ethernet Bridging" and "netfilter (firewalling) support" when=20
configuring the kernel.

You need to download the br-nf patch and patch the kernel source with it.=
 =20
It is available at:
http://bridge.sourceforge.net/

The file you are looking for is:
http://bridge.sourceforge.net/devel/bridge-nf/bridge-nf-0.0.7-against-2.4=
=2E19.diff

The documentation I successfully followed to build a transparent=20
filtering bridge with a 2.4.x kernel is:
http://www.think-future.de/DOCUMENTATION/Ethernet-Bridge-netfilter-HOWTO/

I browsed other documents, and found another well-written one that=20
covered the initial steps well, but when I tried to bring the bridge=20
interface up using those instructions it failed.  The above link's=20
approach worked painlessly, and it took about 25 minutes from download=20
to a working filtering bridge, which now sits between an ISP and the=20
internet.

j


