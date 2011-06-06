From: CeR <cer.inet@linuxmail.org>
Subject: Conntrackd+Keepalived, active/active firewall cluster
Date: Tue, 7 Jun 2011 00:08:23 +0200
Message-ID: <BANLkTikiiTuiuNO-DOGjTchanAnTSDME0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=UPAZDQ5q+uSExlZcbc0RsPT3wegTVeOBu1pl+HKEyH8=;
        b=b9woHey4KtAAw/yUa7/bLwRQrY3vHIMgkjeI0GQ22Knp9L/ZRzOLWonAeHONosetvs
         RNfW8hXhByRs6THNp+kkUNqhZAIuggVdSFYdp/LUWA58DLunn27KYdN9SYFVnYypVhTt
         NLwMQyqJXEAok6wNKl4I8T6GjZWRdjcb/0frg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi there!
With the last package I got of conntrack-tools I see some config files
and shell scripts supposed to work in an active/active firewall
cluster.
Configuration files for keepalived are included.
I have configured my system in the way I guess it may work, but have
some doubts about the configuration and the system isn't working at
all.

Some issues:
=B7 I think keepalived should give both nodes both IPV resources, so th=
e
load balancing can be succefully done with iptables (as seen in
multiprimary.sh)
=B7 With the give configuration, Keepalived sometimes gives IPV
resources to just one node, the other remains inactive and seems like
a passive-backup node.
=B7 In some cases, I have both nodes with both IPV resources, but it
seems that some misconfiguration in iptables DROP packages needed by
clients connections through the firewall. Maybe conntrackd not working
properly in state replication?

If anyone gives me some clues I could just write some documentation
regarding this configuration, maybe with a little explanation of
protocols and tools being implied. Or is there already some
documentation?
As you can see, right now i'm working in a non-production environment,
but with more investigation and develop all can be done. I'm really
interested in this.
Best regards!

--=20
/* Arturo Borrero Gonzalez || cer.inet@linuxmail.org */
/* Use debian gnu/linux! Best OS ever! */
