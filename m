From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: custom redirector
Date: Fri, 13 Aug 2004 02:02:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408130202.02247.Antony@Soft-Solutions.co.uk>
References: <200408121158.17197.spidyno@yahoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408121158.17197.spidyno@yahoo.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thursday 12 August 2004 5:58 pm, Nicol=E1s Vel=E1squez O. wrote:

> Hello there,
>
> I want to do some custom redirection rules, I've searched the web with
> no success.
>
> What I want to do is to set the forward policy a redirect.

You can only set the default policy of a chain to ACCEPT or DROP.

> Here is what I was trying without success:
> $IPTABLES -t nat -N MY_REDIRECTOR_POLICY
> $IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p TCP --dport 80 -j
> MY_REDIRECTOR_POLICY --to-port 81
> $IPTABLES -A MY_REDIRECTOR_POLICY -j REDIRECT --to-port 81
> $IPTABLES -A FORWARD -j MY_REDIRECTOR_POLICY
>
> That snip would go at the end of the rules. so it will work like a
> policy.

Yes, that would work in the same way as a default policy, agreed.

However, the REDIRECT target is only valid in the net table, therefore yo=
ur=20
third rule above needs a "-t nat" in it.

The first rule doesn't need "-t nat" because you are creating a chain, an=
d=20
user-defined chains contain all tables as standard.

I don't understand why you don't simply write the second rule as "iptable=
s  -t=20
nat -A PREROUTING -i $LAN_IFACE -p TCP --dport 80 -j REDIRECT --to 81"

If you keep in mind that REDIRECT has to happen in the PREROUTING chain, =
which=20
is before the FORWARD chain, you should be able to sort things out.

Regards,

Antony.

--=20
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of t=
hese
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


