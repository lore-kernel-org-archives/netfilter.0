From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: DNAT problem /  question
Date: Fri, 18 Jun 2004 18:06:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040618180601.7488d0b0.leslie.polzer@gmx.net>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
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

On Fri, 18 Jun 2004 17:45:20 +0200
"Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com> wrote:

> Could you please check my config, if I execute this I can not ping my
> internal lan ip of this host 172.25.239.208 any more. I think this is
> really wierd.
Why? These lines:

> $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT
> --to-destination 11.0.0.16
> $IPTABLES -t nat -A OUTPUT -d
> 172.25.239.220/27 -j DNAT --to-destination 11.0.0.16 

are doing everything to keep ALL packets away from you ;)
All outgoing packets (statement 2) are redirected to 11.0.0.16
and all incoming are as well (statement 1)!
How do you expect ping to work with that? :-O


Kind regards,

Leslie

