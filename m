From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: update to v1.2.7a
Date: Mon, 9 Sep 2002 00:18:19 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209090018.19774.fabrice@celestix.com>
References: <004801c2573b$1d750350$0100a8c0@poste1>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004801c2573b$1d750350$0100a8c0@poste1>
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
To: Guillaume <gkweb@wanadoo.fr>, netfilter@lists.netfilter.org


Hello Guillaume,

On Sunday 08 September 2002 21:24, Guillaume wrote:
> I had with v1.2.6a the special feature "REJECT --fake-source", i was
> rebuild my kernel for this. But after a bad update to v1.2.7a (not done
> properly by me...) all work, but not this feature. My kernel is ready to
> manage that feature, not need to rebuild. How to make iptables recognize
> the feature "--fake-source" ? It's only I think a file path problem.
> Thanks.

The fake source patch has been moved from extra/ repositery to the
userspace repositery. So the patch to apply now to have this option is :
userspace/ipt_REJECT-fake-source.patch

Hope that helps,

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

