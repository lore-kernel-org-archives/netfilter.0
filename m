From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 15:19:44 +0100
Message-ID: <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=sz2392Sbq/rqo/fbWjA42K3wBRdEG9uxm9Tr8naMrvk=;
        b=C0jmW9lcZxPE8wT9TSAidskmGZiI7jbZuABrVmO62BpPsBtQuZHIwaEITag8AxVqRq
         trB+e5hyqbeaUY6YDT5s+JdIsqDQsOAI4635e69vOhViMEQn9Bj898kzfZUpHvQJV6F0
         OVKvdDwfp5B8oRgyaG+6eqoxV2Duqqt06M6Q8=
In-Reply-To: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zieseniss <peter@zconsulting.net>
Cc: netfilter@vger.kernel.org

On 26 April 2010 15:09, Peter Zieseniss <peter@zconsulting.net> wrote:
> Hello All,
>
> This is my first time posting; i am rather new to iptables, so please excuse the ignorance in my question.
>
> My personal CentOS-based webhost is under constant ssh attack from an interminable list of different IP addresses (just to give you an idea, my latsb data file grows by ~100MB every week!!).
> i've noticed that they all seem to come from East-Asia (mainly China, Taiwan, Malaysia, Korea--both).
>

A better option would be to drop ssh connections if the number of
attempts from a single ip address exceedes an acceptable limit (say
1/min - can't see many legit uses for ssh where you you connect and
disconnect multiple times within a 1 minute window)

This can be done using either hashlimit or the recent matches...

Would put an example in but need to go give my presentation at work
soon so will send one if you need it.
-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.topcashback.co.uk/ref/rhorton
