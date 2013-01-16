From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: connlimit performance
Date: Tue, 15 Jan 2013 18:54:03 -0800
Message-ID: <CAJygYd0dc63P0Xx+TAcX23CV1H5GT41DJ0MtEJSdEEqP42t_ng@mail.gmail.com>
References: <CAJygYd1435Juip=6rMVyF5oQ7F53+eMB_ezAptJ0OVy7N02=aA@mail.gmail.com>
 <alpine.LNX.2.01.1301151012570.16853@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=aVgA+8tx/w5VnoqJEG6vRmL480sdiRc2+cYr9TGZ+p4=;
        b=renCPFiOejZNJ1qu5l/6EhBD7EU4wu8J/YEwPiAjzrYB54dZ/2Krd/2vHYJKZfefuF
         6u4iBnH7J8RFGZhdZUnG+poPc/ZkrOaH/d1uNA9dxBEfivAGhyvIU9m+lpr7kBjpm2/P
         qWmUMNXkXVncUFgypSufpKxvUFY8V9oOuM5I9JBtna/0OzdEt27u81LQ4VDazz8haSSz
         6Air5Km09Qr+cSmi8vf47LIBNpZGuglyQMffhHN5z+wbSaASXOQA4Dq7Bi2Qyl767++1
         i7eXRlf2/GhN4dzptkeA3ydMZ4haPWwlXHwvz4qMDY+tdIvdhodnq5epewI2olXmn3TG
         Atbg==
In-Reply-To: <alpine.LNX.2.01.1301151012570.16853@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@inai.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Any chance making it configurable ?

On Tue, Jan 15, 2013 at 1:49 AM, Jan Engelhardt <jengelh@inai.de> wrote=
:
> On Tuesday 2013-01-15 07:32, =E5=8F=B6=E9=9B=A8=E9=A3=9E wrote:
>
>>Hi,
>>
>>Is anyone here have experience on connnlimit performance?   I am
>>trying to use it to limit connection per dest IP (about 1K of them )
>>on a 100Mbps firewall.  (without only about 70k connections) and as
>>soon as put this rule in, cpu usage sky raise.
>
>
> connlimit uses a fixed hash table of 256 buckets and thus a lot less
> optimal than hashlimit's default table-size of 4096 buckets (assuming
> a machine with >=3D 1 GB RAM and 64-bit kernel).
