From: Edison Figueira <efjgrub@gmail.com>
Subject: CLUSTERIP: no conntrack error
Date: Tue, 13 Jul 2010 19:18:40 -0300
Message-ID: <AANLkTinWzfnYgN0vTECKfgYxUPYynPr0OHVfgEbZyRfj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=aEiQZ1jvL7917eOGUctUyG6YqbqsdSIv5JuIQFbqRDE=;
        b=Fu4MvbjpfeE5OiAmnKxLD+nMReSRlcP7tg/jmtsB4acs8XDhUZ3GxDLEF/MafRluo6
         hcBhlabp6gH6zaGNR+O2NkOQgq2uqIJwXiURCI87yBvXjVE/Ft+rQelESsIVdqqwNCaa
         k0ECky3q14fmJ9rUiZPZHboW7wMJYiDmICzf4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I configured CLUSTERIP in two boxes to make balancing proxy, and
apparently it all worked but I get several messages from "CLUSTERIP:
no conntrack.

Does anyone know what this message means?

How can I fix this?

Thank you.

Edison Figueira Junior
