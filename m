From: "Danila Octavian" <octavian@service.agress.ro>
Subject: Re: thanks Antony ... and one more thing ...
Date: Fri, 9 Apr 2004 11:52:35 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b401c41e10$06deef00$da0da8c0@pisic>
References: <007801c41e05$2681d850$da0da8c0@pisic> <200404090928.33558.Antony@Soft-Solutions.co.uk>
Reply-To: "Danila Octavian" <octavian@service.agress.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


> No, not using netfilter (unless you wanted to create a rule for each
possible
> destination, just in case some packets got sent there (but then you'd want
to
> know what protocol was used, too, so you'd need even more rules....)).
>
> I suggest you investigate something like iptraf, netwatch or snort.
>
> Regards,
>
> Antony.
>

 I have something like 30 clients ... in my LAN .
 My boss is somehow paranoid and needs "total control" of every bit.
 I was thinking at something like  -A OUTPUT -d !extip !intip !localnet -j
LOG and then parse logs and generate reports with some script.
but the problem : i am not sure if adding three lines of -j LOG for every
destination that i ignore (extip intip and localnet) is a good thing.
what will happen with the packet after first line ?

thanks in advance,
Octavian DANILA



