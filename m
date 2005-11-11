From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: DNAT query
Date: Fri, 11 Nov 2005 11:46:19 +0100 (CET)
Message-ID: <52863.193.173.147.3.1131705979.squirrel@webmail.sterenborg.info>
References: <20051111103020.GB18203@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051111103020.GB18203@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Fri, November 11, 2005 11:30, Payal Rathod wrote:
> Hi,
> I am trying to redirect trafffic from outside to an internal machine.
> The setup is SuSE Linux 9.1 (i586) 2.6.4-52-default
> # iptables --version
> iptables v1.2.9
>
> When I give,
> # iptables -t nat -I OUTPUT -d dyn.example.com -p tcp --dport 8000 -j
> DNAT --to-destination 192.168.10.2:8000
> iptables: Target problem
>
> What exactly is wrong? If I try it on my Mandrake box it works. Any
> ideas?

Can't say that I've had any problems with this. Try:

iptables -t nat -I PREROUTING -d dyn.example.com -p tcp --dport 8000 \
  -j DNAT --to-destination 192.168.10.2:8000


Gr,
Rob



