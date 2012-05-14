From: Payam Chychi <pchychi@gmail.com>
Subject: Re: Are limit and hashlimit "limited"?
Date: Mon, 14 May 2012 15:58:58 -0700
Message-ID: <4FB18E32.30205@gmail.com>
References: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com> <FAE1FE7B-97F2-44A8-8033-05F7B39E72DF@gmail.com> <alpine.LNX.2.01.1205150052280.24940@frira.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=g0zeJBQFm00YQaGoj5nTOkQ/tRs+KIyuIylKgztH/ts=;
        b=Ns5ZziSj+gVqdaWNsADrsrmfTzgjz1pnbyrjsEi8pQTUKrJ2ubjLhRFyj7b8tQP88b
         Z+omB0ovSQc3t2nqB6cvcpuaDQqgufG8IfCdWHo8IISNXby6e6NlfN0BMefNHLuaYMMJ
         KzO3yfKm5yoYNYxrhpgEHe9kcX2VIP6Za2Wg+J8Z1RApdUe0gbXRCx1ag2QjFyz5rL7l
         JBE1QL4gOtRGeKpycWffCDyZzTlvDZW8T0KhE1UQ57Tm1wzmQuAOU4w5xrdDNrOJE3+w
         mL3W43w9tSLbZa2M+SC/DUoYvm1UzghQE1v4mfd89iob7sytovddytczyOYeuSuopdiJ
         HOQQ==
In-Reply-To: <alpine.LNX.2.01.1205150052280.24940@frira.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Klaubert Herr da Silveira <klaubert@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

its well documented and initially came to my attention about 3 years 
ago. A few people even wrote papers on it and the testing they performed 
and their findings.

Its been a while so perhaps a google search and a bit of reading might 
be required but it is most def a known issue

-Payam



On 12-05-14 3:53 PM, Jan Engelhardt wrote:
> On Tuesday 2012-05-15 00:45, Payam Chychi wrote:
>
>> limit and hashlimit have never worked properly, one reason being the
>> system bus speed.
> Can you actually *back up that statement*?

