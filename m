From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Traffic limitation with iptables
Date: Wed, 23 Jul 2003 02:19:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030723021906.7cf93042.arnt@c2i.net>
References: <20030722200858.74374455.epv_xemul@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030722200858.74374455.epv_xemul@mail.ru>
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

On Tue, 22 Jul 2003 20:08:58 +0400, 
Xemul <epv_xemul@mail.ru> wrote in message 
<20030722200858.74374455.epv_xemul@mail.ru>:

> Hi.
> I wanna solve such a problem:
> When I see that byte counter on some chain reaches or exceedes any
> fixed value - then IMMEDIATELY insert into that cahin new first rule
> (e.g. -j DROP) or delete some rules from any other chain. Or more
> abstract - how can can discover that byte counter is higher than smth
> without"polling" chains?
> 
> Sorry for sending such a mail into announce, developers and user
> maillists but I need help as soon as possible. :)
> 

..2 ways: either trottle using, say cbq, check the Advanced Routing
how-to, or get ip-limit from patch-o-matic.

..for cbq throttling for say 802.11 isp networks, feel free to try out 
my wee http://fmb.no/ipcop/setup-cbq-0.0.4.tar.bz2, it could use a gui, 
but is overkill a home user.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


