From: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Subject: ndpi-netfilter v2.0
Date: Wed, 24 Jun 2015 07:04:12 -0400
Message-ID: <CACuyg24AUA7r34puJ7bOhD1tgRvqtr1LyK+M3q+anrHom=q04Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6mdMgqB89rEBzGKjY7HRu7q4PwUmS1IWyTqU9f56UZ4=;
        b=0Av/l4RMIopof2+1WDHZUBG7jIB4uB01w9WDfE6wDT8FTfynCeVifUUAFxN9Jau7tE
         g8aSGcanX6+ECyAQQvzqJYaxWE/8gNq0Qu7YSY6UZYgJLRtN7+SyoaKJhKVPJvxt/CbT
         X0JGynVlrk2rBlrBBV19C+xY0t7BjI2jKSEP/uvGE114dxJq7Kckm9eeMZL9e8UThCc8
         TNoBF/yz2Uv0KiOB8LkhCK6qgLEa4bhwfgJU5LA9S3DtSy12IOEED5jhSNtwq0T6pLfE
         45WO8DTei6ZwIXZvsNXszMyAqsZcWZvDya7+DvyVeYO7zKaWoqRNkxmJqHK0lCnZLzEi
         Jmeg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I made some fixes into my ndpi-netfilter fork and improve detection
system for http hosts. In this version, i removed the code that
requires kernel patch and include a new garbage collector to solve
idle flows. And force the update flow for each new connection.

It is working very well in my tests.
https://github.com/betolj/ndpi-netfilter
