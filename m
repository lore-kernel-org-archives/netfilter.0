From: "Philipp Periventas" <coin3d@gmail.com>
Subject: "NAT redirection", or NAT from inside to inside?
Date: Thu, 14 Aug 2008 11:17:00 +0200
Message-ID: <bcc0d0530808140217y37de308cj5bee8c0b64971a4c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=q1P/VhtDo7KDbA21FZo15PD5Jyhwq4KjO8lBXqPt8V0=;
        b=Nrkb7z750P3re4v/VsF4XixWgnwcIs/SYc/y5GMaqxrmS+uCihZn12zv6IuSxesHqf
         2TLNQj/S/IvpxpsmnWWu4+CgwRDScmD5q1ErRWk00cKaBTlxW7LppHyPrOtqWYpRArnt
         F6sGlOj9Zqo1HB7NdXGD7vft5TmupjORlhLlw=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello there,

I've got a server, running two virtual machines on it. The server
itself serves as router. I forwarded some ports, among port 80 to one
of the machines. The port forwarding works fine from the outside (from
the WAN, e.g. my computer at home) - but what doesn't work is the
access to the forwarded port 80 from INSIDE using my external IP. That
means, when I try to use lynx from my webserver, and enter the
external IP, it says connection refused.

I tried to rebuild the problem with my own home linksys router, but it
worked! Then I found an option called "Filter Internet NAT
Redirection" in my linksys webinterface, and after activating that, it
didnt work any longer.

Finally, I'm looking for the iptables command(s) which offer exactly
the same features as my linksys router does - permitting LAN-clients
to access LAN-services by using the EXTERNAL ip of the router.

Has anyone an idea how to resolve this "problem"?

Thanks in advance
