From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 17:58:56 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111758.56593.fabrice@celestix.com>
References: <Pine.LNX.4.33.0209091917581.31845-100000@panda.center-f1.ru> <3D7EFBCF.70406@fugmann.dhs.org> <00a601c259ee$57f815c0$6500a8c0@systemsadmin>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a601c259ee$57f815c0$6500a8c0@systemsadmin>
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
To: "Joe de Vera Jr." <jhoedv@we-amuse.com>, netfilter@lists.netfilter.org

On Thursday 12 September 2002 07:52, Joe de Vera Jr. wrote:
> hello fellas,
> can i make use of the iptables scripting to disable the access pages... for
> example for code red it access /default.ida page while in nimda /root.exe
> and cmd.exe
> is there a way to dis allow this..
> thanks
> Joe

Hello,

you really shouldn't use iptables for such purpose as there is no clean
and proper way to it in iptables. iptables is a packet filter. What you
need is an filtering application proxy, in your case a filtering HTTP proxy.
Read-on the mailing archive, and the iptables FAQ if you want to know
the full details.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

