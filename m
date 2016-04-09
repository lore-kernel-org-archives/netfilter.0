From: Brian Allen Vanderburg II <brianvanderburg2@aim.com>
Subject: netfilter tables dynamic sets question
Date: Sat, 9 Apr 2016 08:52:34 -0400
Message-ID: <5708FB12.2020301@aim.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.aim.com;
	s=20150623; t=1460206283;
	bh=XXQGpdoiitkIJmV7vcHyDl2LAhrpP6FQ4nMlCa8ceAk=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type;
	b=ImLFq0kFOkv8nkmLeqNyLT6qYNeFMa5dgxWmhph+nDCdZqmSacKWbDGfnpaIKyIJL
	 E9qJvpcTe7JrUGfbnliPQsQzEedcS5Pj4a3ug9oeEI2KCJwsovvBFj3jHZUm1/4MFO
	 yFjNOYp5wORuuyarOzZPvVBrkJcjcFJVKWmx1wXk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a question about the up and coming netfilter tables (nftables). 
One feature I use with iptables is ipsets and the ability to dynamically
add a rule to an IP set based on some traffic criteria within iptables,
so that later traffic criteria can match against the set within
iptables.  Is it currently possible to dynamically add entries to sets
with nftables?

Thanks,

Brian Allen Vanderburg II

