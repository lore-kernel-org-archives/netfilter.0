From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables SNAT and sip "REGISTER"
Date: Thu, 11 Sep 2003 02:38:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030911023808.2ef281a5.arnt@c2i.net>
References: <20030901082901R.zenkato@pis.bekkoame.ne.jp>
	<20030903194627.25529b33.arnt@c2i.net>
	<20030909082106I.zenkato@pis.bekkoame.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030909082106I.zenkato@pis.bekkoame.ne.jp>
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

On Tue, 09 Sep 2003 08:21:06 +0900, 
Zen Kato <zenkato@pis.bekkoame.ne.jp> wrote in message 
<20030909082106I.zenkato@pis.bekkoame.ne.jp>:

> Hi Arnt,
> 
> Thank you for your comment.
> I upgraded to RHL-7.3 linux-2.4.20-20.7 and iptables-1.2.8-8.72.3.

..excellent.

> SIP UAs could send and receive "REGISTER", "INVITE", "200 OK", 
> "ACK" and udp media packets via .100.30. So, DNAT/SNAT of iptales-
> 1.2.8 works fine, but both sip phones can not have "audio"?!
> 
> Both sip phones worked fine when I tested using non-NAT with a local
> sip proxy. I don't know why this case does not work.

..pass, I dunno much about VoIP.  This works in your lan but 
not across your firewall?  Does it conflict with nat?

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


