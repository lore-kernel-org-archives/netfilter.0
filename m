From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: setsockopt on connect()
Date: Fri, 28 Jan 2011 13:01:17 +0530
Message-ID: <AANLkTikXMg-_wdHeucsRgxDnsnKz0z9SASSaFC4PDBwZ@mail.gmail.com>
References: <AANLkTinspcu_VoTV=wrcBf=Ana61pj1c7DwT-z40idsA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=aovAYHWK1eAjctm68P53Y8M73RHd90X0nKiy2WHBMlk=;
        b=u7Z9TbiTnmbYU6UaHSCG9ex5EEOO21VQW4l2+GQbIR8EM3NAxqzTx3aw/PnzSVfGAJ
         5SwOrsvQnIQ/FXe9s9wtj5+eJadPIBN0tgmat7hauv2kR4cUNla83s4DMQzLIyzIflwJ
         D8C96Z6fpBSibPgdd4SvDV8emI6RbKv9gOJSI=
In-Reply-To: <AANLkTinspcu_VoTV=wrcBf=Ana61pj1c7DwT-z40idsA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org, Netfilter mailing list <netfilter@vger.kernel.org>
Cc: Jan Engelhardt <jengelh@medozas.de>

why SO_SNDTIMEO have no effect  for   connect() system call ?

i found FAQ here at (question no 3.5. )=A0 of
http://www.faqs.org/faqs/unix-faq/socket/

-Ratheesh
