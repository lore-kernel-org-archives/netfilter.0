From: "yomega" <yomega@wahooo.net>
Subject: AW: AW: OK the last one: IP Accounting
Date: Sun, 23 Jun 2002 10:42:30 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <NFBBLDBMIDIOFPBNLEAJKEKGCHAA.yomega@wahooo.net>
References: <20020623103252.P5183@oknodo.bof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020623103252.P5183@oknodo.bof.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,

yeah this is :o))

thx in advance 

greetz,
yomega

> -----Ursprungliche Nachricht-----
> Von: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]Im Auftrag von Patrick Schaaf
> Gesendet: Sonntag, 23. Juni 2002 10:33
> An: yomega
> Cc: netfilter@lists.samba.org
> Betreff: Re: AW: OK the last one: IP Accounting
> 
> 
> Yo,
> 
> one more thing WRT accounting POP3, and just as an idea that may be
> useful for you in the future: if your pop3 server software changes
> its uid to the user served, or if you set up several independant
> pop3 servers running under different uids, you can use the "owner"
> match extension to iptables to easily seperate accounting based
> on the uids. You can do this inside the pop3_accounting chain,
> without touching the main chains again.
> 
> Isn't this nice?
> 
> all the best
>   Patrick
> 
> 

