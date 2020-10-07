From: Amiq Nahas <m992493@gmail.com>
Subject: ulogd2 Error while running
Date: Wed, 7 Oct 2020 16:20:42 +0530
Message-ID: <CAPicJaFJB4qWoyPkoX4q2B7jDiukoUkP8yCOmgZVpH30sFCJPw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=McaAe4xg+u6Al1zaMAh0vWZE392TsCmmqetPorSk0wo=;
        b=I/ZdhLdXggemKUUXz+6WjhBjsWMibtaAuJbKv7SuSczzUDY7gEkbjcpD55wRK26gjW
         OdDmP290cXvNr2Pir+4HwJMXZq8tyjBsFcvWBZhXT3A6DPznkRqrUE4Lx3LAofQxxF+C
         ALIj5DgiYOO4/ozlYxdBlptNDXhik1xPjrDyeuMD4rLo4tOUV0eCjJvB4JnhFzApDUeZ
         Fy3ZEBHX7F2Wkifxw6BYSwUT0VcuEwHOonDTZAG2ID3GguunuTr4Ke93QCQjItTy6EgB
         Ukg7dET887MHq4w9XbTwMLmyOkayq3J5hwUU/FmvTox88Z0Xylp48fkPzOt49Ll1VcvC
         s0ng==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am building ulogd2 and when I do "/ulogd --uid ulog --pidfile
/run/ulog/ulogd.pid -v"
I get the below errors:

ulogd.c:722 load_plugin: '/usr/local/lib/ulogd/ulogd_BASE.so':
/usr/local/lib/ulogd/ulogd_BASE.so: undefined symbol:
register_interpreter

ulogd.c:722 load_plugin: '/usr/local/lib/ulogd/ulogd_LOGEMU.so':
/usr/local/lib/ulogd/ulogd_LOGEMU.so: undefined symbol: ulogd_keyh

ulogd.c:1597 not even a single working plugin stack

Fatal error.

Couldn't find any solution for this. Any suggestions?
Thanks
