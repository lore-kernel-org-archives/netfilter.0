From: Pranav Desai <pranavadesai@gmail.com>
Subject: Use string match to make routing decision on a proxy
Date: Mon, 23 Mar 2009 17:27:27 -0700
Message-ID: <cc64e8ce0903231727o39cbb1deia8b446af11fb181a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=4VWovZBMuAIDeyfh07A86R2XP0Q2ZMhF4uaS8zugLf8=;
        b=DlwcSbZR8203g01xdeVUJW9w67FM+iKdz0rKL901XtJXaWbzh+2Kxv+E3IlCJlw7yV
         4nRrjNRQKiQ/+BWdnfjlD3i4noADTrHXpr0x9E5HaryN4ZtOeHR0WhtqWN7W2nScWLFf
         DXtkXLJuQP0f/wjr6aoOgFzNnHdBESpfw870k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello All,

I am trying to figure out a setup for an http proxy to send only
selected connections to the userland and forward the other
connections.
                       proxy
                       ------
                       user
                          ^
                           | GET /test1
                           |
client ---------- kernel ----------------all other requests
--------------> server


Anything that matches GET /test1 should be sent to user land to be
served by the proxy and the rest should be forwarded on to the origin
server.

Here is my iptables rule.

iptables -t mangle -A PREROUTING -p tcp --dport 80 -m string --string
"GET /test1" --algo bm -j QUEUE

Obviously this is not working, since the SYN/SYN-ACK is already been
processed so the connection is already set to the origin server. With
the above rule only GET packet is QUEUEd which doesnt help.

Whats a good way to set this up.

Any ideas ?

Thanks
-- Pranav
