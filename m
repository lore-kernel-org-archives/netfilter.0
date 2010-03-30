From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Brouter basic question .
Date: Tue, 30 Mar 2010 18:31:05 +0530
Message-ID: <cfeab66d1003300601l140102e0nd8111713140044b5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=R5OAjjvce5Rho/SEGgx1pXpT/RgKn1YgKbX6VWO/P+w=;
        b=NIshg5bnS/uY1HH2U6FksMxne1qwisfKzO55cJ2/LhGYW8/gil4B/e6WSoxZ4f9jrB
         M7FIu6Y3iaufJxttjZQdH04zFS40qrZs0QkEvDVjKCItuxEebRIw7FhV4UidD4zPTBuC
         ZvuysmM0ZeuEQV1+TZGyE/rhPA9/k6gX9Ibp8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi ,

 i have a rule

           ebtables -t broute -A BROUTING -j ACCEPT .

So packet wont traverse any other chain ?  ( Prerouting , Input ,
Forward , Postrouting ) ???

Thanks,
Ratheesh
