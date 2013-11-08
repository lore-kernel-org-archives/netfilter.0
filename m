From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 21:02:31 -0300
Message-ID: <CACuyg25VT0RF7aC9Kdi2ehwjvzP2PBjn2_o=nNpgBnBtQcJ7XQ@mail.gmail.com>
References: <5278501B.4040406@ngtech.co.il>
	<CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
	<527BC564.1000008@ngtech.co.il>
	<CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
	<527C0E1A.6050003@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=r/9I6P7gU0BhG0GbmKnXkAOjP44EvcbIlNKiBjSGP6M=;
        b=FseWMaj8tCE1TAnonZKVlvVeSMNG785NF4+xPG/aYrHRMnxbsNwMgK2Syep+BjHrvC
         PtxaOJt1hTFgI1oXd0nkCLRMobp8d7pT3FZdhHsk3r+21KtNe2j/yXEKLRTxeH3ZFAro
         Ojg5ywrSRVi+yCbUvgjLxy4EfO7xLa8rD93At0VJiXbxLk/M1PjkoyijtRLHNxHIjniP
         x6Xh9zsjbSfLXqEkFbbs+5ZAnViYPhRNPhbSZ1GS4/CK5LGBn9GmL8Y1m1y+RlOPzLN0
         CtKl5v6oHo2ELA8vejVuRsnNhM8F7M5SE1Hwdk2uZ3Kw7kRsFMc7NAd9ZmN8xgNzWeKT
         vvcQ==
In-Reply-To: <527C0E1A.6050003@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>, netfilter@vger.kernel.org

And another doubt
How do you select the alternative paths... It is under the fib control
(only route rules) or using fwmark (or mixed)?
