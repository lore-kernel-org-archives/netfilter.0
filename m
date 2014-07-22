From: Sourabh Nanoti <sourabh.nanoti@gmail.com>
Subject: Fwd: Performance issue with iptables and nf-accounting
Date: Tue, 22 Jul 2014 16:49:02 +0530
Message-ID: <CADTxiuwmMMCy8y44Z7-59TP683c8mifDTAk5sfYTp-pnxUoK9Q@mail.gmail.com>
References: <CADTxiuyVJ_MB3G82P0PbTfYk1KtDd8W=FArraKeJZGDZrUz99w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=182/Apf5L3gDWli7EO2vDmbi0eouUcw7aCiIEy4O/FA=;
        b=PlKOEQ1oWbw/nyOTWKJCPCh40+tU/43S1J5D+3I4NBFa8B7pm1NglsBUQxmxEh4Jf4
         yrO/3Gs5IdPKufx7QoJ5lFKLMLWQgKsZtiZJcHdVpUkiVo/S1IrMKBgGd6JdtIdoGK2X
         8DdSAb5sm8vl4gq+BgVfORi5nLa4uSUEUEtXXwvD670TUS60juHgp9UrrJpAwnzqNZEf
         IGtfzac0H9XtxnUu1TVQY0DP7yzrLhddZCtAhXKi7j688WkgfzVVdTc2YBpaTj7AUnax
         V/xuV5kRnEvN/HJ1YVUSTVD7jfcf10ZjJZkP5r7lshI9j6wmKHqolhOPo2lei+KDPPin
         YtsA==
In-Reply-To: <CADTxiuyVJ_MB3G82P0PbTfYk1KtDd8W=FArraKeJZGDZrUz99w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a customized target while inserting iptables rules. The
iptables target module modifies some part of the packet and routes the
packet to the destination.
With this setup, when I enable the netfilter-accounting, I am not able
to reach the performance numbers that I used to get before (enabling
nf-accounting).

Has someone faced a similar problem where in the performance of
iptables slows down when the nf-acct is enabled?

Thanks,
Sourabh
