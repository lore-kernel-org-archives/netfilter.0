From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Help for IP Masquerading
Date: Wed, 14 May 2003 14:37:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030514143718.13318bb8.arnt@c2i.net>
References: <20030514075139.50609.qmail@web11504.mail.yahoo.com>
	<E6D65A6EE5AAD6119DE800B0D03DA0C528966F@MS_LEU1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E6D65A6EE5AAD6119DE800B0D03DA0C528966F@MS_LEU1>
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

On Wed, 14 May 2003 11:04:38 +0200, 
"Rob Sterenborg" <rob@sterenborg.info> wrote in message 
<E6D65A6EE5AAD6119DE800B0D03DA0C528966F@MS_LEU1>:

> > Q-2 I am using Linux 7.2 with kernel 2.4.7-10. can anyone 
>  > tell me is this kernel monolithic or  modularized?
> 
>  It's modularized.
>  But I really think you'd better compile a vanilla 2.4.20 kernel with
>  the latest patch-o-matic and iptables.


..more reasons to drop 2.4.7-10; check
http://rhn.redhat.com/errata/rh72-errata.html
for "kernel" and "security".

..you want _all_ security upgrades, in your shoes 
I'd possibly upgrade to RH-7.3, _no_ further, I'm _not_ 
impressed by RH-8.0 nor RH-9, nor by Red Hat's act with 
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=89171

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



