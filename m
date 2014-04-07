From: lejeczek <peljasz@yahoo.co.uk>
Subject: 192.168.2.33/24 & 192.168.2.33/29 on the same box
Date: Mon, 07 Apr 2014 12:58:00 +0100
Message-ID: <534292C8.2070301@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1396871880; bh=nbpAN/oi7ewEagYlnFx2ecQ3YMIfdvbwvVpRUj+d99c=; h=Received:Received:Received:DKIM-Signature:X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=CX4a6rqvqAT+Z0v71gX8gCEyMiOrQ2PPX9g/glfH2HjS94Ixw2prmRQ9CSK4NbTMHTiF7j4Uhb10t8ySb7QVEpbEvPjR3eMJM0JGo3kIJ86ZMKADqnNlIu2tqCPNKvWnDhy6t0fd9GdkTeQMpFFGOj1pKZT6ZJCr019WOAlAwFY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1396871880; bh=nbpAN/oi7ewEagYlnFx2ecQ3YMIfdvbwvVpRUj+d99c=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=dgNw3VqUVf9ow3jIL18HSO/33/6cSY+9yLwVlUA4T5KwBManplo7DW+9/Z5l/hozNckcduLrEFldf1RgMgvtoLhhn4c2NBObTu5Y5ThwN9JTn73/4CZlt8ZRrD8FiFA5um/Pd/MfAXPvPNuY6oRkAFCq0b48Tw6pu44bpbg/230=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

hi everybody

I'm hoping an expert could help me, clarify this one for me, 
should be simple I guess, probably not for a newbie like me

having on one system

physical eth 192.168.2.33/24
and a
bridge (only taps no phys) 192.168.2.33/29

I cannot get to anything behind 192.168.2.33/29 from 
anything behind 192.168.2.33/24 (and vice versa)
each side can get respectively tofurther-out interface of 
the 192.168.2.33
routing + forwarding I have it set up all I believe

is such a configuration even valid? should be, right?

I'm trying to understand subnet concept of, in this case 
class C private net - is 192.168.2.33/29 still a part of 
192.168.2.33/24 or it is a whole separate network.

regards
P.
