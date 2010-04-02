From: Dennison Williams <dennison.williams@gmail.com>
Subject: Re: MARK not working
Date: Fri, 02 Apr 2010 13:35:27 -0700
Message-ID: <4BB6550F.6030204@gmail.com>
References: <4BB53BEC.9010709@gmail.com> <20100402065742.23be08f0@catlap> <4BB59C59.50607@gmail.com> <alpine.LSU.2.01.1004021328480.18189@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=OifW/AJ7N37O0qlR3ERxD/glAJaoJkte8iGbzj+Z66M=;
        b=TSdVkT1gtc97MoPlgJ2ehLJufliMiR0kPm9FUa9qGLAVw8HI27ye2vpIffUusFwrGc
         kvnt6Z3Cl90+W64o63GCB7IgX2WhqIfcTSyldTkdvTRDaQ+XTMvqEj+83lbcGWrcSwDf
         Q/QYZBWqrrjRCRDiPZ9JM0oSaui2A2C3oA388=
In-Reply-To: <alpine.LSU.2.01.1004021328480.18189@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Jan Engelhardt wrote:
> There is your mark-1 packet, and right above it is the ESTABLISHED
> rule that catches all the other packets that have this condition,
> including those marked 1 which are subsequent in the IKE talk
>   

Right you are.  I messed around with the order of the rules and noticed
that the packets were in fact getting marked.  It turns out I
misdiagnosed the problem which seems to actually be with the vpn
software not encapsulating the packets.  Thanks for your time.

Sincerely,
Dennison Williams
