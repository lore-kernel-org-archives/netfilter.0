From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Limit on a per host basis?
Date: Mon, 15 Nov 2004 11:59:04 -0500 (EST)
Message-ID: <32624.142.169.215.10.1100537944.squirrel@142.169.215.10>
References: <000501c4c9ae$e37848e0$450aa8c0@hierzo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000501c4c9ae$e37848e0$450aa8c0@hierzo>
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
To: Udo van den Heuvel <udovdh@xs4all.nl>
Cc: netfilter@lists.netfilter.org

On Sat, November 13, 2004 1:30 pm, Udo van den Heuvel said:
> Hello,
>
> How can I limit traffic (packets coming in) at a per host rate?

> Your ideas are very welcome!

This can be done with ipt_recent.

Try iptables -m recent -h for more informations.

> Kind regards,
> Udo

HTH,

Samuel
CookingLinux TM


