From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Xtables-addons 1.6
Date: Thu, 20 Nov 2008 13:51:34 -0800
Message-ID: <7259d7020811201351q7d927070j4dc510e5a7759fcb@mail.gmail.com>
References: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>
	 <7259d7020811181620n1ca06f84oe9d6d1f5f0a680c7@mail.gmail.com>
	 <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>
	 <7259d7020811190732u571b90dh3d1f9938c70a1b27@mail.gmail.com>
	 <alpine.LNX.1.10.0811202103120.21606@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=gC4MFg/xP/+1zRHjo2jL3cqBcH4eoCksfg2J4tLC278=;
        b=OB917dV0RW8lRyXHrHLFzDdHKbIrdpiVZP2jvC7ACGMMpjz/chrYkq5KmVfEwfDa99
         81EoSmepMLpZUv5nE0iaFIbNr1OQYzi93r/1hE6pVpKXkAvu88+eb2NFYmE+Hl0Q5vO3
         htGMw8EPJ0aQdWDQ5BJnYcqg4HuGXeSNhqBhQ=
In-Reply-To: <alpine.LNX.1.10.0811202103120.21606@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan,

With your fix above (Thanks), using latest checkouts,

cd /usr/local/src/ipset-svn
svn info | grep Revision
 Revision: 7576

ipset --version
 ipset v2.4.5 Protocol version 2.

cd /usr/local/src/xtables-addons/
 commit fdb7f34bc8f8b0af0b228ba22c9cc5deec3550fc

       (p.s. how do your get "v1.6-3-g85e3c24" out of git?)

I end up with 'only',

/usr/local/libexec/xtables:
 -rwxr-xr-x 1 root root   15504 2008-11-20 13:38 libxt_CHAOS.so
 -rwxr-xr-x 1 root root   16181 2008-11-20 13:38 libxt_condition.so
 -rwxr-xr-x 1 root root   13820 2008-11-20 13:38 libxt_DELUDE.so
 -rwxr-xr-x 1 root root 2114070 2008-11-20 13:38 libxt_dhcpaddr.so
 -rwxr-xr-x 1 root root 2114103 2008-11-20 13:38 libxt_DHCPADDR.so
 -rwxr-xr-x 1 root root   16906 2008-11-20 13:38 libxt_fuzzy.so
 -rwxr-xr-x 1 root root   26236 2008-11-20 13:38 libxt_geoip.so
 -rwxr-xr-x 1 root root   21815 2008-11-20 13:38 libxt_IPMARK.so
 -rwxr-xr-x 1 root root   21786 2008-11-20 13:38 libxt_ipp2p.so
 -rwxr-xr-x 1 root root   20565 2008-11-20 13:38 libxt_LOGMARK.so
 -rwxr-xr-x 1 root root   15844 2008-11-20 13:38 libxt_portscan.so
 -rwxr-xr-x 1 root root   21097 2008-11-20 13:38 libxt_quota2.so
 -rwxr-xr-x 1 root root   14197 2008-11-20 13:38 libxt_SYSRQ.so
 -rwxr-xr-x 1 root root   13820 2008-11-20 13:38 libxt_TARPIT.so
 -rwxr-xr-x 1 root root   16942 2008-11-20 13:38 libxt_TEE.so

/usr/local/lib/ipset:
 -rwxr-xr-x 1 root root   14941 2008-11-20 13:28 libipset_iphash.so
 -rwxr-xr-x 1 root root   15029 2008-11-20 13:28 libipset_ipmap.so
 -rwxr-xr-x 1 root root   15370 2008-11-20 13:28 libipset_ipporthash.so
 -rwxr-xr-x 1 root root   15253 2008-11-20 13:28 libipset_ipportiphash.so
 -rwxr-xr-x 1 root root 2112524 2008-11-20 13:28 libipset_ipportnethash.so
 -rwxr-xr-x 1 root root   15232 2008-11-20 13:28 libipset_iptreemap.so
 -rwxr-xr-x 1 root root   15151 2008-11-20 13:28 libipset_iptree.so
 -rwxr-xr-x 1 root root   15352 2008-11-20 13:28 libipset_macipmap.so
 -rwxr-xr-x 1 root root   15153 2008-11-20 13:28 libipset_nethash.so
 -rwxr-xr-x 1 root root   14843 2008-11-20 13:28 libipset_portmap.so
 -rwxr-xr-x 1 root root   15042 2008-11-20 13:28 libipset_setlist.so

which is less confusing to me, and looks about right.

Thanks.

--JC
