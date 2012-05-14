From: Klaubert Herr da Silveira <klaubert@gmail.com>
Subject: Are limit and hashlimit "limited"?
Date: Mon, 14 May 2012 19:30:31 -0300
Message-ID: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=/EGvgbOzZOszDGepp/xDIkgn3FdYat2uKnA7HQ624pQ=;
        b=ctaJbGpu/mSzbwtk/LsXKA7nUSwP8kfUyrFtZgMJyY3Av9DZ+Z2mTZHtdOYSxRKJQp
         XjOA5OtxWlvtR+cS1XA8v8iwvGM/2YS34Ep5FRfp3nX9cvrT3T4W39x7tkioBJEghCQ2
         pr2B+RxBMm9j8j2692aqlKEmWFLSiJr8LJrgBvHlghYBvHp/n4BasrCzuR5Ek6FJEdIs
         7S5KadpCEYWkrl6WTCSQvoNwRU7hJzdslGFte8xpq7iqg6uUwxBBA6XG2CwBtHTD5pQ1
         cDKfp9iE5pat0/mJZ6r7A17Nl87jSMWU1BxR6tSAQ8zruJHTWCFZtej3y+B1fnqZPWKd
         J2oA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm playing with match modules limit and hashlimit, and they appear to
be limited to match a maximun 100/sec. If I use hashlimit with no
"--hashlimit-mode" I get the same, a max of 100/sec, even if I set for
exemple to 250/sec. My command setting the 250/sec is accepted, with
no error, but test show only 100 match/sec.

Is this a hard limit of this modules, or I can go above this in some way?

Best regards,

Klaubert
