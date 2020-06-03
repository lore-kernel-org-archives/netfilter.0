From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [MAINTENANCE] Shutting down FTP services at netfilter.org
Date: Wed, 3 Jun 2020 13:37:12 +0200
Message-ID: <20200603113712.GA24918@salvia>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter-announce@lists.netfilter.org

Hi,

Kernel.org already disabled FTP years ago [1]:

 "... we're thinking it's time to terminate another service that has
  important protocol and security implications -- our FTP servers."

So netfilter.org will also be shutting down FTP services by
June 12th 2020.

As an alternative, you can still reach the entire netfilter.org
software repository through HTTP at this new location:

        https://netfilter.org/pub/

Thanks.

Pablo,
on behalf of the Netfilter coreteam.

[1] https://www.kernel.org/shutting-down-ftp-services.html
