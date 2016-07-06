From: Antonio Prado <thinkofit@gmail.com>
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 10:29:03 +0200
Message-ID: <f51a7158-07dc-ea52-6da0-17c3b659aa97@gmail.com>
References: <loom.20160705T084958-392@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:cc:message-id:date:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=ZSMzaZOI7ssMUoeiM/tz18j0r9MmtHO9s4hV+gnBGxo=;
        b=H+cdHPh2JZS4aL52ypqh0a5V4dujpOfK4o41iV26o/7EPPX//VqX0/WZk+yvFI7/qa
         9FinLi/xp/ms1kbDxH4XWhrfp5nO8GYSIBytE9YYG/gOAPJFMXTVeZRYzcPw3ErSJPPF
         ztXGm+0NYIIHNk42R/uFfu8uJ2VgVRdbvkRSiFnNz6wk8j7jwLN2TG96EY/PLXtk9ox/
         AkvPK/jGAgHtDBOZqGm89Avo04NGKRvKDXZ20MizM6bNolhliGlIts7i/rnnNL+fCQKj
         lX5AsLnBhJPWhC3AKwMpoDnPJzX1Gn5sWwszKlGM1rZk0uDlG/pYuswQnEzcjYD/a8cX
         RewA==
In-Reply-To: <loom.20160705T084958-392@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Day <conna666@gmail.com>
Cc: netfilter@vger.kernel.org

On 7/5/16 8:53 AM, Josh Day wrote:
> I'm curious if anyone of you has read this article 
> https://javapipe.com/iptables-ddos-protection and tried any of the 
> rules/settings. I read it today but I'm not sure what to make of it, so 
> thought you guys could maybe share your opinion.

"methods to stop DDoS attacks using iptables" ?

"DDoS and iptables" are words that should not stay in the same sentence.
trying to block a DDoS using iptables is a nonsense, actually, because
that kind of traffic fills the pipe before your iptables-tricks can play
a role.

--
antonio
