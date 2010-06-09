From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Redirecting Outbound Port to Internal Server
Date: Wed, 9 Jun 2010 13:48:42 -0700
Message-ID: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=aZhsoG2kFpNSoEXHtrU0UGUc3clQgaaRRlbkltHzWMU=;
        b=AxJXIfN16tp1R/hyAeYvJ26y5rR7DFi0DiNQ3Q86IAkWovzUe1YPShaQ2QXPPCbKvP
         6pC4csHS9M6zBx1vw/O9tw+GAxor06Z53+vCx9jPP9tewKkpXpxazo5ylmov5RSiZyFx
         l7QjL0OPXGUOMCDq8GLqApw0ZQFD9qsgP4Z9Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to sort out a way to redirect all outgoing traffic destined
for port 8080 to an internal server.  I must be having some nasty
brain fart because I just can't get it working.

-- 
Aaron Clausen
mightymartianca@gmail.com
