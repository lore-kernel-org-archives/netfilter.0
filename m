From: Arthur Meyer <arthur.meyer@tbz.ch>
Subject: Re: Transparent proxying using REDIRECT
Date: Thu, 17 Jul 2003 07:28:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307170728.24666.arthur.meyer@tbz.ch>
References: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
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

Hello Mikko

You need to change/add three statements in the squid.conf file:
HTTP-Accel-Host virtual
HTTP-Accel with proxy ON
HTTP-Accel uses Host-Header ON

That should do it
Plus Squid has to be compiled with the directive --enable-linux-netfilter=
 (if=20
you use Linux)

Arthur

On Thursday 17 July 2003 08:24, Mikko Alutoin wrote:
> Hi,
>
> I have a question about transparent proxying. Suppose I have the follow=
ing
> rule in my kernel:
>
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
> The purpose of the rule is that all web traffic is captured by a proxy
> listening to a local port. Now the question:
>
> How does the proxy get to know the original destination IP address and
> port? By looking into the HTTP-request, perhaps? If so, what if the
> application protocol (some other than HTTP) does not contain the
> destination URL?
>
> Cheers,
> Mikko

--=20






