From: Enrico <ebutera@users.berlios.de>
Subject: nfq_unbind_pf behaviour change
Date: Mon, 15 Oct 2007 00:19:42 +0200
Message-ID: <414e0fc90710141519s142b17c4w9b06f18e6e3045ef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=cg7qzSnfGLh3yPXg8JhB/NTWDQTjXQLBpr21Z1v+9uU=;
        b=EdUpSEzEsRHNa1RtyW4DEBNn3LM0eDiIXu9NRsQJRP6g3kkOh68h7PdFA8zkKvK7dUdu9AW3RzucyUQXGNPebZCgPcq8mFyX+XnF0E4OdYSp43zLQvXVZDaf19lb21ahQMpoFn2laO9vBgHKm0bweTMyyaY5IDXCqKrBr7I4vq8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, i developed an app that uses libnetfilter_queue and i noticed that
the behaviour of the nfq_unbind_pf function (from netfilter_queue) has
changed:

- up to kernel version 2.6.22.9 if you call it when there was no
previous nfq_bind_pf the return value was not < 0

- with kernel 2.6.23 and same setup the return value is < 0

Was this change intentional? Because of that change your nfqnl_test
app doesn't work anymore too, exiting with the message "NFNETLINK
answers: Invalid argument" (as Jorch reported in another email).

The fix i'm thinking to use is described here (see my comment at
2007-Oct-11 23:50):
http://developer.berlios.de/bugs/?func=detailbug&bug_id=12156&group_id=2509

is that the right way for an app to bind/unbind?

Thanks,

Enrico
