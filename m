From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: FORWARD rules
Date: Fri, 12 Sep 2003 16:36:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030912163656.19b9fb66.arnt@c2i.net>
References: <20030910175253.GA2752@linux.local>
	<1063260568.26703.1.camel@risingsun.penguindia.com>
	<20030912100957.GA3360@linux.local>
	<1063363533.879.52.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063363533.879.52.camel@elendil.intranet.cartel-securite.net>
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

On Fri, 12 Sep 2003 12:45:34 +0200, 
Cedric Blancher <blancher@cartel-securite.fr> wrote in message 
<1063363533.879.52.camel@elendil.intranet.cartel-securite.net>:

> > $IPTABLES -A INPUT -m state --state NEW,ESTABLISHED,RELATED \

..lose "NEW".

> > -j ACCEPT
> 
> Same than below. It's about the same than an policy set to ACCEPT...
> 
> > Can I now change the ACCEPT statement to DROP without any fear?
> 
> Sure.
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


