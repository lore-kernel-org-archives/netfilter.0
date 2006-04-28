From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Login load balancing
Date: Fri, 28 Apr 2006 12:00:05 +0200
Message-ID: <20060428120005.4d940e7b.arnt@c2i.net>
References: <444FAEFF.1040100@uvic.ca>
	<1146073387.24375.74.camel@sehe-c4.berlin.teles.de>
	<444FBBA7.2020501@uvic.ca> <20060427121619.3e2bf426.arnt@c2i.net>
	<445100BC.1080907@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <445100BC.1080907@uvic.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Drew Leske <dleske@uvic.ca>
Cc: netfilter@lists.netfilter.org

On Thu, 27 Apr 2006 10:34:52 -0700, Drew wrote in message 
<445100BC.1080907@uvic.ca>:

> > ..check out sdm and sdm-terminal, if you wanna provide X logins over
> > ssh, the user sees a menu to choose from and you should be able to 
> > "pile up the good boxes" on top of that menu listing:
> 
> Interesting, and I might find this useful elsewhere, but for this
> issue I need to support console logins as well.

..and this can't?  At the very least you should be able to offer console
logins from the sdm-terminal X menu, and then there's offering a console
menu from /etc/inittab instead of /bin/bash or whatever you guys use.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;o)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



