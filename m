From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: quota and time patch.
Date: Fri, 27 Sep 2002 13:00:01 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209271300.01203.fabrice@celestix.com>
References: <F91y07vQONDZsbg5YX600007f11@hotmail.com> <1832391719.20020927092901@texlab.com.uz>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1832391719.20020927092901@texlab.com.uz>
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
To: Alexey Talikov <alexey_talikov@texlab.com.uz>, SB CH <chulmin2@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Friday 27 September 2002 12:29, Alexey Talikov wrote:
> Hello SB,
> It is only example don't use it in real setup !!!!!!!
> Add your additional rules for filtering !!!!!!!!!!!!!
> [...]
> iptables -A user2 -m time --timestart 08:00 --timestop 09:00 --days \
> Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
> iptables -A user2 -m time --timestart 09:00 --timestop 10:00 --days \
> Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
> .........
> iptables -A user2 -m time --timestart 16:00 --timestop 17:00 --days \
> Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
> .........
> # You can limit only upload or only download F.E. if you wish.
> # Sorry for my pure English :((
> -----------------------------------
> mailto:alexey_talikov@texlab.com.uz
> BR
> Alexey Talikov
> FORTEK
> -----------------------------------

Hello Alexey,

Well, yes, it would work :) But it means every day you
would have to remove & re-add your rules, because when the quota is
reached, it won't be reseted the next day automatically. Besides
a quota per hour/sec or min match (modification of the quota match)
would be a lot more elegant don't you think ? It's impressive
to see what people can come up with when you give them a hammer ;-)

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

