From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Trying to setup two ethernet cards with two websites
Date: Thu, 2 Jan 2003 10:21:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301021021.07838.netfilter@newkirk.us>
References: <se140b47.055@butchers.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se140b47.055@butchers.com>
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
To: JUSTIN GERRY <JGERRY@butchers.com>, roy@karlsbakk.net
Cc: netfilter@lists.netfilter.org

On Thursday 02 January 2003 09:49 am, JUSTIN GERRY wrote:
> I tried your suggestions below and yes, I finally have two websites
> working on the same box. Simplifying things does indeed work.
>
> Is there a way to, by default drop everything on the output chain, but
> insert a rule to allow only http requests that were initialed by a
> client to either website?
>
> Or if my input rules are sufficient, do I really need to do anything
> on the output chain other than let everthing out?
>
> Thanks,
> Justin

If you trust that nothing on the box is or ever will connect that you=20
don't want to, then output chain can just have an ACCEPT policy.  If you=20
want to lock down to make it harder for a trojan or such to communicate=20
back from the box, you can set a DROP policy, then:

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

will let traffic back out in response to client requests, but not let the=
=20
box initiate any connections.  If this tighter firewall still allows the=20
needed connections, why open up any further?  I'd suggest you might want=20
to log dropped output traffic, though, to see what DOES try to get out. =20
Depending on your usage and plans, you might want to open a few=20
outbounds, like traceroute, ping, CVS, http, or ftp access FROM the box=20
if you want to use these services when logged into the box, for updating=20
software etc.  Of course you can just allow those connections when=20
needed, and the rest of the time go with DROP policy and the EST/REL=20
rule above.

j


