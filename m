From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: rule check
Date: Thu, 16 Jan 2003 10:38:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPKEJNELAA.netfilter@darrelldieringer.com>
References: <000d01c2bd74$2db248f0$1e01a8c0@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c2bd74$2db248f0$1e01a8c0@win2k.com>
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

If these rules appeared in that order in the same set of rules, the
second rule wouldn't be hit because the first one is already accepting
all the NEW,ESTABLISHED,RELATED traffic regardless of protocol and
port.

So, as other listers have pointed out, the rules are not the same.  If
they appeared together though, since the first one is more general, it
will match the traffic the second rule was designed to match.


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Mike
> Sent: Thursday, January 16, 2003 9:30 AM
> To: netfilter@lists.netfilter.org
> Subject: rule check
>
>
> Are these two rules essentially the same ?
>
> Thanks,
> Mike
>
> iptables -A FORWARD -i eth2 -o eth0 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A FORWARD -i eth2 -o eth0 -p tcp --dport 2000:2050 -m
> state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>
>
>


