From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Tue, 11 Feb 2020 12:47:47 +0000 (GMT)
Message-ID: <alpine.DEB.2.20.2002111243370.6759@tornado.local.jubileegroup.co.uk>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com> <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk> <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463800020-1173153301-1581425270=:6759"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=Cc:Date:From:From:In-Reply-To:Message-ID
        :MIME-Version:References:Reply-To:Subject:To:User-Agent; s=uk;
         bh=Y1AVrEUt+mEJSt8LD2iMmataMhNxMLNpQZSc9+3/MEA=; b=ryx5RwSPahbv
        5fvchYmxbL1PLeLfKpv5nZ/FwTCuQRsGCqwBgpOon+VB+jvFRhz3kC3vQ4VtvLOv
        o/wlBcppUBzim2s27Zcm9XhfLPm94rRvJ/irI+/WWzgJh8A3KPXYmlRhFgg28q34
        mQKy/MmB//PcpSUHDtV6rjodBlpWqr8iiFWECJkIp9pPlPbxULj2It6uMvL9xG9C
        tiNx9cGjIuMIuGgauS/urdOLQqSqnWf7u7D7XgPkzQd2doQVx54vh1Y1uv+GoKO4
        lt0Jadq7qH3M185iXWBz/s9JWk4ASL9saxdI334EOZLrHCot0G0rfSQjKuMNMjL4
        ubQzJvnFCA==
In-Reply-To: <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?EUC-KR?B?vufAr7yu?= <ileixe@gmail.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463800020-1173153301-1581425270=:6759
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi there,

On Tue, 11 Feb 2020, 양유석 wrote:

> Do you mean the remote logging like rsyslog?

Yes.

> We did not try since syslog does not emit at all. Is it worth to try
> though?

Like you I have occasionally seen strings of NULL bytes in the logs.
It has appeared to me that something has tried to write a message but
failed to get it to the disc because of kernel disc write caching,
which can be many seconds of data.  If the messages go out over the
network, to a server which does not crash, they can have a better
chance of reaching some permanent storage.  There are other tricks,
Mr. Millar's suggestion is good too.

-- 

73,
Ged.
---1463800020-1173153301-1581425270=:6759--
