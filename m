From: Patrick Schaaf <bof@bof.de>
Subject: Re: OK the last one: IP Accounting
Date: Sun, 23 Jun 2002 10:14:55 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020623101455.O5183@oknodo.bof.de>
References: <20020623100427.N5183@oknodo.bof.de> <NFBBLDBMIDIOFPBNLEAJKEKECHAA.yomega@wahooo.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NFBBLDBMIDIOFPBNLEAJKEKECHAA.yomega@wahooo.net>; from yomega@wahooo.net on Sun, Jun 23, 2002 at 10:10:36AM +0200
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

> Thx 4 all the nice answers, i think i got it now and i set up Accounting for
> my POP3 Server.

Looks good, but drop the "udp" rules. POP3 is not udp. Even if your
/etc/services suggests otherwise.

all the best
  Patrick

