From: "Adam N." <adam.n@justnet.pl>
Subject: Conntrackd and Stats
Date: Thu, 01 Aug 2013 09:46:32 +0200
Message-ID: <ebed8973f57495e3091005d880fcb4ca@justnet.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=justnet.pl; s=dkim;
	h=Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version; bh=9i37cT9GppkALAJY10lt00VSMM0RSrnJB3MrxUGuAPE=;
	b=nGUlgI6P9IInKVkqqgwyu9iTxN9XuF6crQ6lhrucmOd7pytJ4qYkGAGnpRFW9NY/oRL2KX3CwV31tGUkJ1J438uace+LJ6usvLDTZCAwUstFv8E6z4tJidQheSB3e9K1qJhXeOzaKs5/gLTbQXle/0gr5LV5CIYLjWgHUdSccmE=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello everyone,
At the beginning I would like to thank everyone for the work put into 
the project netfilter.

We use conntrackd projekt to save NAT connections. Recently we noticed 
that with the change of the kernel version also changed format logs( 
disappeared amount of transferred packets and bytes).

My question is:
Is it possible to restore the record containing the number of packets 
and bytes transferred in connection?

Thanks,
Adam N.

