From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to set multi network ip forward ( prerouting )
Date: Sun, 24 Nov 2002 19:24:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211241924.50958.netfilter@newkirk.us>
References: <20021122074712.28320.qmail@email.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021122074712.28320.qmail@email.com>
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
To: Joe Yu <decade_joe@email.com>, netfilter@lists.netfilter.org

On Friday 22 November 2002 02:47 am, Joe Yu wrote:
> Sorry Sir,
>
> I have multi network
> Net A : 10.128.0.0/255.255.0.0
> Net B : 10.129.0.0/255.255.0.0
> Net C : 10.129.0.0/255.255.0.0
> Net D : 10.131.0.0/255.255.0.0
> Net E : 10.138.0.0/255.255.0.0
> Net F : 10.192.0.0/255.255.0.0
> Net G : 10.192.0.0/255.255.0.0
> Net H : 10.64.0.0/255.255.0.0
>
> I want to set "iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 =
-s
> -d < Net A,B,C,D,E,F,G,H > -j REDIRECT 8080
>
> How to type multi network setting command

Either individual rules for each subnet, or (if acceptable) a single rule=
 =20
specifying 10.0.0.0/8, for instance, to catch ALL 10.x.x.x.  (this presum=
es=20
that you want this redirect for ALL, or that you handle non-redirected=20
subnets earlier in the chain than this)

If the catch-all isn't useful for you, then set up something like this:

iptables -n httpredirect
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j subnettest
iptables -A httpredirect -s 10.128.0.0/16 -j REDIRECT 8080
iptables -A httpredirect -s 10.129.0.0/16 -j REDIRECT 8080

This will group all the subnet tests together in a separate user-defined =
chain=20
(named for it's function, for simplicity) for easier bookkeeping and acce=
ss. =20
Anything not explicitly covered in subnettest would then return to PREROU=
TING=20
and continue through the main chain.  (unless you finish the subnettest c=
hain=20
with a DROP or ACCEPT or something to catch)

BTW, is it a typo, or are subnets B&C and subnets F&G really the same?

j


