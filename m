From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Port Forwarding Question
Date: Wed, 6 May 2009 11:25:26 -0700
Message-ID: <8ec0428d0905061125n7aad6c74nc3b63bfedf890fa8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=navwF/bBcAg7aPRdqAo64v7+KMF47sXz5O1qWdMYATk=;
        b=mN/SuqAaR38jbaZcGlNV9sqy04qrIq5VgNcWIDD2ocpiX1hZReXrJ+Bf2Y56tKoYRp
         XD6c5CYJE2/glK/BXgNdNAzskdIq+NarYHhL8zSPx+xMbY0bIixgxYU/m2/TDnfTAmP/
         7LHULZ9NHsHVs4i9O7iJ6Os3/d3h1pEYLDT5g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm in the process of replacing a crappy old 3Com router.  I did a
test run last night with the new Linux router last night, but there is
one issue that I can't quite get my head around.  On the old 3Com, a
user inside the internal NATed network, when he accesses a forwarded
port, can contact the internal device in question.  For instance, I
have a web server on the internal network with port 80 forwarded to
it.  With the 3Com router, I can, from another internal computer,
access that server via the external interface (ie, by going
http://publicaddress).  When I throw in my Linux router, it does not
do that, and user's have to use the internal IP or host name to access
the device.

Now, if need be, I'll just toss in Bind 9 views, so that internal
users get fed the internal IP, but is there a way to do this under
iptables (I'm assuming there is, as I'm fairly certain the old 3Com
router is running a version of iptables)?

-- 
Aaron Clausen
mightymartianca@gmail.com
