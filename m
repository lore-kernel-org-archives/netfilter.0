From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: NOT acceptable "/etc/sysconfig/network-scripts/ifup" script !!!
Date: Wed, 14 May 2003 23:16:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030514231637.72cc3ff8.arnt@c2i.net>
References: <200305142155.31623.pc-secure@home.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305142155.31623.pc-secure@home.nl>
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

On Wed, 14 May 2003 21:55:31 +0200, 
"P.Italiaander" <pc-secure@home.nl> wrote in message 
<200305142155.31623.pc-secure@home.nl>:

> hello all , 
> 
> I have just installed the new Mandrake 9.1 as workstation , and i had
> to adjust the ifup script ,since i use internal, an dhcp-server.So it 
> automaticaly adapt the /etc/hosts file.
> But to my  suprise , i saw that the ifup script , still is written for
> ipchains !!!! THIS IS NOT ACCEPTABLE 
> So i will correct it the iptables-script , when it's done 
> i'll send a copy , for other Mandrake or RedHat users , maybe come
> handy
> 
> Pascal
> 


..heh, check out
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=89171

...but there _is_ hope for RH:
http://rhn.redhat.com/errata/RHSA-2003-172.html is appearantly serious 
enough to get Red Hat to drop their no-upgrade-to-match-newest-vanilla 
policy, _all_ supported RH versions are asked to go to 2.4.20-13.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



