From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Marking and Mangling for QoS
Date: Mon, 25 Nov 2002 08:50:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211250850.00977.netfilter@newkirk.us>
References: <B5D7C6B6D020D511838A0060082D4CC90299BBF7@kheops.sigma.fr>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B5D7C6B6D020D511838A0060082D4CC90299BBF7@kheops.sigma.fr>
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
To: COUSIN Marc <mcousin@sigma.fr>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Monday 25 November 2002 05:24 am, COUSIN Marc wrote:
> Hi,
> I'm having trouve using mangling on NATed packets:

> # For the NAT
> iptables -t nat -A PREROUTING -p tcp --destination-port 8081:8090 -j DN=
AT
> --to-destination 89.131.0.7:8080
> iptables -t nat -A POSTROUTING -p tcp --destination 89.131.0.7 -j SNAT
> --to-source 89.131.0.58
> # For the marks
> iptables -A PREROUTING -t mangle -p tcp --destination-port 8081 -j MARK
> --set-mark 10
> iptables -A POSTROUTING -t mangle -p tcp --source-port 8081 -j MARK
> --set-mark 11 # Trying to match the return NATed packet
>
>
> The --set-mark 10 works (no surprise, very simple rule in fact)
> the --set-mark 11 doesn't match. It may be normal, as I'm trying to mat=
ch a
> return packet on a NAT connexion. How am I supposed to match the return
> packet in such a situation ?

Try putting it in PREROUTING instead of POSTROUTING.  PREROUTING is for=20
packets as they enter the firewall, regardless of the direction they are=20
travelling.  POSTROUTING is just before it leaves the firewall. =20

j



