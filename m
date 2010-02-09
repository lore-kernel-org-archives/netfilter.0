From: Khalid Mehmood Khan <kmk_pk@yahoo.com>
Subject: ebtables snat-arp option not working?
Date: Tue, 9 Feb 2010 03:30:50 -0800 (PST)
Message-ID: <113681.28960.qm@web112607.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1265715050; bh=wJ+ZUXtS8XcX9uCAq0ebE7tZqekns0+J5iziHqgjNYo=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=6m4FjUL7ON1bUhlFWa9VNMuk/422Whv0m+UKCO+p2MnyrTmb/K9FpwDS9tRKqzCQs/JL/FYWvvP0BEILoGU5q2pq5bsFX4Sy3q96EyRxQKYV+2Y0lemLHjeNgcAap0tWX8qeSLS1kSV76I0v3sO0oqSXamsYlOEurIlWZG0sykY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi!
I'm using ebtables-2.0.9-1 (rpm install) on a RHEL-5.4 x86, and a having problem with "--snat-arp" option. The following command gives an error when used with --snat-arp option.

"ebtables -t nat -A POSTROUTING -o eth1 -s 0:2:b2:1e:cb:83 -j snat --to-src 0:1:2:8b:4c:87 --snat-arp --snat-target ACCEPT
The kernel doesn't support a certain ebtables extension, consider recompiling your kernel or insmod the extension."

If the "--snat-arp" option is omitted the command works fine.

Thanks.


      
