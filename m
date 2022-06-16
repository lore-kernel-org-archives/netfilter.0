From: Gmail Support <testingforadept@gmail.com>
Subject: Support for String Match Blocking in NFTables
Date: Thu, 16 Jun 2022 10:15:55 +0100
Message-ID: <CANKwiJVSW3RjhHDnziGjWenApAcvdSAqBTi7MfHqyiyHd4_F=A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=F6DRWrLfrBZ9oCbxDsWb27fext5gqG/HsKzgiU6+z8k=;
        b=TFcvZAxvyKt1sQc+GRJvOogp8KCr0paiAho+S6qrum5JEbHYP32d7TaKbu3ReL9Vbe
         KRcL+y2KIL3/5U3YEhITqXfcgEJHiWgr9LkVn9K/gNSJOfKwNlTdh+kT7E54Tcj2QKQi
         u3qxnnxocxXNFXjGkeyv2xim4N35ZeSRQo5OGNj4ZAIYwD48yXdXaECUmUhH9EEI0lcg
         N1ZPK9kdEqd49FJpJTZL9B6t30wMITrvZIJBjWO1KMwPfjERluJxYjKHD6J+JdBDnd4Z
         YsTwQ0bDL86gwdmRzahStN6AR+1RutgPvedivJijNItCk6mBVvW0U8ZnJr5JPkoXK8ab
         ydRw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

We recently migrated our servers from RedHat to Ubuntu based systems.
We used to have an IPtables rule that was blocking packets matching a
specific application file and below was the rule we had deployed.

-A INPUT -p udp -m udp --dport 514 -m string --string
"someapplication.exe" --algo bm -j DROP

In NFtables, I read in the blogs that string based blocking is not
possible. In the man page of Ubuntu, I see a note "The  string  type
is  used  to  for character strings. A string begins with an
alphabetic character (a-zA-Z) followed by zero or more alphanumeric
characters or the  characters  /, -, _ and .. In addition anything
enclosed in double quotes (") is recognized as a string."

Can you please confirm if string based blocking is supported in Nftables.

Respectfully,

Eli Yam
