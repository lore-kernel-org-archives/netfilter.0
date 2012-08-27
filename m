From: Thomas Martin <tmartincpp@gmail.com>
Subject: Hashlimit and burst questions.
Date: Mon, 27 Aug 2012 13:22:03 +0200
Message-ID: <CAO1iXZKa+ME2STjZ3MqYx_yZV9=GxumRBQM7cUTYxGZo7mj98A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=DsE9jsnYRu2eIsfza54tkSVoxp9fgGlkZN/fWasPOtw=;
        b=OuxV/zM+r8g3qdGFywH9JkiDVT+0sCeiQzFt+dfeCzRqwMxODDfWs/cCytS7NPrFpl
         6R+hCrZHwJrNdL2YaCK6MSwGEloPgEYNKVtyFUp1Hc9PYewLQrizsObsjXqpUK5YlQHr
         F6xglkJieRmW/0A7StxxPUcEfa3CCPPfyupALigt8DdFVg+DOkue+4vSwL9tWSuEhT7s
         olFSaFkWiD2xajR7Y45T3TIwfi9KdW2r45eHWO998CrkALCrxzCHaSvdV8h2gojPsjrj
         V/D1+FvbuhUkKbdbuqq+K/ew/SBYKwmvwXWib8VS8hDhsT/81QDD1EmfL9gfI/E39yXN
         uZLA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all.

I am trying to start to use the hashlimit module and I'm a bit lost.
I read the manual but it didn't was so helpful to me.


Indeed I'm not understanding very well the burst option.

During my tests I believed that the burst was the maximum amount of
packets allowed (depending to the unity used -second or minute for
example- ).

Here is my test rule:
iptables -A INPUT -m hashlimit --hashlimit-name synflood
--hashlimit-upto 100/s \
--hashlimit-mode srcip --hashlimit-htable-expire 300000 \
--hashlimit-burst 150 \
-j ACCEPT


So with there values I believed that an IP can do up to 150 requests per second.
When the burst limit is reached the IP can't do no more than the
"hashlimit-upto" parameter (so no more than 100 r/s here).


In /proc/net/ipt_hashlimit/
synflood, after one request, I can see:
230 10.59.128.41:0->0.0.0.0:0 47680 48000 320

So that means the burst limit will be available again when 48000 is
reached (third column) or when this entry will be clear of the hash
table.


Am I wrong?
According to http://www.spinics.net/lists/netfilter/msg52926.html it seems so :/


Also if someone can tell me why "one second" seems to be "32000" I
would be glad too.


Thanks in advance.
Regards.

MHT


PS: Sorry for my English and maybe for this noob question but I don't
read C code.
