From: Honsha N Kalita <honshank@gmail.com>
Subject: Need help in usage of netfilters : SIP Conn track/Nat
Date: Mon, 30 Apr 2012 13:39:39 +0530
Message-ID: <CAODcSkkLpEoK3otMZEeTu3Jux3duSbesSB3DoW0YN+7RJoaWrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Hh6KIwcRoKbY3j0E3R84MTj6A8kKmF6ApIpyBj1/X8A=;
        b=fZyra82TAd4dvbSZQTTTt22AGlT+pBrCcQ6lGuFyWgGfBzKBE8ZHKyiSnqkJDmuWeK
         f6CBFpaR43zQ6gCG1sRfgZgwro6IGh0YHuDkPEZZTWsUIB4UlLJJpiv/SYVVrrvNSeDQ
         8P5KufVbU4xXFqu5pH8+LYCZ6sjZAYKLlOb/uFZgxdbbJGnU1+Fa5p4nAzCIgvxs3GiR
         xQ6xwso3QunOWowoJkzihTyMHYn78qODCR3wjxByD3YznNgqtp/QeZmHoS0mJBjswCHu
         1kXCreAEJdvhXtYBdQNxd86SaQhNBL5hftY+Y1mYwCoyfRjX5ZA1mgr1TH9OIBpgNHFR
         Ty1Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

 My aim is to a) modify IP Addresses of some SIP headers and SDP
message headers ( as SIP traffic passes across my node) and b) also to
capture values from some of them. [Basically I want to develop a SIP
ALG].

 After exploring further, I found that 'SIP connection tracking/NAT'
netfilters might help me in achieving this.
 I have enabled Kernal Loadable Modules "nf_conntrack_sip" and
"nf_nat_sip" in my kernel.

 What I want to know now is--

 1. Is it already proven and tried fact that I can use above KLMs for
achieving my purpose?

 2. If I need to 'use' these netfilters how to use them? Should I need
to run IPTABLES commands from userspace and refer someway to this
netfilters ? Any sample commands??

 Or 3. Should I need to create a KLM module in kernel space and
directly call the APIs available in those netfilters modules [ e.g
..net/ipv4/netfilter/nf_nat_sip.c and
../net/netfilter/nf_conntrack_sip.c] ?

 If that is the case, how can I pass those captured information
towards userspace application?

 or 4. Is there any alternative way to achieve above, that you are
aware of in kernel or userspace ?

 My kernel details:- Monta vista linux, Release 2.6.32.46 for mips64.
[ I am new to kernel programming though I am from SIP background ;
hence my questions might involve very basic concepts , apologies for
that :) ]
Waiting for your suggestions.

 Regards

 Honsha
