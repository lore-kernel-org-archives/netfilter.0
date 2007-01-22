From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: What is wrong ???
Date: Mon, 22 Jan 2007 16:45:15 +0100
Message-ID: <45B4DC0B.2000900@freemail.hu>
References: <45B4977B.8060906@freemail.hu> <web-4300200@bk3.webmaillogin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-4300200@bk3.webmaillogin.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jorge Davila <davila@nicaraguaopensource.com>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Jorge Davila =EDrta:
> Well, I don't know if this post will help you but I found some=20
> problems compiling the kernel in the 2.6 series. My solution was=20
> install the compatibility package for gcc 3.2 (the actual version (in=20
> my system) is 4.1.1 - for gcc - and then compile using gcc 3.2.
>
> Hope this helps.
>
Thanx... I haven't tried yet....
> Jorge Davila.
I have just applied TARPIT and u32 with pom-ng and now it goes...
The only warning is the "initialization from incompatible pointer=20
type"... Something changed in the kernel and the pom-ng is not up to date=
=2E..

Swifty


