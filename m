From: Jakov Sosic <jsosic@jsosic.homeunix.org>
Subject: Re: why DROP in PREROUTING
Date: Fri, 27 Oct 2006 16:52:56 +0200
Message-ID: <20061027165256.57d2e6d3@localhost>
References: <4541D552.2070802@eccotours.co.za> <4541D89E.1080507@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4541D89E.1080507@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, 27 Oct 2006 11:59:58 +0200
G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:

> You can filter all of these packets at one point no matter where they=20
> coming from and going to....

Oscar is against it in his tutorial, he even says a reason. If I
remember correctly, it's beacuse only the first packet hits that rule,
and others get the same action without further checking, and that's not
a good idea to do.



--=20
|   Jakov Sosic   |   ICQ: 28410271   |   PGP: 0x244F89CA   |
| http://jsosic.homeunix.org  |  jsosic@jsosic.homeunix.org |
--

