From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Problem with match extensions
Date: Mon, 26 Dec 2005 12:04:40 +0100 (CET)
Message-ID: <18167.80.127.73.119.1135595080.squirrel@webmail.sterenborg.info>
References: <8a6fb64c0512260231l107b1573u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8a6fb64c0512260231l107b1573u@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Mon, December 26, 2005 11:31, Daniel Firvida wrote:
> Hi
>
> I have a problem with match extensions of iptables, concretely with
> match of time
> I have kernel version 2.6.9, iptables version 1.3.4 and the patch
> patch-o-matic-ng-20040621

You have the latest iptables but you are using old kernel and POM
(more than a year old, kernel is at 2.6.14 and snapshot POM-ng is now
at 20051225).
Perhaps it would work when you switched to newer versions, at least
that of POM-ng (but a newer POM-ng may require a newer kernel..).

> but I not with himself that the conditions of time are executed.

I'm sorry, I don't understand what you mean here.


Gr,
Rob



