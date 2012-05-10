From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.12 released
Date: Thu, 10 May 2012 16:45:36 +0100
Message-ID: <4FABE2A0.1010107@googlemail.com>
References: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu> <4FABCF96.7080105@googlemail.com> <alpine.DEB.2.00.1205101627180.19418@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=CbppeRU+v6BMs52lOCyxvUMLaJc5WbX9AljyeT9Z98M=;
        b=kmXItDkFjFfEhilqu8pE6NvmV46lBKDb52r9TkQOwuPiv1LKP4/wVD8b6HPnAIXIiE
         0n+VypUeorb6wiUeFIhjSlxYs1G+deIrbHUqWyWa3nKQdswkNb3ojI+Z4D/1PB/BeFv0
         WcaLAT6qZJe7nHA36XoC7WSFz5OKXl4EK9EZm5fQAGBeA28FraKd3OnvLag9kNHF1Qy6
         M4t6zB8/OejI4DPYC9Bb/ns7wPoW6bbdgbVY5+FR8wPc0+tw5Z1l7o1UJeRbqoucijba
         21eYUaDq+hDvHvJ/C8IkQyuZsLBPk5C4AkpnavIQgK1igTdHayO3DUyulyOX9KiwLGKj
         3rTw==
In-Reply-To: <alpine.DEB.2.00.1205101627180.19418@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> No, it's for the userspace tool. The set types can be compiled as dynamic 
> modules (shared libraries), instead of statically compiling into the 
> "ipset" binary.
>   
Got it! I always assumed that the userspace modules got compiled as .so 
files, so I must have been looking into the future ;-) . I also assume 
that I may configure which modules to include and which to leave out, 
right (otherwise I don't see the point of this feature)?

