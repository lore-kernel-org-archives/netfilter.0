From: Mahmood Naderan <nt_mahmood@yahoo.com>
Subject: problem in openning a port
Date: Thu, 12 May 2011 08:05:32 -0700 (PDT)
Message-ID: <713633.15807.qm@web111723.mail.gq1.yahoo.com>
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1305212732; bh=HIgjKe8yQhCRqfYj+CGcEob1WmgGhNy62+O6RXcsDqo=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=eSB44ZZ21uNZ33hKJqucXYgrJOMokrnKsdRlMlKpA90yrnibtyc7CS7CN2iuGBzR5rCYentOkFjhExkIdQ89Cu0DPND0hv6cmqBCMLjkerOiDnq/qfmL4IkirJT/sbULrbUb0ND4flxoKGfxjZkIgeuouiLvUJvtJt3roUszDxQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
beofore openning=A0 a port, I checked which port is open:
=A0
mahmood@client:~$ netstat -an | grep LISTEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:111=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
LISTEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:22=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 LISTEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:15002=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIS=
TEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:15003=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIS=
TEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:38304=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIS=
TEN
tcp6=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 :::22=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :::*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 LISTEN
unix=A0 2=A0=A0=A0=A0=A0 [ ACC ]=A0=A0=A0=A0 STREAM=A0=A0=A0=A0 LISTENI=
NG=A0=A0=A0=A0 3488=A0=A0=A0=A0 @/com/ubuntu/upstart



Then I opened a port with


mahmood@client:~$ sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 4=
949 -j ACCEPT
[sudo] password for mahmood:
mahmood@client:~$=20


However netstat doen't show it is open:

mahmood@client:~$ netstat -an | grep LISTEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:111=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
LISTEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:22=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 LISTEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:15002=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIS=
TEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:15003=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIS=
TEN
tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:38304=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LIS=
TEN
tcp6=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 :::22=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :::*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 LISTEN
unix=A0 2=A0=A0=A0=A0=A0 [ ACC ]=A0=A0=A0=A0 STREAM=A0=A0=A0=A0 LISTENI=
NG=A0=A0=A0=A0 3488=A0=A0=A0=A0 @/com/ubuntu/upstart


What is wrong?
// Naderan *Mahmood;
