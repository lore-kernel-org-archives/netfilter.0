From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: RE: [nftables] Log to DNAT rule
Date: Sun, 11 Oct 2020 21:31:33 +0300
Message-ID: <002501d69ffc$bfe94880$3fbbd980$@gmail.com>
References: <dfc15fba-2fff-a658-c4db-fc0a64603fb6@bersol.info> <1b8888e3-f368-73d0-c8cc-b4e04ff4901a@bersol.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=e0YKDP4nTgnG+vANJMifYgbby45DLROuvDjaGAW2xCM=;
        b=tiC4Nf+Lygjz8TsH0hgmiueQBHvtmuYWpzynsp84vtBFwQY1fztAxppFqTGbyMb4c/
         eSAALw9FMWBKDUzB2eDstUA+7SrEg7s+7syknGut7fvCTDA9UbUGqN4VB1hHEOyfVmAs
         22h8j3EH7yxosAUk4I0k46C2Jn1Gscol2yCazd0FmPe7MhD9RewmMSpVRFTATY9uh2vZ
         v0CKkC5dssJBr3KR1Gk9pRYYsdEGWaNHY0UgUQqR2SIIg0jGPCa60qRfHivMSq/ydVlP
         NkqIL+fzS5FbQGRw1kQPXQ2val74vcPLbiK62VN/Nv5dwSDRvRmDr/ZmozAtwlMr5Baq
         ThWA==
In-Reply-To: <1b8888e3-f368-73d0-c8cc-b4e04ff4901a@bersol.info>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

You can try to use the "ct status dnat".
https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftable=
s_in_10_minutes#Ct

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

-----Original Message-----
From: Alberto <alberto@bersol.info>=20
Sent: Sunday, October 11, 2020 1:43 PM
To: netfilter@vger.kernel.org
Subject: [nftables] Log to DNAT rule



Hi everybody,

I'm starting with nftables, and I want to log SSH inputs, but I have SSH
port in another port with "prerouting" with this rule:

-----------------------------------------------
table ip my-nat {
  chain PREROUTING {
      type nat hook prerouting priority 0; policy accept;
      iifname "enp1s0" tcp dport 9999 dnat to 192.168.1.3:22
      ...
-----------------------------------------------

If my Input rule is the following...

-----------------------------------------------
table inet my-fw {
  chain INPUT {
     type filter hook input priority 0; policy drop;
     ...
     # Ports permit with DNAT...
     iifname "enp1s0" tcp dport { 22, 9999 } ct state new log prefix
"[NFTABLES] SSH: " accept
     ...
-----------------------------------------------

But this log any try to 22 port (there are thousands daily), and I want
log only conections to 9999 port, because only on this port, return =
login.

If my Inputs rule are the following...

-----------------------------------------------
     ...
     iifname "enp1s0" tcp dport 9999 ct state new log prefix "[NFTABLES]
SSH: " accept
     iifname "enp1s0" tcp dport 22 ct state new accept
     ...
-----------------------------------------------

It log nothing.
If my Inputs rule is the reverse...

-----------------------------------------------
    ...
    iifname "enp1s0" tcp dport 9999 ct state new accept
    iifname "enp1s0" tcp dport 22 ct state new log prefix "[NFTABLES]
SSH: " accept
     ...
-----------------------------------------------

It log everything, another time, is the same as the initial rule.


Any Idea?

Regards,
Alberto


