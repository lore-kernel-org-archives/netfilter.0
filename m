From: Arif Hossain <aftnix@gmail.com>
Subject: concatenate udp payloads of multiple packet
Date: Thu, 19 Apr 2012 20:32:22 +0600
Message-ID: <CAGuaRCt0Jmj4_prCZVvXi2oijOTprTqUntphjx_9cQqk-nqhCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=DKCN4flzmqO2WQTOMYPZ4B4H+zO7KQsSyhXkblaVpUI=;
        b=We9Cpr9ClaeISCfLjFccqRJMb8DPyWt9ylQGoTe/Z20lSMIlP75bhaiZsrNTTXMxY0
         UUAbBQ+F6AYq7YcyWpJ0HzEhLRhZQ8ryhtCwEr+FrSzGkgJqGsqpn3us/srCwpH6tYl9
         EunymbgslS6d8EStVVwtPuEZ8ZymSF8iL5IJtT5UE1qtzESY9qVG1i3MY8rqNNh8htR/
         F4xX/FnMyg5KLR3XnLxVsUtL5AxakckrQLyBjMnRdl0I7zdnN5/jg/Zl6+xBbGVXphGk
         9TAnRMZ4yOxNL+0AZtfKuhFbmjIHBo2TLHax865lwR6uryi7OwnwbXFugnIRndrKi6xJ
         e5HA==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi all.

I have a netfilter_queue app which receives packets on a port range
and do modifications on them. Now =A0i need to introduce to new feature=
s
with this basic app.

=46irst the traffic is quiet high. I have seen the --queue-balance
option. If i want to use it how should i approach? i mean should i
manage every queue from separate threads or
separate process to manage individual queues?=A0 I'm not sure how can i
use fork() to manage every queue separately.

Secondly How packets are distributed among different queues? Based on
what property a =A0packet is distributed? Any relationship i need to
know about
this distribution?

Thirdly I need to concatenate udp payloads of several packet to
improve bandwidth usage. how should i approach this? The confusion is
when i stop finish processing
of one packet i call nfq_set_verdict() in nfq_callback().  My
confusion  is when  a packet popped from the NFQUEUE? when
nfq_set_verdict() returns or when nfq_callback()
returns?

I mean if i push the incoming packets in user managed queues for
concatenation of udp payload(by this i will also drop individual
packets), then return from the nfq_callback().
After processing in user managed queues(concatenation is done) then i
will issue nfq_set_verdict(). Would that work?

Thanks in advance.

--
-aft
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
