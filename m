From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ICMP and state/conntrack
Date: Fri, 28 Feb 2003 12:59:52 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302281258240.27528-100000@blackhole.kfki.hu>
References: <20030228103743.GA31779@ok.is>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228103743.GA31779@ok.is>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@tommi.org
Cc: netfilter@lists.netfilter.org

On Fri, 28 Feb 2003 netfilter@tommi.org wrote:

> I'm wondering if state doesn't apply to ICMP packets.
>
> iptables -A FORWARD -p icmp -m state -d 1.2.3.4 --state NEW -j ACCEPT
> iptables -A FORWARD -m state --state NEW,INVALID -j REJECT
>
> if I ping 1.2.3.4 the echo-reply is blocked from 1.2.3.4. Is this normal, I
> thought that the echo-reply should be marked RELATED and therefore not
> blocked?

ICMP echo-reply is not an ICMP error message, it is not RELATED to
another connection. You can match is as ESTABLISHED.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


