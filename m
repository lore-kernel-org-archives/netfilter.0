From: Eduardo Sachs <edu.sachs@gmail.com>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Mon, 25 May 2009 09:29:52 -0300
Message-ID: <3e7107590905250529o686b331do322e7e5b8849478b@mail.gmail.com>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	 <20090525141321.0b41719e@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=yAMRmeKM20oEy6FLF6hKhJ5FcslQ2nqpS+UhigAFewY=;
        b=KZ9CwnF18y0RxhOe5mj2WziDij+wI4xpy/bNftNGD2+K+ZKudqIixdNxA3J4dtpWky
         orAhcxzMz+OAkQ4Jcbpsqtxy9HVipTvO0OnQi5Ai4rMRexkA4jLxVXyR4PGfULBHKglq
         dXw0F/s1/m0rtxEN1qRBdRrMvT3sPJtdTF9fY=
In-Reply-To: <20090525141321.0b41719e@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Hi Bro,

Hi!

> Interesting. How does client choose firewall? Where the randomization
> occurs?

Could have a Virtual IP for sending the requests to the two firewalls.
Could have a ldirectord for gateways. Remember that the ldirectord is
"load balance" only for ports TCP/UDP.

> You can use keepalived [1] to have two virtual gateway IP addresses on
> the network - GW1 and GW2. Assign half of the clients staticly to GW1,
> another half to GW2. If one of the boxes fails, keepalived brings up
> missing GWX address on another box. This way you are provided with
> redundancy and load balancing.

How would I disclose two gateways in the network if I have only one
DHCP? Could create VLANs. Correct?

>
> [1] http://www.keepalived.org/
>

Thanks!
