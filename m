From: =?ISO-8859-1?Q?Far=E9?= <fahree@gmail.com>
Subject: Stateful port redirection?
Date: Wed, 3 Mar 2010 17:48:49 -0500
Message-ID: <653bea161003031448i233ecaap18afa475241b0704@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=i4zx0rP5bjFmyjxAzeeOOz0ToV/D9sZqUb+bZIJvMOw=;
        b=VD0lxuVRD8lXSAea9bpdv4ig2Ytfj+cGkpw7q/noN5/W6+3bWWrjNTkTVhgXKZtuvf
         2goBUdIbORGF5CTkQN3f2+9sldtzGE/GD/VzjZ/U4rMmReqnh0QsGD7u9MPLDhnVVnEI
         syKN7IOPPej49Ztcep340ceoVrVKIHGEGhuog=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Dear netfilter hackers,

I'm studying options for Hot Upgrade for servers that require high avai=
lability.

Is it possible using netfilter to
a- redirect TCP traffic from port 10000 (visible to the public) to
port 10010 (invisible to the public)
b- change the rule so that that traffic to port 10000 is now
redirected to port 10020 (also invisible to the public) *except* for
packets associated with existing connections, that will remain
redirected to port 10010.

I can imagine that others have needed this feature and that it already
exists. Or I can imagine that nobody bothered about the connections
that were lost. I can also imagine heavyweight ways to do everything
in user-space, with the old server passing the TCP socket fd to the
new server over a AF_UNIX socket.

So -- has it been done before? If not, how hard would it be to add a
packet filter that would do that -- and that could be updated
dynamically to switch again to another port, etc.?

--#f
"I object to doing things that computers can do."
        =97 Olin Shivers
