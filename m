From: Sladjan Ri <sladjanri@gmail.com>
Subject: preroute raw filter only on some packets possible, why?
Date: Fri, 14 Sep 2012 09:55:58 +0200
Message-ID: <CAH_S8NitmC6nZf859J-CA4Bic_0ep96-ZXrStb3kPDQEVUPzAA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=bbj5J3psxD+3dXQoUnTlKaEAwv1X2oW5QQLLZGxGLT0=;
        b=Yh2FgZDuURSEajyver1GxsOIN59fFyfrlc49zni7GPb24Y6+Mr+l8xoMAyFUA5yh1M
         BnoyVig5YnTUns6Kuh47wQY0+hKGofmcPzM9MhpNAiok+RrsoAgzP+Cp7pqX8byacG6H
         d336K+8fL6v6X+1v0StX04DOoi/IFnSd8oMdkRz/hkU46Rx7KZ/O5Mr+Qw55mn8Nxvqh
         ttEfW3NZWCaWRgyPn1tnAtAbN+6uLs+mw5+JJ6S5NMvP/QwozplD9IeXAtlutYTGA3f1
         34yK5d/e32GRSblgjmcNxVxHlcf5plHfECGZzDdGgC5lTtmEZ+XfRs7jNoDPOriTgeUj
         XD9Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I read that the notrack target could be used to save performance. Is
it really possible to exclude for example packets to a specific port
from being tracked? How could the target know where the packet would
go, if the target has to be used in "preroute", before the routing
decision? I am referring to this text:
http://security.maruhn.com/iptables-tutorial/x4772.html
Thanks!

Regards,
Sladjan
