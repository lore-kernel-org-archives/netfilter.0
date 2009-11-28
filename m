From: Mekabe Ramein <mrmrmrmr@gmail.com>
Subject: Re: LED trigger in iptables
Date: Sat, 28 Nov 2009 10:39:15 +0200
Message-ID: <5c0c5c050911280039y623e8c40pbe69ce7fa57965fb@mail.gmail.com>
References: <5c0c5c050911241359m7c8aeccqad728fe3272cb3e3@mail.gmail.com>
	 <5c0c5c050911261315h2daea812rac027c51fd4df2bd@mail.gmail.com>
	 <4B0F94D4.7020002@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=aygE/W1X7EWGMV8cOGWw3GsN/2DdasAvKsxutayIgmQ=;
        b=tB3J3SfKQDSiYWhTIhtmqYKIOmLBmVrjZYzRK18mccfD/6Nkphfe5aaesEMqG7uluT
         jzbJkaOknZ/KwgERaaPqfU9iUdHLLedHZvQkwLJMRZOLJarxzrwKy+h15HjOmupeAa0f
         b2ON9+jxtGeSoMQzG9B40M4SrRcaelE+rm2c0=
In-Reply-To: <4B0F94D4.7020002@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Nov 27, 2009 at 10:59 AM, Patrick McHardy <kaber@trash.net> wrote:
> The LED extension hasn't been merged yet because of some open problems.

Thanks for that information.
But isn't it interesting to see it added to stable kernel sources ?
The module is there but iptables does not support it. How can I use it ?
