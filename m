From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Performance of iptables with web proxy
Date: Mon, 17 Jan 2005 01:06:44 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0198E4@pxtvjoexd01.pxt.primeexalia.com>
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
To: Askar <askarali@gmail.com>, DurgaPrasad Adusumalli <adusumallid@gmail.com>
Cc: netfilter@lists.netfilter.org

Read the entire question again...  It has more to do with iptables than
squid.

You probably could do some type of fancy pre/post routing.  What you
would need to do is write a special routing entry that says anything on
port 80 or 443 going out the firewall that is from any IP address other
than the proxy server needs to be routed to the proxy.  I'm not sure how
to do this directly.

But if the proxy server is in the firewall then the rules change.  This
is from the squid site.  This redirects you to another port on the same
server but what you want is

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128

There is another module named tproxy (or something like that) which
sounds like it might do what you want but it might require a kernel
recompile.

HTH

Gary

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Askar
Sent: Sunday, January 16, 2005 11:58 PM
To: DurgaPrasad Adusumalli
Cc: netfilter@lists.netfilter.org
Subject: Re: Performance of iptables with web proxy

wrong list, why not ask in squid mailing list

regards



On Mon, 17 Jan 2005 11:33:07 +0530, DurgaPrasad Adusumalli
<adusumallid@gmail.com> wrote:
> I am using web proxy content filter (Dansguardian) to scan all
> outgoing traffic from my LAN. I am using transparent proxying with an
> iptable rule that forwards all outgoing traffic to web proxy. This
> setup works but all the browsing activity gets slowed down. When I
> configure my browser to use proxy Internet access gets faster.
>=20
> Can someone suggest me how can I enhance the performance of iptables
> with this rule is place and without configuring my browser to use
> proxy.
>=20
> Thanks in advance.
> Durga Prasad.
>=20
>=20


--=20
(after bouncing head on desk for days trying to get mine working, I'll
make
your life a little easier)


