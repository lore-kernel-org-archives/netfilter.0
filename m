From: d tbsky <tbskyd@gmail.com>
Subject: only allow packets match interface ip
Date: Thu, 22 Aug 2013 17:32:03 +0800
Message-ID: <CAC6SzHKo-F_aTnjMS_MvMivict2DJh3hKiwojR4ePzj+6ECCdw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=74vR+q1RCH3m+7MvxwXSma5EEcN5DuAmD/nmbYTJ0Cg=;
        b=iB6OAwYNO7JC2t45y+moGEouU7ycYK6PZrcn4cSV7SXXCMH2nH+xvOTmNn3aPM3LUH
         4N4uuxlCpIU+YblhBBRVqFV8zE457KarkX9t8u8YfQ1eS5W6fUsMcqIEEhgesiggQJu8
         sYG2JMfsivGQ3KmUE5WJWnMssAE/mBu6Kb/OWDTT1MV1lsl0VINuApLhMyYAHU1XR9x4
         9l/dNzwI6tv4pLopBTAGOt1U+LR8fkqQ9rbVxEAtUbPLC6zXDyw9lvBujTpZeW6bbL5y
         5KLeEMaRJxlpJJzjZj+AHrZlJtTlBObbC4sH0XJxtkz4YiI9RMQ6EvreshzKKCFBmIU7
         4+nQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi:
   I have multiple wan port and multiple routing table in a box.
   the wan port should be the final destination of outside word.
(eg: all the packets come from internet should have destination ip
address of my wan port, there are no further routing beyond the wan ip
address).

   rp_filter seems not work correctly under multiple routing table
situation.so I need to set rp_filter to 0.

   I want to know if there are simple setup method to secure the wan
port ?  or I need to use iptables to drop the incoming packet not
matching  the wan interface ip?

  the problem is I have dynamic ppp interface, so matching the ip via
iptables is a little complicated. so I want to know if there are
smarter ways to do the job.

  thanks a lot for suggestion!!

Regards,
tbskyd
