From: "JC Janos" <jcjanos245@gmail.com>
Subject: ipset returns "Zero valued IP address" when trying to add '0.0.0.0/7'
Date: Tue, 11 Nov 2008 21:55:55 -0800
Message-ID: <7259d7020811112155j5315d0e0ke9bc7576e927ad76@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=2qSaSzoA2YTOy0ymnBWsxn9rqIihZFPeo/RLZmm+1qU=;
        b=tGMupXdU74vyyzsQUJWM+NJ63/gYnux47TwCjIXqdLqxyMTEf4HJcUAoZ1tWfKUfEr
         I/hETWq460nUXiclBKETTQDd3sRi7NUD8yFPiQIjBA1LvoGe4uVx4nkG4RhDPkNJ8bUY
         FPI+zxsDHqm7HzQZJF381LhQyAobyitjKAwAc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm using IPSET to create a nethash typed set to contain a short list
of "bogons" as defined @
http://www.team-cymru.org/Services/Bogons/#http for eventual use in a
firewall rule.

But for one of those defined nets, ipset fails to add,

 ipset -N BOGONS nethash
 ipset -A BOGONS 0.0.0.0/7
    ipset v2.4.3: Zero valued IP address `0.0.0.0' specified
    Try `ipset -H' or 'ipset --help' for more information.

I can certainly use the "0.0.0.0/7" in a rule.  How can I correctly
add it to an ipset?

Thanks.

--JC
