From: "Cade Robinson" <cade.robinson@gmail.com>
Subject: RE: Default netfilter kernel buffer size?
Date: Wed, 25 Jun 2014 09:12:46 -0500
Message-ID: <001101cf907f$8b168930$a1439b90$@gmail.com>
References: <007501cf8685$69b9a460$3d2ced20$@gmail.com> <20140616093502.GA8007@localhost> <01e601cf8966$ed0b6450$c7222cf0$@gmail.com> <CALFfGYbhKy-jTPJwbow_g67ykyq89dnZBmyjX-VJ9B-QMaxTrA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :content-type:content-transfer-encoding:thread-index
         :content-language;
        bh=+0wWPICeixsv/WyWA0BRzzw3jfrwwSZc4GFs4sKQWGI=;
        b=Ln5r4mxOtkd7O0rEhXcOgiIRvNsos+pLzBAHn8ztu+18pGS6Of209UXW7J2a3MoKtj
         WOxuJg84J08eXmPh/mdActs2SIXEfrC5wSsq1HkV1SDgFSmlG1JDIGvuOeXYvvGf4zX5
         BwD+JyG0szGiRyP9l02NCkYtUDDcbCxCJUPJYNk7/gZRq2OFJ23hCnwA0uSabNsyORbG
         7gCQLjRen93QcLr5/zeaMIyVU6reYq3VgeKaRxV1aUYdmKmoabd7l5nKCqBSbcqsush2
         S2z+CRVgnjd6ABtc4xJFGM+EFMgMFobsI2LRz9R11+dO/lKc4PGVgWxTpgIZIRfKkk7b
         5NEw==
In-Reply-To: <CALFfGYbhKy-jTPJwbow_g67ykyq89dnZBmyjX-VJ9B-QMaxTrA@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'SplitIce' <mat999@gmail.com>, 'netfilter' <netfilter@vger.kernel.org>




>Cade, did you resolve the problem?

>> But what I am looking for and can't find is what is the default queue length
>> and is there a /proc file that shows the current length?

I haven't found the default queue length so I keep trying different numbers.  
Would be nice to know the default so I can tell where I am in tuning the queue.
Also haven't found a /proc - guessing there isn't one.

I was going to look at no ENOBUF errors to see what that did.
Also was going to look at a possible automatic rebind/recreate of the queue.


