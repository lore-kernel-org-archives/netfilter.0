From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iprange match processing overhead
Date: Mon, 5 May 2003 10:17:07 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0305051004570.607-100000@blackhole.kfki.hu>
References: <1051714001.3448.3.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051714001.3448.3.camel@jasiiitosh.nexusmgmt.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

On 30 Apr 2003, John A. Sullivan III wrote:

> We've done some initial testing of the iprange patch and are thrilled
> with it.  However, is it any more processing intensive to use an iprange
> match than to use the standard source or destination match, i.e., -s
> rather than -m iprange --iprange --src/dst-range? Thanks- John

Yes.

The iprange match is an extension, which means that it's preceded by an
implicit match against the any address (as if -s 0.0.0.0/0 -d 0.0.0.0/0
were specified).

But I don't think you'd notice the extra overhead. :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


