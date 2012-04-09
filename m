From: Aaron Clausen <mightymartianca@gmail.com>
Subject: NAT Reflection on Gateway with DHCP Address
Date: Sun, 8 Apr 2012 17:10:19 -0700
Message-ID: <CAEH2fGxT9-F48ZT5zTm4HFY2U6ywZXxGKSXMwEaM1oRO2gK6Hw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ZLg5kjonYhv1NqK0gSwnZrwJhlC2DN5Q3SN/Ztwbw6E=;
        b=xC7BmCjOrv9W45t8avafVkaz0V+XYNtFIq5uCM6zeDHKSLM5cZDnE9TqrYAte4BwsV
         aRMJtroMu7bx9wn39sW6Q3fZH8UGQxNH7GyfP5UwAe41B3+FNX1659skDIxStjnMqclU
         wJVf+b3y42EbFbBEqPMu43RtKqIHTbNub2dhImPdXiiUeu4vphH914AAUpwASBnxMv4t
         JwKz8nyLwqrq9DFL/W10lKjhsc7VboOzq0jVLBV3h9OWfCUcxxx8Vv32XaXvUMxR5/R8
         dc99AdSx7ai0UCY6lV+rLKFviXUf48DfnaFNGfDP5cHGk9BYmI2Z/Se+WT0SqhP9xleE
         jxQw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to sort out how to do NAT reflection off the public
interface where that interface's IP address is supplied via DHCP from
the ISP. Any thoughts?

-- 
Aaron Clausen
mightymartianca@gmail.com
