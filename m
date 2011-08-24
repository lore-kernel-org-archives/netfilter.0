From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: ebtables: 802_1Q excludes ipv4 ?
Date: Wed, 24 Aug 2011 03:38:46 -0700 (PDT)
Message-ID: <1314182326.27030.YahooMailClassic@web161425.mail.bf1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1314182326; bh=aWq6977sUg6I8y6C+FC6zCcuz9gZnbiRdU2ism55Qis=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type; b=GhyCbTVhpsdwUs/710gmumJ0quuSGMPWry2ZMrHBU/5+aHSs6niGQgY0OToPCTt3fU2bnX3cG30a5CHETcaId3inCTPRGjwlVDDkmMgX8RhniyE0i/R8kw6G3/CEJwzY6InMgWr7dQqQSj+yk0NYjqkWqEJ/UsLJOYMrvv9ln24=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is it possible to do this with ebtables :-

ebtables -t nat -A POSTROUTING -p 802_1Q --vlan-id 100 \
   -p ipv4 --ip-dst 192.168.1.1 ......

I want to put in a rule which selects both of these conditions, is that possible ?

