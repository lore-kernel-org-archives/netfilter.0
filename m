From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: filtering HTTP signatures/headers ?
Date: Wed, 1 Mar 2006 13:13:05 +0100 (CET)
Message-ID: <64843.193.173.147.3.1141215185.squirrel@webmail.sterenborg.info>
References: <20060301114547.93879.qmail@web51108.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060301114547.93879.qmail@web51108.mail.yahoo.com>
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


On Wed, March 1, 2006 12:45, S t i n g r a y wrote:
> Is it possible to filter HTTP signatures/headers with
> Iptables ? or is there addon for it ?

You may be able to use the String match but you can only filter the paylo=
ad of
1 packet at a time : if a signature/header spans multiple packets then it
won't work.

Netfilter is not meant to do content filtering. Perhaps you can use Squid=
.


Gr,
Rob



