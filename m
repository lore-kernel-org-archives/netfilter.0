From: Julian Anastasov <ja@ssi.bg>
Subject: Re: owner based policy routing
Date: Sat, 12 Oct 2002 00:59:55 +0000 (GMT)
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <Pine.LNX.4.44.0210120056220.1206-100000@u.domain.uli>
References: <3DA64DD6.7080805@inbox.lv>
Mime-Version: 1.0
Return-path: <lartc-admin@mailman.ds9a.nl>
In-Reply-To: <3DA64DD6.7080805@inbox.lv>
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

On Fri, 11 Oct 2002, Arindam Haldar wrote:

> 50:     from all fwmark       50 lookup ispA

	fwmark in ip rule is 0x50 (it is defined and printed in hex)

> iptables -I OUTPUT -t mangle -m owner --uid-owner <squid> -d 202.0.0.0/8
>   -j MARK --set-mark 50

	and here 50 is 0x32 (not 0x50). Is that the problem?

Regards

--
Julian Anastasov <ja@ssi.bg>

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
