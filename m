From: SaVaGE  <pc-secure@home.nl>
Subject: Re: per user IP adresses
Date: Sun, 4 May 2003 21:19:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305042119.15316.pc-secure@home.nl>
References: <000101c3126c$6c64d020$0200a8c0@WKSJOHN>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c3126c$6c64d020$0200a8c0@WKSJOHN>
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

Op zondag 4 mei 2003 20:38, schreef John Guntenaar:
> Hello,
>
> I have a linux machine with 4 IP addresses, I have a couple of friends
> on that machine and I don't allow them to use IRC, so I simply blocked
> the IRC ports, but I want to use IRC from the 4th IP without the other
> users being able to use it. I think I can reach that goal by using the
> owner match facility of iptables, though I can't find any good examples
> with google, is it correct and can somebody post an example?
>
> Thanks in advantage,
>
> John

this one is very easy , you can use the same rule , you used before , but=
 now=20
you say :     ..........     -s ! $4th_ip -j DROP


Pascal

