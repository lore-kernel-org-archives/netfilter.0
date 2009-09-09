From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Difficulties with unclean module
Date: Wed, 9 Sep 2009 16:37:38 +0200
Message-ID: <17e3a8f80909090737q69f834efmfd10887d38d7c6e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=B6FAAyNLFRX8KWxWkYuNu4rP7DlNVs4WypxjbTdwKIc=;
        b=uKTT7AzifTYDHFATBiME8Iqic3XIDprIe8NmCQZnMuKAEgrmKLllqrPHASKJeqh8S3
         ixkkFCl4U0sjRClU/L77CQSW7dhadH3LrTWOaVaKb9PTlr1oHb/aeYy3tW5QcUYCwiAL
         GEqSBNboevOmLzUecVkbfr+5lPWvFkkxruu6o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I am working on cofiguring a router and have stumbled upon a problem.
When trying to use the unclean module I always get the "No
chain/target/match by that name"-error, no matter what table, chain or
target I try. An example of an iptablescommand that generate this
error is:

iptables -A INPUT -i eth1 -m unclean -j LOG

I can=B4t find anything wrong with it and the module seems to be
compiled and installed. Has anyone encounterd this or something
similar and/or know what is wrong?

-Kristian
