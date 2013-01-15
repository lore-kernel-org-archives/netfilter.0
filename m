From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: state match is obsolete 1.4.17
Date: Tue, 15 Jan 2013 15:09:29 +1000
Message-ID: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=LnYX5NdJUpwTy3m9XhVki4Uq+tEbUdaHX9GSaugoFWI=;
        b=Wjm6xcjpXeTC0H1D7m+s//t/qlMysvVGTYFAdg7plUMaQRQNMnAzOaolL75AtGSxLV
         NkjP/m1ryTUYIu3QhQXx0pJ+hXjN/bq8CH6l2QF047iNR4tJD+R+dfQC85+IqkWASxDH
         EZIZIQdVksLHnaKEYR3sO9cS23TQhI1etqO71Y8Njuotor1UBzncCu4lr1duGwtY+oLC
         mmiHdRdHGfT7IrPoDZMw9XCCOk0oVkaAeA2glLNvsqNoRXbwaognXwTQDr8a+OFoeFJG
         XJOX9mvAc5omkSIQGHv/qK1aHd6KrQXhRJKi4K4sTLuosVwziJqKGlyJq3IE1WoTD3di
         nCIw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

WARNING: The state match is obsolete. Use conntrack instead.

Getting these errors since upgrading to 1.4.17, google shows me a lot
of people getting these errors since 1.4.16, with little in change log
that says this is obsoleted that I can understand anyway.

Am I right in assuming that :

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

must now become :

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

or does that not do the same thing?

thanks
Niki
