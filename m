From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: (no subject)
Date: Thu, 6 Oct 2005 10:26:43 +0200 (CEST)
Message-ID: <65141.193.173.147.3.1128587203.squirrel@webmail.sterenborg.info>
References: <BAY105-F32008F53295C372B97E01E9E850@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY105-F32008F53295C372B97E01E9E850@phx.gbl>
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
To: netfilter@lists.netfilter.org

On Thu, October 6, 2005 10:11, Amresh Kumar wrote:
> Hi
> I am new to iptables i have a problem in adding iptable rule i am
> adding ip
> table rule
>
>   iptables -A OUTPUT -p tcp -m iprange --src-range 10.0.0.1-10.0.0.20
> -m
> iprange  --dst-range 61.12.43.1-61.12.43.20 -j ACCEPT
> But i am getting following error
> Bad argument `61.12.43.1-61.12.43.20'
> Try `iptables -h' or 'iptables --help' for more information.
> Actuall i am trying to drop  destination iprange
> 61.12.43.1-61.12.43.20 to
> source ip range 10.0.0.1-10.0.0.20 .

You probably don't have Netfilter "range" support in/for your kernel
or the modules is not loaded (osmething like ipt_range ?). If you
don't have it, you may have to patch (Patch-O-Matic) and compile a new
kernel.


Gr,
Rob



