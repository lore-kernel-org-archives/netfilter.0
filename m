From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Default DROP policy for mangle and nat in iptables necessary/wise?
Date: Mon, 24 Jun 2002 20:11:27 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625001127.GB27740@cannon.eng.us.uu.net>
References: <20020624114515.A3324@spawar.navy.mil> <001e01c21bb1$a95115a0$0a01a8c0@ed> <20020624163650.A5016@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624163650.A5016@spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: Ed Street <blacknet@simplyaquatics.com>, netfilter@lists.samba.org

> I don't have any "-t mangle" rules.  Do you agree
> that if I make default DROP policy for mangle table
> that nothing will get thru???

Sounds logical.

> 
> The reason you can do:
> 
> >         "$IPTABLES" -t nat -P PREROUTING DROP
> >         "$IPTABLES" -t nat -P POSTROUTING DROP
> 
> is because you have NAT rules that can get thru right?

Yes.

> Chris

