From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Are limit and hashlimit "limited"?
Date: Tue, 15 May 2012 03:34:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205150333380.25932@frira.vanv.qr>
References: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com> <FAE1FE7B-97F2-44A8-8033-05F7B39E72DF@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FAE1FE7B-97F2-44A8-8033-05F7B39E72DF@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: Klaubert Herr da Silveira <klaubert@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tuesday 2012-05-15 00:45, Payam Chychi wrote:

>> I'm playing with match modules limit and hashlimit, and they appear to
>> be limited to match a maximun 100/sec. If I use hashlimit with no
>> "--hashlimit-mode" I get the same, a max of 100/sec, even if I set for
>> exemple to 250/sec. My command setting the 250/sec is accepted, with
>> no error, but test show only 100 match/sec.
>> 
>> Is this a hard limit of this modules, or I can go above this in some way?
>
>limit and hashlimit have never worked properly

Best is to collect packets using -j RATEEST and then matching
against it with -m rateest.
