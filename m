From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Pings phenomen :)
Date: Sat, 28 Aug 2004 18:54:21 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512FC@asimail2.alphanumeric.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi
>
>   I have 512/128 adsl. I wonder why, when I download files at full
>   speed, pings to site X are about 2000ms. But when I upload files at
>   full speed, pings to X are about 3000 to 5000ms. Can someone explain
>   this to me from tcp/ip point of view? ;)

it has to do with the relative sizes of input and output queues setup by =
your ISP on their access devices and how uploads prevent the empty ACK =
packets associated with your downloades from getting through, which =
forces the TCP window size to get scaled down to a crawl.  i can't find =
a decent explanation of this at the moment, but you can check out:

	http://lartc.org/wondershaper/

for a solution.  it works like a charm.

-j

