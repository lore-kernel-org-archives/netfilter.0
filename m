From: Omer Anisfeld <omer.a26@gmail.com>
Subject: =?UTF-8?B?ZG9lcyBuZnRhYmxlIHN1cHBvcnQgZG91YmxlIHRhZ2dpbmcgdmxhbj/igI/igI/igI8=?=
        =?UTF-8?B?4oCP?=
Date: Wed, 23 Aug 2017 15:26:17 +0300
Message-ID: <CAEUkJZvRyPM3VzOVtsqfidJEL=yuk5mu8qXLBQ=qCwp2f8igYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=V0WCkhn4CnZNzsxDlUzHO5S7ivXL0C13v3zeZGzBTz8=;
        b=OQwQMosqYv6v3H2v6zgkZdGj/8o8mZ20BVSujRh+Q+Inb5bMzxpufcYJxrbYFzIHXl
         VviS7LOqfOAgamRrGpc2/6kuxrksK9aD22hOsgR42UdlHr8eAi6HdB7NXMq0t/8MGKZ9
         LSF577Yx3rP2y/ta1XJubj/d20sIswy21J6fAdqUFs63TbiZNN9mHlDlu+31sPwNRWgc
         CFqwYCH/BYqlMlzKsfcPl5Qa2nPgiJv0DNxwdIj6prxIQ3Rjwzx9mvOYEJUoRM8csmEq
         srcjDHto8/rV5o+/4TmQ7osbSyWzaCiH9NrFJzzAQqF3wY4YWo9nNpVWEQPUAq9CPueh
         agWw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hey All
 .My name is Omer, I am currently trying to make QOS based on nftables
in Ubuntu 16.4
i am trying to make filter chain (in a table) that has rule based on
the inner vlan (also known as double tagging vlan or QinQ) . there is
a field called vid but for my understanding it refers to the first
vlan id
? is there any way to perform match according to the second vlan id
and is there any way of define dscp and ip precedence as criteria for
riles to set meta mark?
.thank's
 best regards
