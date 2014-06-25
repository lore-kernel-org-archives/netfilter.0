From: Kamal Kumar <malkarikamalkumar@gmail.com>
Subject: Sub: nat issue in netfilter
Date: Wed, 25 Jun 2014 19:02:57 +0530
Message-ID: <CAJQ3KZWTUWAZ4VHq-tt86FY=cZnC1qhUBn5AqccaqQaE98BVhw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=xBgX1E0HZNqbpwXLSDt70Ly8F9X3nFwmPyIRwFruNFU=;
        b=u2c9lfpJ6Gsr1OySr8kI2WyvErPrdktxVnl7hIli7+IK+tzka+O7FFCqIDfTA2NzDL
         VTnjM0FEbGg5D8WhwXmN/A+jJr/XqwQvtxAO7HH+aa5e1Nj/+1izfScxgWfw0nkSLvLb
         bCMivEQnMTvVNeZauuKwzlZGQxIyJKWegoPHzLKVKlZRcafmxiJjFcJ+YKibirx5tBw0
         mAmDNDKlGbMEiEX4aUgfI6cl5HZyga/10zq44pSe78KEjW+zmL6u7WZEsrK4LIf/n0nP
         Z/N+6VOEcjXE5FJTNCj7g1+8M9klq2nCfa/2iqtiLQbxyIJY86K4FTk2dDJcudkXXwtd
         n7SA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear netfilter,
                     I have an issue regarding nat in netfilter. When
I configure the following rule "iptables -t nat -A POSTROUTING -s
0.0.0.0/0 -d 0.0.0.0/0  -i eth0 -o eth1 -j SNAT --to A.B.C.D" and run
some ip traffic from eth0 to eth1 found packets from eth1 with
translated source ip A.B.C.D, its fine but when I flush the nat
entries with traffic running from eth0 to eth1, I found packets on
eth1 with translated source ip A.B.C.D . Is this a problem if it is
then how to overcome it (when I flush the entries I should not see
packets from eth1 with translated source ip ).

                                        Thank you,

                    yours failthfully,

                     M KAMAL KUMAR.
