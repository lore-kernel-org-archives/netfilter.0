From: Andrew Beverley <andy@andybev.com>
Subject: Re: Unable to use connbytes
Date: Tue, 05 Apr 2011 20:41:54 +0100
Message-ID: <1302032514.1773.859.camel@andybev>
References: <BANLkTikOa2JciJ6Lhuh721Oo0qdY50tFKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302032517; bh=Jm03hhLHPFa1/nce1tD+nDgEz7zDCvUPzqpOB
	Qi87dU=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=GtV2HyCS
	7HSXUVexXFbC61ULMc9nu8k0CoVqnQSK2Vk2YhMSSzfmxF46sTwIUPMQOUzNpsgEgAr
	dIFAqIJVv669/U45uFhQZSW0w3q0Zk+hd8G6jH2vlDX7zYvnDyO6bGKevOBZ5v1JmcV
	hIUehY9kk8YQc5InUVJwOcfZxdPmU=
In-Reply-To: <BANLkTikOa2JciJ6Lhuh721Oo0qdY50tFKg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Supratik Goswami <supratiksekhar@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-04-05 at 19:18 +0530, Supratik Goswami wrote:
> I checked the connbyes support in my Kernel and it shows the following output.
> 
> [root@gateway bin]# lsmod |grep connbytes
> xt_connbytes            6465  0
> x_tables               17349  11
> xt_connbytes,xt_MARK,xt_multiport,xt_CLASSIFY,xt_length,xt_state,ipt_REDIRECT,ipt_TOS,xt_tcpudp,iptable_nat,ip_tables

Good, looks like the *kernel* module is loaded.

> When I am trying to use it with iptables I am getting the following error:
> 
> iptables v1.3.5: Couldn't load match
> `connbytes':/lib/iptables/libipt_connbytes.so: cannot open shared
> object file: No such file or directory

However, looks like your iptables is missing the userspace bit. Not sure
why that would be, but that's a pretty old iptables version - was the
connbytes match available back then? Would be worth trying to upgrade
iptables.

Andy


