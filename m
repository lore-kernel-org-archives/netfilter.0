From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Differentiating direct, and redirected access?
Date: Mon, 18 Oct 2004 10:40:39 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9C05825@asimail2.alphanumeric.com>
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

> -t nat -A PREROUTING -i eth0 -d ! $INT_ROUTER_IP -p tcp --dport 80 -j
> REDIRECT --to-ports 3128
> -A INPUT -i eth0 -d $INT_ROUTER_IP -p tcp --dport 3128 -J REJECT
>
> TCP SYN have external ip dst_ip.

the TCP SYN to port 80 has the dst IP of the web server on the internet.

the redirected packet to TCP port 3128 has the dst IP of the redirected
interface (eth0 in this case).

your suggested REJECT rule will reject all redirected traffic to port
3128, and is essentially the issue the OP had already run into, and was
asking for a work-around.

-j

