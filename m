From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: is NOTRACK modules the only way to avoid connection tracking?
Date: Mon, 7 Feb 2005 08:55:16 -0500 (EST)
Message-ID: <43169.142.169.215.10.1107784516.squirrel@142.169.215.10>
References: <1107767854.10815.3.camel@nostromo.bgsecm.com>
	<Pine.GSO.4.33.0502071342280.1529-100000@indigo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.GSO.4.33.0502071342280.1529-100000@indigo>
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
To: Alexander Piavka <piavka@cs.bgu.ac.il>
Cc: netfilter@lists.netfilter.org

On Mon, February 7, 2005 7:00 am, Alexander Piavka said:
>
>  Hello, i have a question about connection tracking.

Hi

>
> if i have at least one iptables rule with -m state ,no matter in which
> chain,then the conntrack module gets loaded in all iptables hooks and
> thus all packets will be connection tracked, even if i need to track
> only a small subset of packets. This means that the only way to avoid
> connection tracking for most of packes is to use the NOTRACK module in =
raw
> table to match them. Is my understanding correct?

Yes. This is right. Keep in mind that conntrack is a hook in the packet
traversal just like any other hooks (PREROUTING, INPUT, FORWARD, ...)

Usually, that's the first hook ever. But, with the raw table, there's a n=
ew
hook registered before conntrack. That's why you can tell :

That packet which is not going to TCP X and host X, just don't track it
(NOTRACK).

> Or i can avoid connection tracking without the use of NOTRACK modules?

Without NOTRACK, that's a no conntrack for all or conntrack for all
condition. There's no beside.

>
> Thanks a lot
> Piavlo Alexander
>

HTH,
Samuel


