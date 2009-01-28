From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: Blocking outgoing 802.11 ACKs
Date: Wed, 28 Jan 2009 13:29:13 +0200
Message-ID: <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
References: <441977.39906.qm@web31604.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Utaw9S4OZqyTKMbsf+Y5VTHu/fsymko/e1OITrhy5uY=;
        b=PR32++PzRUZKX/clFXlaZSJ/bZBaW5AyChDJpMVpMVt3lXZ7SX/8Fexww6z3rfeFmK
         CL7oWrEiOdRTXs4SHOSef4/9N//phwnzRf9ULSinnm0LjWN0zn/XPOXkaFj5lMqCC4KW
         xqXZ8GoCrUISuZswan//rL4j1T47OXmjJ7OIM=
In-Reply-To: <441977.39906.qm@web31604.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kpele_ntua@yahoo.com
Cc: netfilter@vger.kernel.org

iptables has "nth" match extension that matches every n-th packet. It
is described in the man page.
But why would you want to drop ACK packets? That would have negative
impact on your link.

Ivan.

On Wed, Jan 28, 2009 at 12:41 PM, Kostas Pelechrinis
<kpele_ntua@yahoo.com> wrote:
> Hi all,
>
> I have two nodes communicating via their wireless interfaces.  Let us assume that node A sends packets to node B.  Once node B is receiving the packets, he transmits the 802.11 ACK frame.  What I want to do is to prevent node B from sending this ACK frames once every two packets for example.
>
> One indirect way I have thought about is setting the following rule to node B:
>
> iptables -A INPUT -i ath0 -m limit --limit _SPECIFIED-LIMIT_ -s _NODE'S A IP_ -j DROP
>
> However,  I am not sure if this prevents the 802.11 ACKs from being transmitted.  This has to do with the place where the above rule is being enforced.
>
> Do you have any comments or suggestions on how I can achieve what I am trying to?
>
> Thanks,
> Kostas
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
