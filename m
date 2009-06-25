From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: iptables ERROR
Date: Thu, 25 Jun 2009 14:39:12 +0100
Message-ID: <56378e320906250639v18ad5fc0q96fef8a2539d59b0@mail.gmail.com>
References: <1245934611.4518.58.camel@ripper.synapse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:cc:content-type
         :content-transfer-encoding;
        bh=L5nE7QVs0B7de1ZuXEBwanG+vyNtE3SV2r5iPVcMssk=;
        b=mdmEH+D+INxzchBd+T1SvktmlsO9uHHvC9UELwmTmU4+A2tX/zM3ciRkuFwO6mmAsI
         bG2wKhHhJDflGM+tUngOQ10dtQV+vnfdEwE8aKRM900dRzXLHEm1yRIRhiqppKF/Zbls
         Rh+RSVQ6N9/2xmNVPasyd1b65UZloxLE+kPdA=
In-Reply-To: <1245934611.4518.58.camel@ripper.synapse.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

2009/6/25 Ritesh Majumdar <r.majumdar@globallogic.com>:
>
> ipset -N a_ipset iphash
> iptables -N a
> iptables -N b
> iptables -A a -p udp -m set --set a_ipset dst -j b
>

Isn't it meant to be:-
iptables -A a -p udp -m set --set a_ipset,dst -j b

(note the insertion of a comma)
-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
