From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Limit module accept negation?
Date: Fri, 14 Jan 2005 10:06:32 -0500 (EST)
Message-ID: <55266.142.169.215.10.1105715192.squirrel@142.169.215.10>
References: <41E71E70.4080703@cookinglinux.org>
	<41E7928B.29373.52B9723@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E7928B.29373.52B9723@localhost>
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
To: jagrelo@novadevices.com
Cc: netfilter@lists.netfilter.org

On Fri, January 14, 2005 9:36 am, Jorge Agrelo said:
> Thanks Samuel, after I apply the patch, How look like the rule with
> limit to drop packets flowing above 1p/s

iptables -I INPUT -m limit --limit 1/s -j DROP

Let me know if that didn't work.

> Regards

Cheers,

Samuel


