From: Didier Gaudin <didier.gaudin@gmail.com>
Subject: Tracking/statistics forwarded packets retransmission
Date: Tue, 4 Sep 2012 11:13:44 +0200
Message-ID: <CACjL_QW0UDJouVF3j6Wv-L_SWidMc=b3aUeG=zLbBn8qwA6T3g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=lZzngr4tNFx5t8Y3VqPyMCe0g3lsnZv5VqlPiPhUS98=;
        b=NY/hI7NDdZiARLpKCGB8aOZqVLkPJfGKkeE9sdNdMtpChhLqecydbyBIYRTyazJ6JF
         DT9vQJX2HQmspHPDoOJbnDLWb5/bCl7a1F8xWreSYKwX1STV7jsKg8RqqXkxIJrskCeX
         rPmLLnEHyzIw35jw8Ea3TTDRqPxh0nwNMFtysQJcbUahOLI56pBHUYgAdU77RIlQNcqZ
         IOOXP+Qcj5Q6u9PGnAgETD51aV8P+yuMAvsx5/tDhLZqLfwVU2K3vHc14WNfoU8Ri7Oj
         adbBYQUS5AkYCHogM77jww0RlVfd41+A5kJirQs8gou1AExYk5C6rvYsb6zCDZHf4YT6
         JZoA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
is it possible to view the number of retransmission not for local
process (netstat -s) but for forwarded/routed packets (like
packeshaper's network efficiency) with the conntrack ?

Didier.
