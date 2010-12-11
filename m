From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 00:41:57 +0000
Message-ID: <4D02C8D5.6080805@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=Xw7dFzpgwDwfQUVeOn0BWg0T4o03HAl6+ELC9SUKaEc=;
        b=Sb+RGwjssOuTLWlVDr2TGXfl+bybk3TqrqTiPfaMVdouFiI7NgxNNHlOeeFvb0ob6v
         DCd+2GkGj/c3TNXyxwrFWbW7Up3V5SdwtXbUBinxQB0uvcEIOlniDTE/B/jWgWvsE6VH
         1O4XWV/uE1UCjn5iAqUzxPdAVR6/zrmIEzjSQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

When trying to build the above from source I get the following error:

gcc -Wp,-MMD,./.libxt_gradm.oo.d,-MT,libxt_gradm.oo 
-D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64     
-D_REENTRANT -Wall -Waggregate-return -Wmissing-declarations     
-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes     
-Winline -pipe     -I../include  
-I/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions -DPIC -fPIC 
-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions 
-fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=core2 -o 
libxt_gradm.oo -c libxt_gradm.c;
libxt_gradm.c:84: warning: implicit declaration of function 'ALIGN'
libxt_gradm.c:84: error: initializer element is not constant
libxt_gradm.c:84: error: (near initialization for 'gradm_mt_reg.size')
libxt_gradm.c:85: error: initializer element is not constant
libxt_gradm.c:85: error: (near initialization for 
'gradm_mt_reg.userspacesize')
make[3]: *** [libxt_gradm.oo] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory 
`/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions'
make[2]: *** [user-all-local] Error 2
make[2]: Leaving directory 
`/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/zeek/rpmbuild/BUILD/xtables-addons-1.31'

Any ideas? From what I remember there was a similar problem with a 
couple of files in 1.30!
