From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: -L for LAGG
Date: Tue, 17 Sep 2002 14:14:07 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209171414.08026.fabrice@celestix.com>
References: <3D85E320.93CDA560@sympatico.ca>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D85E320.93CDA560@sympatico.ca>
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
To: Jimmy James <jamesstickland@sympatico.ca>, netfilter@lists.netfilter.org

On Monday 16 September 2002 21:56, Jimmy James wrote:
> when i do iptables -t filter -L there is a lot of lag to preceed the
> output.  I know there is a way to speed this output up (was reading it
> somewhere), but i never had this problem before i got new kernel source
> and patched it for ipt1.2.7.
> please help.

Hello,

Le lag you experience is due to name resolving. You can use the -n option
to not resolve the host names.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

