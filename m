From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: ULOG with -m state
Date: Sun, 24 Nov 2002 19:45:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211241945.38762.netfilter@newkirk.us>
References: <20021122155352.GA5665@gnjilux.srk.fer.hr>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021122155352.GA5665@gnjilux.srk.fer.hr>
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
To: Iva Cabric Cabric <ivac@gnjilux.srk.fer.hr>, netfilter@lists.netfilter.org

On Friday 22 November 2002 10:53 am, Iva "Cabric" Cabric wrote:
> Hello,
> I have found a bug in iptables when "-j ULOG" and "-m state" are
> used together, for example:
>
> $ iptables -A ssh -j ULOG -p tcp -m state --state NEW
>
> reports:
>
> iptables v1.2.6a: You must specify `--state'
> Try `iptables -h' or 'iptables --help' for more information.
>
> but using DROP works fine:
>
> $ iptables -A ssh -j DROP -p tcp -m state --state NEW

Does the ULOG target work in other uses, IE "iptables -A FORWARD -j ULOG"=
 ?

j


