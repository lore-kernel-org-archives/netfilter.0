From: Julian Anastasov <ja@ssi.bg>
Subject: Re: owner based policy routing
Date: Tue, 15 Oct 2002 00:37:04 +0000 (GMT)
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <Pine.LNX.4.44.0210150010160.1285-100000@u.domain.uli>
References: <3DAAB6D1.2000100@inbox.lv>
Mime-Version: 1.0
Return-path: <lartc-admin@mailman.ds9a.nl>
In-Reply-To: <3DAAB6D1.2000100@inbox.lv>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arindam Haldar <arindamhaldar@inbox.lv>
Cc: LARTC <lartc@mailman.ds9a.nl>, NETFILTER <netfilter@lists.netfilter.org>


	Hello,

On Mon, 14 Oct 2002, Arindam Haldar wrote:

> ok, i have tried applying the ip rule fwmark in hex but dont see any
> difference !..

	It is already in hex, use something like:

ip rule ... fwmark 50

iptables ... --set-mark 0x50

> The routing decission is take be4 the packets comes to OUTPUT table, if

	Right

> thats true then it will be not possible to route **owner** as per policy
> routing--am i right ??

	The sockets select route and when localout selects different
ISP may be the source should be changed too.

> if ys then how can one achieve **owner** based policy routing in linux
> box ??

	This is something that others should comment. NF is
supposed to do everything :)

Regards

--
Julian Anastasov <ja@ssi.bg>

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
