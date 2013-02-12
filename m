From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: LOG target with MARK?
Date: Tue, 12 Feb 2013 11:02:54 +0800
Message-ID: <20130212030235.GA16352@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=/aXSvP3DU8a+lD9JsQOzP78pigEL0kkZbt6lVJAUOAk=;
        b=sBAu3459iFiSLIdW58iZjO0gxwuszri2P8orBvmw7vMM5LSFJeYI8o/DiI18JVoDUN
         P+oboA+q/YuPx4ZlQNmAiRBoLmgf0GcaGeVKqjug40TKrAvN8urAALI9jM2RjYM8bSdX
         +77eqsfHodOp0k4QBtv8YRSIyvfeSPGB0MaaSPElW4syP0Oz8avaERbRX3S3MD9Lw9aV
         T34Hbwx0eKdoAIUtR3maJr71VXYUBOnIdO2Lkz6l0bjI+iV18wyxK3/RHNc6W8/yNGlA
         AubfTjOB/LERlNbVfKRCyUbySqH+bYj/A7Ex3uHUK+wETsLSxOpgfv/Y8Xu0UOl9HxPE
         kzug==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

Looks like the LOG target doesn't output the mark of a packet?

I checked -j LOG --help and there's no such option, so what should I do
to get the mark of each packet and print them?

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
