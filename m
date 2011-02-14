From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 14:55:02 +0000
Message-ID: <4D594246.9000302@googlemail.com>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com> <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Mv/+a4KlFEeucxN+ShF7E7s768D/UvtN08+isnc+8HM=;
        b=V0ELGi+hWmYWxrzWekgayB4KuKZOquePaxZ+WVO/W5Xnt3/3qlAw0PZlm8S0HNcKVf
         TzqumCD+jXoDdhkNDMQCpkxQ6riOQY9bNbMnfoM/vnzy2b0Or+e4y5M8lm++7hrgvs6v
         5KMeMGAkXoxdjiB9dBeKE6wQcu2Q+9CpdWDFo=
In-Reply-To: <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Fabrice <fabricedeyber@agilemesh.com>, netfilter@vger.kernel.org


> Finding the .so files has nothing to do with modprobe however.
>   
Though it has everything to do with iptables finding and loading 
ipset/xtables .so libraries placed in non-standard directory however.
