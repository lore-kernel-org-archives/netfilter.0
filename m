From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: list nats
Date: Thu, 10 Feb 2005 14:12:27 -0500 (EST)
Message-ID: <27904.142.169.215.10.1108062747.squirrel@142.169.215.10>
References: <420BAD63.9040300@caris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <420BAD63.9040300@caris.com>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter@lists.netfilter.org

On Thu, February 10, 2005 1:52 pm, Peter Marshall said:
> Is there a way to list nats ?
>
> ie, you can list your tables / chains with iptables -L chain-name
> Is there something simular for nat, SNAT and DNAT ?

iptables -t nat -L ?

>
> Thanks,
> Peter
>
>
HTH,
Samuel


