From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: IP Personality 20020427 breaks ip_conntrack_ftp
Date: Fri, 14 Jun 2002 12:56:59 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206141230290.9436-100000@dns.toxicfilms.tv>
References: <08690CFFD361A946AE65793A726D276902DEAE@smirnoff.netbeat-security.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <08690CFFD361A946AE65793A726D276902DEAE@smirnoff.netbeat-security.ch>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pascal C. Kocher" <pascal.kocher@netbeat.biz>
Cc: netfilter@lists.samba.org, ippersonality-devel@lists.sourceforge.net

> Was this already a known issue?
A similar one.
Yes, about a year ago I wrote about this patch breaking
tcp-window-tracking.

Look here:
http://lists.samba.org/pipermail/netfilter/2001-October/015930.html

Jozsef answered it.

I think that what you want to do with IP Personality can be done with
the gr security patch (www.grsecurity.net), when you patch the kernel
2.4.18,or 2.4.18-pre1 (the latter don't patch yet) you will have
grsecurity options concerning various methods to do such thing, like
randomizing ttl, IP IDs, etc. But only without fine tuning that IP
personality can have with its configuration files.

I tried that, and i do not remember having trouble with ip_conntrack_ftp
nor ip_nat_ftp.

> Pascal.
Maciej



