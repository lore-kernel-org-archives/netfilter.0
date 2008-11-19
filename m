From: "JC Janos" <jcjanos245@gmail.com>
Subject: Check whether an IPSET already exists?
Date: Tue, 18 Nov 2008 20:12:09 -0800
Message-ID: <7259d7020811182012u544a1c53w719736aa74bdbc28@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=rgqXuNaCLzasC1OUZYyHUNvqGFGziRY5nokeJtwFsLg=;
        b=BEZ+Us0pLlAhK686EqV6NSyJMTnL0542H+xADZEkfg/ghY93wFfCtxgQ7IZv3nIgQi
         f4miYYXSuKdx66eviwviNyaln1g0fVOZw1NTcKOzl+0duuH7GLR/5qL/3AkAUov7juyd
         8Upw6Kxa2hKOnIUCRZOWxf4Y0Oa46VUg5WpMA=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

I'm writing a script to manage a number of ipsets.

How can I script (bash/perl) a check to see if:

  an IPSET exists
  an existing IPSET is EMPTY or not

?

I know I can check for specific contents, e.g. a given IP, but don't
see how it's done for the above in the ipset manpage.

Thanks.

--JC
