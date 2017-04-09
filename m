From: Josh Burghandy <kid1000002000@gmail.com>
Subject: Open Ports for Mosh
Date: Sat, 8 Apr 2017 22:13:47 -0700
Message-ID: <CADq=pgn+W1kTtUSheCDxCKAhCTk3e287cvOZ85y=FhcBwHY5cA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=6mBo2Juso3AXIFzpzd7VatXUoe0VipXjxEMnHKMRj64=;
        b=H2gkNca2e85BQTgjgOAUW2iMcuBTb1GQL5wk9QFHiTJJQtm4CGph7Tp2gEnlnZrL7r
         TsVVzEeIY9XUGRj+JqJW/1/NAnudP+/vEmc2NP5uaq7M18G3JeGSpX0gHffeOFpv1vlO
         FbOEgUNNjOqhwZa+Th9Gle3+x7B7rXGl5uq8HvQuPk+UPgH1jgkObw6GkbyK4jcQPaHE
         uggbT4ziuG60636MODVJ5/KfRH0H2z62V0gAUPpoqmC88It9ys1seHn6iwxtN514eccN
         NQN1cB3urz/0HaW+SAk11Fj44ciD7X6g4vDcEOSKNaPFSoMxj/lggZxaK1jlBsxbItHX
         WMIw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am having trouble writing a rule which will allows mosh
(https://mosh.org/) to connect. Mosh requires that a remote server
have UDP 60001-61000 ports open to accept requests.

I have written this but mosh still does not work:
nft add rule inet filter input udp dport 60000-61000 accept
