From: Payam Chychi <pchychi@gmail.com>
Subject: Re: Are limit and hashlimit "limited"?
Date: Mon, 14 May 2012 16:01:37 -0700
Message-ID: <4FB18ED1.7060306@gmail.com>
References: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com> <FAE1FE7B-97F2-44A8-8033-05F7B39E72DF@gmail.com> <alpine.LNX.2.01.1205150052280.24940@frira.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=gSfcnKtVNUK6tjzvN0TKw4mT8iy9bOaEQtPXBlxIge4=;
        b=DNV27ZYFrexOB70AtSBghLNwdoyf2c+oZg0p9Q9Niv0C4mdV1BXUCCmFOrwcy8qSDa
         t5LH/hOrsOSNCSXIqzsSbNrbpfemTRaiTKezKRaDlkk2NxmWwgfEKumM4IAWboRbndNl
         GUPDz4dT99xY6j7Qp6NKMLBCwYGjLiaXk8fI2Ytl7ZpreWlHY/dybGY5tqNtvcFmH62f
         SRpO1flKzAebm973XBuNhXhRY3TNI5UYxviwZCmjHL0ZUhCXnjfO4SqUy/9bqh0bix9q
         sY1cEHpHOu+hbEgEyCx1DaVNnvRIPp/GAxG3W6Dqb6UWMOjkWcwoikYhBODaiugWiYVs
         R3EQ==
In-Reply-To: <alpine.LNX.2.01.1205150052280.24940@frira.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Klaubert Herr da Silveira <klaubert@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

just found it...

my initial question back in 2008: 
http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.general/35045
white paper on the issue: 
http://people.netfilter.org/acidfu/papers/limit-tbf-analysis.pdf

Cheers
-Payam



On 12-05-14 3:53 PM, Jan Engelhardt wrote:
> On Tuesday 2012-05-15 00:45, Payam Chychi wrote:
>
>> limit and hashlimit have never worked properly, one reason being the
>> system bus speed.
> Can you actually *back up that statement*?

