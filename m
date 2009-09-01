From: =?ISO-8859-2?Q?Micha=B3_Sewera?= <michal.sewera@gmail.com>
Subject: how to log NAT for overloaded (many to one) nat
Date: Tue, 1 Sep 2009 15:26:11 +0200
Message-ID: <875a14c20909010626u49a4dfacj4ade5e27b0862a99@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=kfLp5eqRzec9BjQrQADWwpjsDoQTX+/+sZ9FBXNXj6U=;
        b=GfEJNC/dgZWcAidWwrDKXZtsPuBd/j/YjhLRPhlGTLcfhJsoSu/91HCzNFgkGL/WX2
         mB9NBu2R/P4hRLhxa2jE26MF+PlNw1QM/LYBPWOtKb1LeBhbMhYWruEem+HOL7bdaw0g
         VXgSnghHiNE35Dtdlf7iQcGJ0Ks6sGe0V+6Ps=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

How to log the full information required to identify what source port
and ip address was assigned for translation for many to one NAT ?

thanks
m
