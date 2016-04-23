From: Ted Moseley <tmoseley1106@gmail.com>
Subject: Errors Compiling Software using iptables 1.6.0
Date: Sat, 23 Apr 2016 11:49:39 -0400
Message-ID: <CAC2ybNj4PU-=UaPAf2jt6SN_STqAocTpLRXJ5f7RcgYnvS0M_w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=N7P73lihPTbQMB7PFjXsP5Z2aa4ulTJAqsO/C8Mgx7k=;
        b=caAyfP27F2m8qiY4223HaieeB8sK/DyR7/rZSIa9NkYnhRXg3Yog4qeJXYgFjjaF4J
         fOx62CEAV5//OmY96JxrVFKpB2LXDFvw+gJRXszr5sYttptZKWKjldGL11zFYywrWwDz
         mwNgAIzISH4wL3FvIkhHGkQTAavptTGPNvLEAvFRK6Mn+JPBtWvPzmWbbJf0nshS4jum
         0HbXyvzC810GZ70biugzMCOcem72hDOqTgWCKoybGWx3Zlud5iMM3vc7DCqKtTTxKkVI
         vTbBVwFW8/Nd9W21RRVJkIP3oe9msALks6Ycc5r8lhHKGfRsnVEoxzSCtF5g6Oc2Tq/3
         Oz8Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, I'm kinda new to this mailing list thing, so throw me some
slack if you could :)

I'm working on building a Linux From Scratch system, and I wanted to
use the ConnMan connection manager to control my networking. One of
the dependencies for ConnMan is iptables (more specifically xtables).
ConnMan seems to configure fine, but when I attempt to build it, I
receive the following errors:

 In file included from /usr/include/xtables.h:16:0,
                 from src/iptables.c:33:
/usr/include/linux/if.h:71:2: error: redeclaration of enumerator 'IFF_UP'
  IFF_UP    = 1<<0,  /* sysfs */
  ^
/usr/include/net/if.h:44:5: note: previous definition of 'IFF_UP' was here
     IFF_UP = 0x1,  /* Interface is up.  */
     ^
/usr/include/linux/if.h:72:2: error: redeclaration of enumerator 'IFF_BROADCAST'
  IFF_BROADCAST   = 1<<1,  /* __volatile__ */
  ^
/usr/include/net/if.h:46:5: note: previous definition of
'IFF_BROADCAST' was here
     IFF_BROADCAST = 0x2, /* Broadcast address valid.  */
     ^

This is only a short excerpt of the errors (the rest of them are
similar looking). As one person noted on the ConnMan mailing list, it
seems that xtables is pulls both 'linux/if.h' and 'net/if.h'. Perhaps
this is just a noob mistake, but is there some way to prevent this? I
have been building iptables using the following three commands:

./configure --prefix=/usr --sbindir=/sbin --disable-nftables
--enable-libipq --with-xtlibdir=/lib/xtables

make

make install

So, if there is any way to get around this issue, I would be indebted
to know what it is, or at least an idea on how to fix these build
errors. Just a few more notes, I am using Linux 4.5.0 and I am using
the systemd version of Linux From Scratch (though, I had the same
issue while trying the standard sysvinit LFS). Thanks!

-- 
Ted Moseley
