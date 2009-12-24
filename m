From: basteon <basteon@gmail.com>
Subject: payload length
Date: Thu, 24 Dec 2009 16:34:18 +1000
Message-ID: <328fe7150912232234g7381efafre6ad8b0825762f05@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=Aa9h6H7CyfmVM+ZJ3mw0RgXvbURJLbbtGeSLBmeEuGU=;
        b=lUYyBEmA4ziNKrf+ZNS7A+w8SaB1xqTDRbAkGsRpmmUGKgUNXiP7U0Pqnk2yqYoEzw
         wSkpKE6f88bmxzd8fm4CHHWD7cxtZM1u2jPKFSjLgxejXA9u/GTBrvx0wcZjfZAiKWi3
         1TMcOIqtmf28ZGXOxGNZEBjzZm3DsliIzPC20=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

greetings,
perhaps someone be able assist me?
I made tine embedded tool so as to customize iptables rules, but I
can't add rules with proto and langth, only proto or length. what so I
did...

struct ipt_entry_match *match = NULL, *mlength = NULL,*tmp=NULL;
//whatever ******************************
//tmp = realloc( match, match->u.match_size + mlength->u.match_size );
tmp = realloc( mlength, mlength->u.match_size + match->u.match_size );
if( tmp ){
//memcpy( tmp + mlength->u.match_size, mlength, mlength->u.match_size );
memcpy( tmp + match->u.match_size, match, match->u.match_size );
match=malloc(tmp->u.match_size );
memcpy(match, tmp, tmp->u.match_size );
}
//whatever ******************************
if(match) memcpy(chain_entry->elems, match,match->u.match_size);

e.g. it works well it I use only match or mlength
ACCEPT     udp  --  10.20.30.40          anywhere            udp
spt:8889 dpt:555
ACCEPT     udp  --  10.20.30.40          anywhere            length 0:5
but I looking something like that...
ACCEPT     udp  --  10.20.30.40             anywhere            length
0:5 udp spt:666 dpt:777

I guess it had little bit specific with sequence or so?
