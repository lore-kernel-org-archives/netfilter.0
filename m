From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: hw flow offload - nft crosscompile
Date: Sun, 21 Mar 2021 16:02:12 +0100
Message-ID: <trinity-c583801e-440f-4896-b57b-50538760320d-1616338932701@3c-app-gmx-bap32>
References: <trinity-69642984-5c45-4c9a-ab31-b7585e0351b9-1616260101092@3c-app-gmx-bs65>
 <trinity-48a4e364-4207-4305-9d25-7ce61a6b167b-1616327912998@3c-app-gmx-bap32>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1616338932;
        bh=iz6FxR/L0z/clIFghHGGwsFDf+PY9kq/cEtKz80xiWY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=POn96RhzPAFENqcqNpucearjKvFN29Ix8o0SDd0iu9b7ysPdAjnllc+aBTe1uhmGD
         In7TZQ0vzpwWtoGIWSMGVq8C8edJkaTP8Rzxu6qUYCOWNguYeLibu3DN6FkXwvzgwq
         +Iwip5M5cBXJj9uSLqAR5Eb5fgfKcsjpj5uu676M=
In-Reply-To: <trinity-48a4e364-4207-4305-9d25-7ce61a6b167b-1616327912998@3c-app-gmx-bap32>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

Hi,

i got it working

http://forum.banana-pi.org/t/new-netfilter-flow-table-based-hnat/12049/30

except a printing issue on list ruleset it works as expected :) maybe i can fix this too

regards Frank
