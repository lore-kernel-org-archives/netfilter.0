From: Frank-Ulrich Sommer <orofuhin@gmail.com>
Subject: Correct syntax for dnat in inet table?
Date: Wed, 05 Aug 2020 18:04:10 +0200
Message-ID: <F31DCA98-C7C6-4C25-9B97-035E10C96ED0@gmail.com>
References: <6D405016-FCB8-44C5-86CF-EE18A9F75839@plutonium24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:message-id;
        bh=UAvnJFxNNTs1VqizDiWU/aUk9L1iOPMj8nYki7udukk=;
        b=iNpCuzNoT0KOvJpll3p7B/59Ubqi1XREt2bfv+BH3R4y/a4yTnYTAxXo0OeR5IOKF+
         Z9D02mKpETVXl5339xZKlwjH7nu77xaNZ52K/DpbgYYuinUPrshgVrdUXO9HwLVtkxdp
         Jkb4oBrHHz7H9tl+FjdWyMGPrag7yV8qn27897oBcDSPMZZ2Ih8IGX6Dmxcj5jZpfbbs
         YweM4uhcKy16KbbY9w8z4y+vUyeRYIRRaE5sfJq8AJOA6Hqas6nCpXGTMwPF23IVfPW/
         PJniC8tGcu0J/gxizl53XKjrObNpqUrTQsH03D6tiFqpWigHPueLGwkw9yEOPZUiOkq6
         bSUA==
In-Reply-To: <6D405016-FCB8-44C5-86CF-EE18A9F75839@plutonium24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



Hello,

I'm using "nftables v0=2E9=2E0 (Fearless Fosdick)" on a Debian Buster base=
d Raspberry Pi OS=2E

I'm getting syntax errors when trying to redirect a port to another host v=
ia nftables=2Econf with the two lines starting with "iif eth0=2E100"=2E The=
 file does not contain a complete setup because I removed all rules not rel=
ated to the problem=2E

The first line produces "nftables=2Econf:10:41-42: Error: syntax error, un=
expected to, expecting newline or semicolon"=2E According to the manpage I =
would have expected the correct syntax for an inet table to be "=2E=2E=2Edn=
at ip to=2E=2E=2E"

The second line without "to" produces "nftables=2Econf:11:56-56: Error: sy=
ntax error, unexpected newline"=2E

What would be the correct syntax if I want e=2Eg=2E to forward traffic to =
port 1234 to IPv4 123=2E123=2E123=2E123 in an inet table?

Here is the reduced nftables=2Econf causing these errors:

#!/usr/sbin/nft -f

flush ruleset

table inet myfilter {

  chain port_forwarding {
    type nat hook prerouting priority 0; policy accept;

    iif eth0=2E100 tcp dport 1234 dnat ip to 123=2E123=2E123=2E123
    iif eth0=2E100 tcp dport 2345 dnat ip 123=2E123=2E123=2E123
  }
}

Kind regards
Frank



--=20
Diese Nachricht wurde von meinem Android-Mobiltelefon mit K-9 Mail gesende=
t=2E
