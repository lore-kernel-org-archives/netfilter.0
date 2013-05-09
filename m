From: Al Grant <bigal.nz@gmail.com>
Subject: loopback between tun and eth
Date: Thu, 9 May 2013 18:12:08 +1200
Message-ID: <CAODtcdeizmjL37M_E+bYckJQtz+UE=QDXOfpwfcGdy1O51pGNg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=khavBA5inkIw6HCR9Mdjd63zT4AL7sOaestOPvbXYD4=;
        b=ga//ZtAMLKwvkeYdtGakE8rHgsz7vojgwmkJsA1gNEb2QZYhGhFkU7dQjHFGUY18tS
         qIWXbWFqvXTq1PIkRqctRE+7ZxqAfbypJei5qrt6Ua3nW5nYwdU3wVUc+hk0Wh0n3bpi
         rAWdmUsgPbKYgYvzrYtpjhqtIYisGugL0Sp8Nc10nWUQMc6ZsIF/qGSZq0+PmU/BtOSl
         57kLOe6HLBrZzKIqvlpPlLwN+f/0BhgwT1v9tBH5BK+knhIsh/0E9u4K6VVLWUWS1jRy
         r/ou/ksk/Q4Q5GwhIMR58mCHcU9aK7g1+I6qZgwd6JySoE+HTjNHsy8EZfCzmg4LoYsA
         y8wA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi All,

I have a QNAP NAS which I have setup as a OpenVPN server. The NAS is
behind a modem/router which is also the gateway to the internet.

I have a routed OpenVPN connection to the QNAP NAS.

The QNAP subnet is 10.1.1.0
The OpenVPN subnet is 10.8.0.0
My LAN (client) is 192.168.150.0

In the router on the VPN server LAN I have a static route for 10.8.0.0
to 10.1.1.2 (QNAP NAS IP and also OpenVPN IP) - so there is a return
path so to speak for clients on the remote lan when accessed by VPN
clients.

The strange issue is that when I connect to the remote LAN I can
connect to all remote clients using the remote LAN subnet addresses
(10.1.1.0) *except* for the QNAP iteself (10.1.1.2).

Apparently this behavious is due to no loopback connection between the
tun and eth (someone suggested QNAP did this by design, but I dont
know why).

Anyway, the question is - is there a way using iptables I can fix this
loopback problem so I can access the QNAP/OpenVPN server on its remote
LAN IP? (10.1.1.2)

Cheers



--
"Beat it punk!"
- Clint Eastwood
