From: Bastian Bittorf <bittorf@bluebottle.com>
Subject: Re: What mean rules with no target? / counters
Date: Thu, 1 Oct 2015 06:34:32 +0200
Message-ID: <20151001043431.GZ22537@medion.lan>
References: <20150929100001.GN22537@medion.lan>
 <134091077.84668710.1443648322962.JavaMail.root@zimbra62-e11.priv.proxad.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bluebottle.com; s=fe0;
	t=1443674165; bh=7c9cISCw3RrlLtLfCaSLGH2UuWFyXtpcENg7jmPg8e8=;
	l=679; h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoNRYB0bvmfKyJskfGczFJ2iVWNlip5bnPW+V9IMRHHGR9Wdisddh+cvASEJCLGU/
	 h6dLs3GkZdfThWsG99AEsdwY51gqz1O81reWni7HcANbpHHtoPKwNV4qKV2pP7tbGO
	 PCrAWyiywpHNUmM98NNMR+uCQ1hCJuQhHVUtK5GA=
Content-Disposition: inline
In-Reply-To: <134091077.84668710.1443648322962.JavaMail.root@zimbra62-e11.priv.proxad.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f0rhum@free.fr
Cc: netfilter@vger.kernel.org

* f0rhum@free.fr <f0rhum@free.fr> [01.10.2015 06:11]:
> I read some relevant chapters of http://www.iptables.info but I could never find this.

a quick check in the documentation also makes me think,
this is missing or at least not explicitely mentioned.
I remember that i stumpled over this feature also by accident.

In short words: i you just want to count
bytes/packets and the packet should be processed further,
you omit the '-j TARGET' and so you just have a counter.
(most targets "eat" the packets, so they are not processed
in later rules)

# e.g.:
iptables -I INPUT -p udp --dport 53

lets you just count all incoming udp-DNS-packets.

bye, bastian
