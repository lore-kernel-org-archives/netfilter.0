From: Jeremy Hansen <jeremy@skidrow.la>
Subject: Routing LAN to external IP from behind NAT
Date: Fri, 13 Jan 2017 01:14:55 -0800
Message-ID: <F7FF15A4-8565-43D9-985B-5F66DCC224B6@skidrow.la>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skidrow.la; h=
        x-mailer:date:date:message-id:subject:subject:mime-version
        :content-transfer-encoding:content-type:content-type:from:from
        :received:received; s=foo; t=1484298897; x=1486113298; bh=KKnuJ7
        yn4wOtAFKS2wksX1WtoN21SkMMQ2buuHH70LM=; b=eScR+cQafXg1Enl8CDrH+X
        qd+VmvyLJkltx71LYtOXfvukEGZGPHVuFp0cOAY+Mh3M7VC95m/QM42dUeX54yXj
        FTX5jKcU1G1WQOXtb2v4tPhuXjP5ExVs9zcMFe6cFBONKGBuXvqbmm4NSN49Z9Id
        dlYJXb4Y9b/c2j6BCpJJo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

I have a Linux firewall/NAT host on my network port forwarding specific =
ports such as port 80 to a host within the LAN.  This works fine when =
I=E2=80=99m connecting from outside of the LAN.  What do I have to do =
with iptables so I can access these things from within the LAN without =
having to do something like fake dns so it uses internal IPs to access =
these hosts and ports?

Current ruleset looks like this:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20
LOG_AND_DROP  all  --  43.229.53.68         0.0.0.0/0          =20
LOG_AND_DROP  all  --  46.148.18.162        0.0.0.0/0          =20
LOG_AND_DROP  all  --  159.226.35.207       0.0.0.0/0          =20
LOG_AND_DROP  all  --  111.224.46.7         0.0.0.0/0          =20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state =
RELATED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:80 =
state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:443 =
state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:25 =
state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:587 =
state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:143 =
state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:993 =
state NEW,RELATED,ESTABLISHED=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

Chain LOG_AND_DROP (4 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 =
level 4 prefix `HOST DENIED: '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20


Trying to connect to port 80 on the external IP from within the lan =
results in this:

telnet www.blah.com 80
Trying 111.114.34.128...
telnet: connect to address 111.114.34.128.: Connection refused
telnet: Unable to connect to remote host

Thank you for any help.

-jeremy

