From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: list delete bug: kernel crash
Date: 31 Aug 2004 21:52:19 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093974717.10779.41.camel@nostromo.bgsecm.com>
References: <000801c48f65$58d3c940$0a00a8c0@aziz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000801c48f65$58d3c940$0a00a8c0@aziz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: security <security@lea-linux.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>, Gavin Hamill <gdh@acentral.co.uk>

El mar, 31 de 08 de 2004 a las 16:18, security escribió:
> ----- Original Message ----- 
> From: "security" <security@lea-linux.com>
> To: "Gavin Hamill" <gdh@acentral.co.uk>; <netfilter@lists.netfilter.org>
> Sent: Tuesday, August 31, 2004 3:34 PM
> Subject: Re: list delete bug: kernel crash
> 
> 
> > >
> >> This may be a long shot, but there may exist the possibility of the files 
> >> on
> >> disk being corrupted when they were installed, due to your faulty memory?
> >>
> >> Try to reinstall the kernel / modules and iptables userspace?
> >>
> >> Cheers,
> >> Gavin.
> >>
> >>
> > Ok. I go re-compil my kernel and re-install iptable package :)
> 
> Ok still have  crash after re-compil my kernel and re-install iptable 
> userspace package.
> Allways the same error:
> 
> Aug 31 16:01:39 gateway kernel: LIST_DELETE: 
> net/ipv4/netfilter/ip_conntrack_core.c:300 
> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d3ac9224) not in
> &ip_conntrack_hash[hr].
> Aug 31 16:01:39 gateway kernel: LIST_DELETE: 
> net/ipv4/netfilter/ip_conntrack_core.c:300 
> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d3ac9524) not in
> &ip_conntrack_hash[hr].
> Aug 31 16:03:26 gateway kernel: LIST_DELETE: 
> net/ipv4/netfilter/ip_conntrack_core.c:300 
> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d6537224) not in
> &ip_conntrack_hash[hr].

Have you tried to patch with patch-o-matic and recompile both
the kernel and the userspace last sources (iptables). Both sides
of the system must be synced or there will be problems.

-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


