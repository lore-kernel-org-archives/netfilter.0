From: Sourabh Nanoti <sourabh.nanoti@gmail.com>
Subject: Adding accounting object via libiptc
Date: Tue, 19 Aug 2014 15:36:27 +0530
Message-ID: <CADTxiuzTvFCOA1NHx4kTVx5VBjq1kO7HRPaESU5WF3QcFHBFMw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=o9h0Flu/0XF4B/ZszXdKXRyZzXlgRl0TL4iwfJJArV8=;
        b=HjMNjeaATJTG2Qz3Vqocn48QOautmGbwqGtJm7/MGKZtPF1VpIY0r9bDptk48m6fds
         AZY0WqO+d1P6IztX40+v+GhxSLyHGkQZ4GGR8tlXL1Eqh/JKG5buXIIvxRPJBXOIobVa
         OnGKSJK6t6SlmSJDCRiVVdE9RuT99Q9Dzop+HpzCkRPUlpWmOMsjeHqIASxvlfjIqF7W
         jl8NtTNam6uRIJuK0LJiVwD/+8/U6pjRNeAjZN2PwmN2CQVQzuUiNYdOtS4tLdwUZB9x
         7bEciws3Yi3t73XZYOoNxrOL5J6OigWYnHViaUSlMPQa4iBpuloVTZEKkiPzAbLAwz1l
         Hl0Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I wanted to add a nfacct object to an iptable rule. Catch is I am
trying to add the rule via libiptc.
Following is the code snippet for the ipt_entry_match:

    matchnfacct = (struct ipt_entry_match *) (e->elems) ;
    matchnfacct->u.match_size = size;
    strcpy(matchstr->u.user.name, "nfacct");

    nfacct_info = (struct xt_nfacct_match_info *)matchnfacct->data;
    strcpy(nfacct_info->name,"accobj1");

I have created the accounting object 'accobj1' prior to inserting the
iptable rule.

My program fails with the following error :
'commit error: Invalid argument'

Without the accounting object, I am able to insert rules without any problem.

What is it that I am missing?

Thanks in advance for the help.
