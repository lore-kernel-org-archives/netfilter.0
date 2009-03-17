From: Xin Huang <xhuang2001@yahoo.com>
Subject: newbie question: log all packets to closed ports?
Date: Mon, 16 Mar 2009 23:02:28 -0700 (PDT)
Message-ID: <499103.50011.qm@web81807.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1237269748; bh=nsZIb8fdfyPbl24GeizwIczOSLDBpZazJFaisZ6U6/8=; h=Message-ID:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=r7e5YZuN4276522uQ0isHjhVnj4fcdP+JtaRvHyPxCy3ILVA93cBD413LN7oR3m5aUwDoN+1QZGWnKDc/dMinaiL2JZ3TtnDO8rfgdRFEEZpARxa/8fQZvRVBDoxBjj4N2LIGqAuzJ+qic0CBnxdFmUk05PMuJYVOaquH9PzY3g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I just tried iptables on my Linux box. It's working great. Now I want to use it to log any incoming TCP/UDP packets to any closed ports (not binded to any socket). How should I write the rules?

The server applications running on my Linux box are VOIP related and have TCP/UDP ports dynamically opened and closed. Is it possible to write some simple iptables rules to monitor those unwanted incoming packets destined to all the closed ports?

Thanks!



      
