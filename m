From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 2 Nov 2009 15:21:39 +0000
Message-ID: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=PgFj9UufOaBQUQI4jjEwqq1VW7xNT49hvEnFLmb4L/k=;
        b=gVxicsbQMtO3QA971jtzobNZcgLRGrpqQSRetQjB/qXa26d3xgrTvMQ50I8szFN0wH
         6Cz4N7Kwj9a3ZPSlFxeEjPFyv4uMgRw9nIZ8Axb7oLr+J03TEOsmmKvC0CwcffhOT8oq
         +DIJHI6vLWE7jZ+rsrVfOqHBCnFRLg7y/DL1Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi there,

Normally I think of firewalls as controlling packet flows that pass
through it (for example:Internet to Intranet).

Can netfilter also control traffic on the same subnet? Is this a
typical thing to do, or is it more normal to deploy local hosted
firewalls also on machines?

Suppose I had the following set up:
Internal Machines 1,2 and 3 are on the same subnet governed by the
netfilter firewall.

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ---------- Machi=
ne1
Internet ------ Netfilter Firewall ---------- Machine2
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 ---------- Machine3

Suppose I don't want Machine1 communicating with Machine3. Assume eth0
is internal Netfilter interface. All machines are in the same subnet.
The Netfiler Firewall can be considered to also have typical linux box
with router capabilities.

Is it normal to have the firewall restrict this kind of local subnet
access even though it does not technically leave the network?

Would the rules be as follows:

iptables -A FORWRD -i eth0 -s Machine1IP -d Machine3IP -j DROP
iptables -A FORWRD -o eth0 -s Machine1IP -d Machine3IP -j DROP
iptables -A FORWRD -i eth0 -s Machine3IP -d Machine1IP -j DROP /*
redundant to previous rules? */
iptables -A FORWRD -o eth0 -s Machine3IP -d Machine1IP -j DROP /*
redundant to previous rules? */
iptables -A FORWRD -i eth0 -s anyIP -d anyIP -j ACCEPT /* allow
Machine1 talk to Machine2 and vice versa. Allow Machine3 talk to
Machine2 and vice versa.*/
iptables -A FORWRD -o eth0 -s anyIP -d any3IP -j ACCEPT /* allow
Machine1 talk to Machine2 and vice versa. Allow Machine3 talk to
Machine2 and vice versa.*/
