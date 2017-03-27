From: "Sam Basan" <sbasan@gmail.com>
Subject: Allow connection on specific port only when other port is used
Date: Mon, 27 Mar 2017 09:57:09 +0300
Message-ID: <013001d2a6c7$5b5a8f50$120fadf0$@gmail.com>
Reply-To: <sbasan@bluebe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:from:to:subject:date:organization:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=0e51kxM7YNIatfPkaJScD/mXFeQgqXn3o6kD6+T9Kx4=;
        b=A6GNeNPIflEh3c51mnAEtraihMeKCtjhhjdX4SK7kPeJskvjjK7R4KsF17AL/juXsi
         Aut079y7gUXKzL/O5yikcpf2f024URgH6rL7IiuetXgmTxnASTnKQR+pazP3XOYwn0OE
         yqNvpDMGI0G8JdV7zCXjD12D46cbGwJnrx59BF6iO3S7O9Dbzoh1MRpfpsFfEY7b/jYK
         omgGWBoi74yHmc+gPcWFZNgQk/dG8kX7xaXgmdNpZyuzY6+uj1Q25DOtQiFy4uPfgw9M
         lUlRS/+Ed/2dyXdHLxOBG2I5DEKrtCNLljKTe8wMdbiF6MafglksIwQfh+wGWjHEI/xK
         mOog==
Content-Language: he
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

I couldn't find this issue on the web.
I want to allow new connection on specific port (let's say FTP) only when
there is active session in HTTP.
It's like port knocking only I don't want to "knock" HTTP port but make sur=
e
it's active session and only then open the FTP port to this specific IP
address.

Any info on how this can be achieved will be highly appreciated.


Thanks in advance
Sam


---
=D7=94=D7=95=D7=93=D7=A2=D7=AA =D7=93=D7=95=D7=90"=D7=9C =D7=96=D7=95 =D7=
=A0=D7=91=D7=93=D7=A7=D7=94 =D7=9C=D7=90=D7=99=D7=AA=D7=95=D7=A8 =D7=95=D7=
=99=D7=A8=D7=95=D7=A1=D7=99=D7=9D =D7=A2=D7=9C =D7=99=D7=93=D7=99 =D7=AA=D7=
=95=D7=9B=D7=A0=D7=AA =D7=94=D7=90=D7=A0=D7=98=D7=99-=D7=95=D7=99=D7=A8=D7=
=95=D7=A1 =D7=A9=D7=9C avast.

https://www.avast.com/antivirus

