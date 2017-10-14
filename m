From: Imran Geriskovan <imran.geriskovan@gmail.com>
Subject: Re: Can I use iptables instead of hosts to block adservers?
Date: Sat, 14 Oct 2017 09:38:46 +0200
Message-ID: <CAK5rZE4grQZhSe3zrOTX_Hh-Ui1KbRKz32w7LS-DSxMK5uXY=g@mail.gmail.com>
References: <20171014010204.GA1316@waltdnes.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZGunQsGEQnaLvG8+u4+thTyFDKNvs3SWpD94eTz6vTw=;
        b=cAQALCdgv2hrgM3Km0BshKe9tbSJcOHhDqK0uMNv3JtSYVtlLoyep03S1zDEzYdkGp
         O2IXzTeJcx+lzNS1TeIIZaeJdjmuAl/mai6TuVJh8th/ypHSBSNBAOiYptI5z7rOUM6U
         p+2jntDpoh8CllMu3JnbY8A0EZW7cIQ/lFMY0gYvQcEuTK8ZDHpB5HfyS3Zs6XGY7Fti
         w+BVoARgj3xl645zdYBbB+3qZ97v9nKWo+mV3t+fOrqdggUsWe8O2zpNmS1JIgty1u+q
         PGzn1mbNOdqeQ//m3zBnUvhtmAT7LN0rGGGugjM+vPE1fB8nXQ2OZuB/lW8NG8i473fh
         0mMQ==
In-Reply-To: <20171014010204.GA1316@waltdnes.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Dnes <waltdnes@waltdnes.org>
Cc: netfliter list <netfilter@vger.kernel.org>

On 10/14/17, Walter Dnes <waltdnes@waltdnes.org> wrote:
>   Rather than blocking by ephemeral names, howsabout blocking by IP
> address?

There may be multiple "virtual" web domains on that same ip, someof
which are adservers you want the block and some of which are valid
ones that you or your users may want to access.
Depends on the ISP setup.

But "in general" you may assume ad companies operate their
own dedicated servers so most of the time your above appoach is ok.
But sometimes not.

May be they are too aware of this and they intentionally have
virtual server over a floaiting set of IPs which also serve valid
web domains to make counter-measures more difficult/complicated.
