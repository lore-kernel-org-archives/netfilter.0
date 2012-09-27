From: Joao Pereira <joaopapereira@gmail.com>
Subject: ip6tables REDIRECT support
Date: Thu, 27 Sep 2012 14:17:34 +0200
Message-ID: <CAAq25NTpN5bvPyHKfQ0e-rHU2OWg+Sjb00mq=rVKrt1c9POctg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=hwlh3ofLEG4g61nkXxdCQhdbUtpPrPiCQUVgMxIDY0Y=;
        b=qMQXcoc9wgoS9jaHM29w+MNLvfRjFg0Skqii0e/XTqddZYgmL/aG0hl2zxOBOH73nR
         ONkErn7XQUOJBkufncgFUTEbhXeZNAQQzQ6gLZLpI8SYR3AGHALx5QS//e3IUeHtH4I5
         r1+CYcEV7xFo1wMNEvvqJB433RQZs35ueXNTjVvJtJy+S+As00GLavjh5kqjRjxzJ6pR
         svBNqeJ29o28RTE2r+uupwHFyMSR0tAvR6fFLhiUNI7qUsOh1fCjyWWg9JvZcN63qunh
         fPuEY4jcKZ6YCPAyOWSQI71O6jlvuizbZUet3a6JyJuRKsH5gYOqknZGKmEZnxZpZ5EI
         NbVw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,
I found a thread of last year with one announcement of the creation of
a patch to implement NAT on ipv6. I know that with IPv6 we are not
supposed to have NAT anymore but i have a problem that a need to solve
and the REDIRECT of iptables was the solution for it in IPv4.

The scenario is the following
I have one application running in machine A, and a server also in
machine A. I am sending one request from the application to the
server.
I need to make this request pass through another machine first and
only then land on the server.
I could do this by adding a redirect rule to redirect the traffic
using the port.

I found the patch on http://lwn.net/Articles/468671/
Was the patch applied in any version of iptables?

BR
--=20
-------

Jo=E3o Pereira
