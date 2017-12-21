From: paulo bruck <paulobruck1@gmail.com>
Subject: limit + log + tcp not working ?
Date: Thu, 21 Dec 2017 12:03:49 -0200
Message-ID: <CANSGRxTJHLttrZw6Oy+mfxN07ow_fq9yuO=X=JsJv6wuLDgSjg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lXukqz2u2sI01XYl3ORBxlXtFvbtGYrwSy7SxDdB9T4=;
        b=WQu7qs9+MYNKHcwLgcKt+5yKehokVREIg8TTyeg690z4L/N9Blc3f6Qj9GajOO7C60
         xlAtawEJNUsvCh+ksG/+I6N5fYwF3v/ynhnkF7bAMbvWdxro48Rtjmze9ilC+uXaE5j6
         O4Ys6ee1f608vT4OOi68ptgT9fOoF62duDjmzkvPWLBqE7r1T/2apRQ99C8jMYeHEacb
         lNp2ieya1fpoAkN/IryQB/IZs8IBQyEM8HMgwpmox+XmtVdZKdEW5DNNY+bevzKzI5Kk
         dj1JHp8yduEs26707ml01NlnVNejoOgGX6kNUsvmOxFQM9gqWc3v2rxj/4UxmZITxU5O
         Rsew==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, pauloric <pauloric@contatogs.com.br>

Hi Guys

I'm diving into nftables and I'm playng with rules to understand how it works.

Does limit has any rule, as it can be used only after log ?

Look below. 3 parts that I just reorganized them.

table inet filter

chain input

type filter hook input priority 0; policy accept;

counter packets 7077 bytes 690164 tcp sport http counter packets 54
bytes 15716 log prefix "acesso a porta 80" flags all counter packets
54 bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0

counter packets 7077 bytes 690164 tcp sport http counter packets 54
bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0 log
prefix "acesso a porta 80" flags all counter packets 0 bytes 0

counter packets 7077 bytes 690164 limit rate 10 bytes/minute counter
packets 0 bytes 0 tcp sport http counter packets 0 bytes 0 log prefix
"acesso a porta 80" flags all counter packets 0 bytes 0



If I insert limit as first place ( last rule) all counter remain 0. It
is ok or I shouldn't insert limit as first place

As I understand reading first rule( just below)

counter packets 7077 bytes 690164 tcp sport http counter packets 54
bytes 15716 log prefix "acesso a porta 80" flags all counter packets
54 bytes 15716 limit rate 10 bytes/minute counter packets 0 bytes 0

count all packages ( ipv4 and ipv6) which enter filter input. (counter
packets 7077 bytes 690164)

see if them are part of tcp sport 80 -  (tcp sport http)

count this packages that pass from part of rule above - (counter
packets 54 bytes 15716 )

log packages and count them - log prefix "acesso a porta 80" flags all
counter packets 54 bytes 15716  ( as I can see packages/bytes are the
same as tcp sport80 counter)

- limit rate them to 10 bytes/minute and count them  - 10 bytes/minute
counter packets 0 bytes 0
????? this should be equal or less them counter above? or at least 10 bytes ???


And rule 1 and 2 are same in terms of counter but rule 3 is totally different...


Am I doing anything wrong?


Thanks for your time.
