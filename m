From: "Omid Mottaghi" <omidmr@gmail.com>
Subject: 3 bridged IPs, one server
Date: Fri, 5 Dec 2008 20:29:12 +0330
Message-ID: <2d835f4f0812050859n61781309kad71eb695bca5b15@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=zJ5Yh5ZQfUy6WoA5He2gJh8tXoWkv6iWUWgQ/G8rnWk=;
        b=wcIRuUQNeufkNlN3nNj180Uo2KGCk4BFiHFm4OQiOQjlsVpPiFS1ywQZ3XI6La6D4+
         TCH2y8LWItbmKc633znrtkbGttQ68XL0MTgck77StrEa8qv9GT+twNf3BcGdc0ZSCqX2
         QgJUMG/4tMkPzATd42FoWMgh/9gt7d1vnGNq4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I have a device (A) in my local network binded to 192.168.1.200.
Another device (B) in my local network it has two network interfaces,
one binded to 192.168.1.100 (B1) and another one binded to
192.168.1.150 (B2).
A remote server (C) with w.x.y.z IP.
And a destination host to request to (D).

I installed an squid on C and an iptables on B.
B1 is the gateway of A and B routing its packages through B2.

Now, I want to send requests from A to D through C.

--------------------  B  ---------------------------------------------
   A ----> |   B1 ----> B2  | -----> C (squid) -----> D
-----------------------------------------------------------------------

I really need your help.
Thanks for your further replies.
