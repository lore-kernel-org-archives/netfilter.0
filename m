From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: How to drop ping silently??
Date: Thu, 27 Jan 2005 08:30:40 -0500 (EST)
Message-ID: <23331.142.169.215.10.1106832640.squirrel@142.169.215.10>
References: <Pine.LNX.4.61.0501270958520.18509@quasar.las.ic.unicamp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0501270958520.18509@quasar.las.ic.unicamp.br>
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
To: Guilherme Cesar Soares Ruppert <ruppert@las.ic.unicamp.br>
Cc: netfilter@lists.netfilter.org

On Thu, January 27, 2005 7:14 am, Guilherme Cesar Soares Ruppert said:
>
> [...]
> Is there any whay to drop these packet silently, without let the ping k=
now
> that he was blocked. I am programamming an application and I need this
> behavior. I want that ping believes that his packets were sent, but in
> fact, they were dropped.

Use -j REJECT instead of -j DROP. You cannot act like if ping was receive=
d
on the other side tho.

`iptables -j REJECT -h' for a list of icmp reject type.

>
> Is it necessary to write a netfilter module to do that? Or is that
> impossible to do in the netfilter architecture?

Depends what you want the user to see.
Maybe some more info would help ?

>
> Tks
>
> Guilherme Ruppert
>
>
>
HTH,

Samuel


