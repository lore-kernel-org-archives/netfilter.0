From: Pavithra Ramesh <pavithra@skyportsystems.com>
Subject: label info missing in conntrack -E output
Date: Fri, 7 Apr 2017 17:55:48 -0700
Message-ID: <CAEmwYhA7K8FS0g-forkO=FN6DMt_e9G+6O3k4cm0yo73ujCGrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skyportsystems.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=DyD2tGnFVKa+XU+e+1hrQQC7gSjU6jOGjx5AHC07wew=;
        b=WHFSnr8RM1UmLXtsB/jSoIvk0i+lWJtkJimnKrhFg6Qfji5/ck5GkrE38cJTtso2eK
         WgJ/zTVJEOo+W80fETHzG3QOs9Fw9clA8kOW8EEcJq/jMa3GelmMUPXwMiGXmsp/PKa0
         tQKCV2i4iX6FDAO3bcdiK/xe6J+rNDa3kz58Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have been trying out the connlabel feature in netfilter_conntrack
and have been able to get label info to show up in "conntrack -L -o
labels" output.

I am able to see the label info show up based on the mapping found in
/etc/xtables/connlabel.conf.

However, when I run "conntrack -E -o labels", I do not see the label
info. These are the same connections that show up in "conntrack -L -o
labels" output, WITH the label info.

I ran strace on the conntrack -E command, and I do not see the label
info show up as part of the socket recv bytes. Is there any kernel
config I have to enable for conntrack -E to see the label info?

I am running libnetfilter_conntrack 1.0.4-1, conntrack version 1.4.3
I also have CONFIG_NF_CONNTRACK_LABELS=y set.

Is there anything else I can try?

Thanks,
Pavithra
