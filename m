From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: I need a clever solution for two Bittorrent machines behind
	afirewall
Date: Thu, 18 Nov 2004 09:33:07 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E395@alderaan.smgtec.com>
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
To: Brad Morgan <B-Morgan@concentric.net>, netfilter@lists.netfilter.org

> Anyone have any suggestions?  Pointers to solutions or other places
> to ask the question will be gladly accepted.

Does your ISP supply more than a single IP? If you do, you could bind
two IP's to the external interface and DNAT them seperately. Beyond
that, you could write a web page to choose who gets the BT ports on the
fly.

The other option that doesn't look like its going to happen would be
writing a Bit torrent CONNTRACK/NAT module. Although, I don't know if
there's enough DNA in the BT request to determine which PC the
connection its destined for. Seems like a good feature for BT Version 2
:-)

