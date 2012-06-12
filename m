From: Andrew Collins <bsderandrew@gmail.com>
Subject: Netfilter reroute check ignores IP_PKTINFO?
Date: Tue, 12 Jun 2012 13:17:33 -0600
Message-ID: <CAKTPYJSKFu1bmTVVpmyvc_jODZ9AreKpXZHvc9rCFpEOTbgedg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=P4FSmMOxGLe50CBqDQ1qnKt5+KKk45HBxdaBTiceIKI=;
        b=HyROGOMABHacGoV2sQUGZKYMI/tKcr/ce0bzi4WMaqGi7LHr3f6kJgaVBAoUv2cGkW
         WDlegh0LC5M9mC+lF+FRkyJzbQCXhcF5p68FN4KI4RTXGOQ6R4OKW8h+7Pf1wS8ht8D4
         7xLIq8gSKj71oi3gDMK029ia55Yly63qscnTRA29yi1YOJL4BpgZPCG4Mup7K7glqTR+
         weKtu1hfc62oBnDLJ+FHL0zRP+UzRiGa0cWNCM3qhu9xU6lpsbtl7hm4ReOqudQ6Sl8y
         5JenDI94Nm7oWGERi1+CfLMgV58cTX++Pj3xG0I2vklozoUHenw74NsUMIzS97rXneK3
         PCPw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm running into an issue where locally generated packets with an
IP_PKTINFO ancillary message specifying a particular source interface
are getting routed incorrectly due to the reroute check.

It seems as if ip_route_me_harder takes into account iface bound sockets:

fl4.flowi4_oif = skb->sk ? skb->sk->sk_bound_dev_if : 0;

but does not take into account IP_PKTINFO, which seems inconsistent.
Is this simply an oversight or by design?
