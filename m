From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: iptable rule addition has no effect .
Date: Fri, 5 Mar 2010 11:03:18 +0530
Message-ID: <cfeab66d1003042133r1ed729b4rfe6569e000643bc4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=2TWsOq2UsK7Km0qAGlxKXuCwErFW3GyA7vRKuaA+ziw=;
        b=MGthPOUlitGV31nuMoAzc7WdH+KljXHu8eB4HSpFBJ3CmSi6dXhCxmGfUGmvZj0hyl
         PMtOD6FCCiWMZCEFwealhssVXZ/S2e1KRtGqSLJTzq1odaoF89NCEbplZJBxiQd9Sa3C
         yGLkL8cB8Y9wGnxaviLTAn5df1DfO6vFnCg4k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

i m  flooding  an interface using hping with UDP packets .

I have a rule

    iptables -A INPUT -p udp -j DROP

I can see all packets are getting dropped . i can see processor
utilization is high using "top" command and system becomes slow .

But while flooding , if  i add rule

iptables -I INPUT -j ACCEPT .

still packets gets dropped .

 But if i  stop flooding and start hping again { with same rules }  ,
packets are accepted .

Note : I am working on an embedded enviornement  with 128kB of RAM .

any hints is really appreciated .

Thanks,
Ratheesh.
