From: SaVaGE  <pc-secure@home.nl>
Subject: Re: Help please..
Date: Tue, 29 Apr 2003 13:46:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304291346.09526.pc-secure@home.nl>
References: <3EAEAE8C.9050403@naturesoft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EAEAE8C.9050403@naturesoft.net>
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
To: netfilter <netfilter@lists.netfilter.org>

Op dinsdag 29 april 2003 18:55, schreef Karthik RC:
> I'm newer to htis group.
>
> whether the  explanation for below mentioned rule is correct?
> the forward chain will reject  the packet with mac address
> 00:01:23:45:67:89 whose source ip is not eqaul to  192.168.1.2
>
>
>
> iptables -A FORWARD -m mac --mac-source 00:01:23:45:67:89 ! -s
> 192.168.1.2 -j REJECT
 YES correct

