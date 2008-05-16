From: "Greg Steuck" <greg@nest.cx>
Subject: include/linux/netfilter.h after make headers_install is incomplete
Date: Fri, 16 May 2008 15:21:48 -0700
Message-ID: <a27c0c970805161521k332fba8cg808d52396b5cdce5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=NAz6Z586QPS8dawhzUqWr8nbxArQgSJQWRNKnIrdZ34=;
        b=u7a38hza1JJf6fr6gKTAWI/ptB/8r6LPe9UeT2Z/IN/DlPI14HpybBWGFQZWQh36pQgCq5jmAyTPFiSOQ5fgvFBhmgLx8MYl2w1sBtBnOu2NFSGt8XkWc/FzWiaSZDh7QUgmogUIaYBOIu8OrThMgisMvt0GlJvyzIKb3+ECwQY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I ran make headers_install in 2.6.25 tree and the installed netfilter.h is
not complete. Namely, it declares
union nf_inet_addr {
	__u32		all[4];
	__be32		ip;
	__be32		ip6[4];
...
}

The __u32, __be32 types are declared in <linux/types.h> and the #include
directive is removed by the installation process. This in turn makes some
applications unbuildable against such an exported tree, e.g.

busybox-1.10.1/networking/tcpudp.c:#include <linux/netfilter_ipv4.h>

If I correctly understand the purpose of make headers_install, it is
supposed to generate an API for applications. I could certainly
make tcpudp.c include linux/types.h, but given that the application
does not even use nf_inet_addr, this would be the wrong place for
the fix.

Is kernel the right place then?

Thanks
Greg
-- 
nest.cx is Gmail hosted, use PGP for anything private. Key:
http://tinyurl.com/ho8qg
Fingerprint: 5E2B 2D0E 1E03 2046 BEC3  4D50 0B15 42BD 8DF5 A1B0
