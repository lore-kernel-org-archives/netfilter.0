From: Patrick Schaaf <bof@bof.de>
Subject: Re: AW: OK the last one: IP Accounting
Date: Sun, 23 Jun 2002 10:32:52 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020623103252.P5183@oknodo.bof.de>
References: <20020623080917.YGPZ2755.mta05-svc.ntlworld.com@there> <NFBBLDBMIDIOFPBNLEAJOEKFCHAA.yomega@wahooo.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NFBBLDBMIDIOFPBNLEAJOEKFCHAA.yomega@wahooo.net>; from yomega@wahooo.net on Sun, Jun 23, 2002 at 10:23:34AM +0200
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
Content-Transfer-Encoding: 7bit
To: yomega <yomega@wahooo.net>
Cc: netfilter@lists.samba.org

Yo,

one more thing WRT accounting POP3, and just as an idea that may be
useful for you in the future: if your pop3 server software changes
its uid to the user served, or if you set up several independant
pop3 servers running under different uids, you can use the "owner"
match extension to iptables to easily seperate accounting based
on the uids. You can do this inside the pop3_accounting chain,
without touching the main chains again.

Isn't this nice?

all the best
  Patrick

