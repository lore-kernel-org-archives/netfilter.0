From: Susant Sahani <ssahani@gmail.com>
Subject: NF_STOLEN and reinsert in to IP stack
Date: Fri, 29 Jan 2010 18:08:08 +0530
Message-ID: <d81115a61001290438x5421fe62m651f9b23680d893f@mail.gmail.com>
References: <d81115a61001290428j558f6ea9tf5e61dd27b0022af@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=HpDHqfjkcHeBbZdWZrQBSUipzT4LjKkYjgwxBIPgkTs=;
        b=XH1jl20Q4G5pPKBmfU/2fwrQS+fpGkWMN/D+6dXjm9VCnS7jnBlo3/Glz6GiVccqes
         nvJS/1Io2QDuFQHzB+Tds6odNLk8XpP2x++I/LBh5PtAb8sTzDDQbK/VJiijcIIbzv12
         EvGyTv1fH+R3uvgss6zjw/HGfIuMGNCDGIx8Q=
In-Reply-To: <d81115a61001290428j558f6ea9tf5e61dd27b0022af@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

 Hi,
 =A0=A0=A0=A0=A0=A0=A0 How to reinsert a packet into IP stack after usi=
ng NF_STOLEN.
If I do a nf_reinject it crashes .

Thanks,
 susant
