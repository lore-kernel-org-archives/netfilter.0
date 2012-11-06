From: valerio balbi <valerio.balbi@gmail.com>
Subject: Re: SYNACK not generated
Date: Tue, 6 Nov 2012 12:31:15 +0100
Message-ID: <CABA9q+MGsKiC9ZGtrWnq6AWmsRrV2=x=GSeJ9gEX=fdxF6GEwg@mail.gmail.com>
References: <CABA9q+Pa8eaGnYxfxqFnOvp9WCFPGEshG4Cb4JwXHqtmMvjJ=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=sZDyO/y2hnPCNsOk6faKXXffvdHvq4+U8ld8jaYBKcw=;
        b=0FwkNMO8qlOwsIZDl7xKpWW1NbrlnViXWR8wPlnBDzpd8fQT9SZngp2SwZHiGPCZJR
         uvhIbMkMhEK1Ax4eil5cmuHR+7bdL8pcP28V4Z6RnJPZ1ntsz0XEoxKUqcuCxy5aTrvM
         YoDzWG00cLiCmwWU5+jLlZqjzD3z1geMaSB4yZs5m2vmo7djPVlj9IZYP/NA24vkB3QD
         dmZakBxwLYuflrECuz1Q4bd9LenOHWXfznmUzp7coMUurRw4ue2lnCrgGBMXyw3jBCxg
         Ys0IAwVF5RLYqsF2oah57CEpDSsFm5ucPPoqQDecUNLNFN7X1jwlBn6j5AKz3z4tXgGn
         9ryw==
In-Reply-To: <CABA9q+Pa8eaGnYxfxqFnOvp9WCFPGEshG4Cb4JwXHqtmMvjJ=w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

It's me again, just for track the analisys.

Well SYNACK packet is not generated because an incorrect cksum in the
SYN request.
Now I digg backwards to identify in which network apparate the
corruption take place.
