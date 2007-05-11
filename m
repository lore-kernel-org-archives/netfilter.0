From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Policy targets...
Date: Fri, 11 May 2007 12:34:45 +0200
Message-ID: <464446C5.8090301@freemail.hu>
References: <464441F7.3050808@freemail.hu> <464443AE.5020904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464443AE.5020904@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?ISO-8859-2?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Pedro Gon=E7alves =EDrta:
>
> *ACCEPT means to let the packet through.*  =20
> DROP means to drop the on the floor.  QUEUE means to pass the packet=20
> to userspace  (if ported  by  the kernel).  *RETURN means stop=20
> traversing this chain and
>       resume at the next rule in the previous (calling) chain.     If  =

> the  end
>       of a built-in chain is reached or a rule in a built-in chain=20
> with tar-
>       get RETURN is matched, the target specified by the chain policy=20
> deter-
>       mines the fate of the packet.*
>
Thanx for the answer but my question was that what happens when the=20
CHAIN POLICY is RETURN... :D (The packet will be returned to the sender=20
??? :D [Don't get seriously, just kidding.])

iptables -t nat -P PREROUTING ACCEPT

vs.

iptables -t nat -P PREROUTING RETURN

> Best Regards
> pandre



