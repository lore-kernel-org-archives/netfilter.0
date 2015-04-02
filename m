From: Justin Michael Schwartzbeck <justinmschw@gmail.com>
Subject: Connection tracking stores wrong port for DNAT
Date: Thu, 2 Apr 2015 11:00:29 -0500
Message-ID: <CAGEc96kf8zFrcXj5Q2b1cTV9LC_pyfh6EDV_DjGD1Y3BDT9NCA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=JbQXdP/tyGtdgqen2JWi1RECJXC8bhn1TU9YNi6uc6Y=;
        b=SlgNGSy68JXgXJsV3FU3ncEyBu+HBIGi4TtNvZHMS30zkTpW6aywbjducnO5BPDj6z
         FHj0IFUXLh7V8PlkL9/fVwoOtH4xiQWEa0NJhNgfXSudhDfQ4VNDICugPfLYnDfZok8N
         0tWoKBureY3l6IcUNtM5SxROGt31JPWlhKkwx3IFsnZ+HrK6UoXKzM98FTnsq8gXl2+S
         D2EB8qf2wpeF0moqQWTjcS5eU5yxiA0GueW32GPHOfdfIyNDWbj9aPl5HBUYByyrnxUt
         nzHLkDvNnWuKT+tnJa+qws2eq9tmJbQE50IeBGGfHE11m5Xk/fEEv5riIDtGYOm0jnvM
         +Qew==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have a box that DNATs incoming HTTP/HTTPS traffic transparently to a
proxy server and also masquerades all other outgoing traffic (like a
NAT box). I am using the nf_conntrack_find_get to try and find the
associated connection for an outgoing HTTP connection from the client.
Here are the details for this packet:

Source IP: 192.168.4.1
Dest IP: 23.235.43.73
Source Port: 60324
Destination Port: 80

When I create a tuple for this packet and do a lookup, it is unable to
find the associated connection. Now here's the interesting part. When
I do a cat on /proc/net/nf_conntrack I see the following line that is
associated with the connection:

ipv4     2 tcp      6 299 ESTABLISHED src=192.168.4.1 dst=23.235.43.73
sport=1048 dport=80 src=10.10.1.5 dst=10.10.1.151 sport=8080
dport=1048 [ASSURED] mark=0 secmark=0 use=2

This is obviously the associated connection with that packet. However,
the sport for the client side is wrong. It is set equal to the dport
for the reply tuple. Does anyone know why this would be? How exactly
does connection tracking work, and why would it be showing the wrong
port here? Could this be because of the IP masquerading? There must be
a place where the connection mapping is done properly otherwise the
IPTables firewall wouldn't know where to route the packet in question.
Is there perhaps another lookup function somewhere that would give me
the proper information?

Thanks in advance!
-Justin
