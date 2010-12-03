From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: cross compilation of xtables fails
Date: Fri, 03 Dec 2010 14:03:31 +0000
Message-ID: <4CF8F8B3.5080100@googlemail.com>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=+cKYaOqJ1yBN0S/LSDr34BoMTniRyeFHNvVSN+CiwYQ=;
        b=kJJs6kBVasmb+RaxaVpyAhxFFmK3THtjW2x2FES2zZdpzg2ydv3NjuhMZAmJB7LZY8
         zlMlReNPQYbIjhq15WBkrCeTU/58KiHmZI1jT1c6sWTRRnaB2l3FFsy/dc+pffFCSlXl
         vcAraHaaomFSRqFNUc07AHgQimtVWuqeJrCq8=
In-Reply-To: <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


> So what is the actual configure command you used?
>   
I don't have it at hand as I am posting from a different office/machine, 
but this is the gcc statement compiling libxt_quota2:

gcc -Wp,-MMD,./.libxt_quota2.oo.d,-MT,libxt_quota2.oo 
-D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64     
-D_REENTRANT -Wall -Waggregate-return -Wmissing-declarations     
-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes     
-Winline -pipe -DXTABLES_LIBDIR=\"/lib/xtables\"     -I../include  
-I/home/zeek/rpm-builds/xtables-addons-1.30/extensions -DPIC -fPIC -O2 
-g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector 
--param=ssp-buffer-size=4 -m32 -march=i686 -mtune=pentium2 
-fasynchronous-unwind-tables -o libxt_quota2.oo -c libxt_quota2.c;
