From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ping to internet hosta through NameServer of provider
Date: Tue, 9 Mar 2004 13:22:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403091322.50154.Antony@Soft-Solutions.co.uk>
References: <E1B0gpe-0004V7-9P@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1B0gpe-0004V7-9P@vishnu.netfilter.org>
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

On Tuesday 09 March 2004 1:00 pm, Stanislav Puffler DiS. wrote:

> It seems like anything you=B4ve described. Here is the ruleset :
>
> iptables -L -nv

<snip>

If this is your ruleset, where is the LOG rule which produced the output =
you=20
posted earlier?

> > IN=3Deth0 OUT=3D MAC=3D.............. SRC=3D"my_providers_nameserver_=
ip"
> > DST=3D"ip_on_my_eth0" LEN=3D127 TOS=3D0x00 PREC=3D0x00 TTL=3D61 ID=3D=
3268 DF
> > PROTO=3DUDP SPT=3D53 DPT=3D32792 LEN=3D107

Antony.

--=20
People who use Microsoft software should be certified.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


