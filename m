From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNS
Date: Mon, 13 Jan 2003 17:30:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301131730.10226.netfilter@newkirk.us>
References: <3E22A883.103@mattiamartinello.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E22A883.103@mattiamartinello.com>
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
To: Mattia Martinello <mattia@mattiamartinello.com>, netfilter@lists.netfilter.org

On Monday 13 January 2003 06:52 am, Mattia Martinello wrote:
> Hi all
>
> I wish to open DNS connections and redirect it from the gateway and
> the server on the DMZ.
> I tried these rules:
>
> iptables -t nat -A PREROUTING -p tcp -i ppp0 -d [public IP] --dport 53
> -j DNAT --to [private IP]:53
> iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j
> ACCEPT
>
> iptables -t nat -A PREROUTING -p udp -i ppp0 -d [public IP] --dport 53
> -j DNAT --to [private IP]:53
> iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j
> ACCEPT

Do you also have a FORWARD rule ACCEPTing UDP port 53?  It may be a type=20
in the mail, but your FORWARD rules are both for TCP here...

BTW, the :53 in the DNAT destination is unnecessary, it will keep the=20
same port unless you specify something different.  Not an issue,  just a=20
comment. :^)

j

> But if I try to query my DNS server from the Internet my query goes in
> timeout.
> The connections between [private IP] and the Internet are allowed (all
> other services work good without any problem, the only service that
> gets me some problems is DNS).
>
> What have I to open to allow DNS connections from the gateway and the
> DMZ?
>
> Thank you very much
> Bye
> Mattia


