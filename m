From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables - bridge - physin
Date: Tue, 1 Apr 2003 22:21:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304012221.23826.netfilter@newkirk.us>
References: <D3DD55FDB74AD511BA51005004163680176597@orion.ibh.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA51005004163680176597@orion.ibh.de>
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
To: Jochen Vogel <jvogel@it-sec.de>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'bridge@math.leidenuniv.nl'" <bridge@math.leidenuniv.nl>

On Tuesday 01 April 2003 05:18 am, Jochen Vogel wrote:
> hi all,
>
> i compiled iptables and teh bridge patch.
> all is working fine. but in my old iptables script i configured many
> rules with -i and -o.
> in the logs i can see, that iptables use as IN and OUT the bridge and
> have an additional entry for PHYSIN.
> is there an option to use the PHYSIN?
>
> thx for help
> jo

No option, just reference them directly.  You can use any of the three=20
interface names, IE eth0,eth1,br0 in your rules.

j


