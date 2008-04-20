From: "Ivan Petrushev" <ivanatora@gmail.com>
Subject: Can't compile libnfnetlink-0.33 and libnetfilter_conntrack-0.0.89
Date: Sun, 20 Apr 2008 16:51:06 +0300
Message-ID: <d39744a20804200651s68dcce81qc93e80fb9d44fe95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=kQOyi9yDX7id9gANWeCvmY9AzXJBI+ygAYqlhCA6oIs=;
        b=OHTsyKrY2TukJaDx/hmCPTZbJ8w8yyfXfJsRret0yFzuU+nw826xx3VX0sRPhPm5XWhLvXS6C82dJnottF8uR+usLZN4eHTbjPlIw1+X90hSR7wehtDm2DKL5f1BR0MPXHsWuq5uZxC8hblN60ImVf3zvF+sTfOSh1xYynVlpJU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,
I've been trying to compile these libraries for a while, but it always
gives me the same error:
---------------------- for libnetfilter_conntrack
/usr/include/libnfnetlink/linux_nfnetlink.h:81: error: expected
specifier-qualifier-list before '__be16'
api.c: In function 'nfct_parse_conntrack':
api.c:526: error: 'const struct nlmsghdr' has no member named 'nlmsg_len'
api.c:545: warning: passing argument 2 of '__parse_conntrack' from
incompatible pointer type
make[2]: *** [api.lo] Error 1
-----------------------
----------------------- for libnfnetlink
../include/libnfnetlink/linux_nfnetlink.h:81: error: expected
specifier-qualifier-list before '__be16'
libnfnetlink.c: In function 'nfnl_fill_hdr':
libnfnetlink.c:429: error: 'struct nfgenmsg' has no member named 'res_id'
make[1]: *** [libnfnetlink.lo] Error 1
-----------------------
I tried to do ./configure
--with-kernel=/home/ivanatora/Archives/linux-2.6.23/ but still with no
luck.
Kernel is 2.6.23.9
GCC is 4.1.2

Any ideas what am I doing wrong?

Regards,
Ivan.

On Sun, Apr 20, 2008 at 4:45 PM,  <Majordomo@vger.kernel.org> wrote:
> --
>
>  >>>> auth e4777bd3 subscribe netfilter ivanatora@gmail.com
>  Succeeded.
>
