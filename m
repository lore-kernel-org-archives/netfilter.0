From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: Iptables rule for multiple Ip addresses.
Date: Tue, 15 Jun 2004 09:35:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040615093534.3b34a1c1.leslie.polzer@gmx.net>
References: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
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

On Mon, 14 Jun 2004 22:35:49 -0700 (PDT)
ads nat <adsnat@yahoo.com> wrote:

> It seems it does not accept multipal source addresses.
Yes.

> I sther any other wat do achieve this.
Yes, with the iprange module:

http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-iprange

> Thanks for support.
You're welcome.

Leslie

