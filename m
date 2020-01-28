From: Frank Myhr <fmyhr@fhmtech.com>
Subject: nftables atomic updates
Date: Tue, 28 Jan 2020 18:03:02 -0500
Message-ID: <76313ba4-fe88-1ef3-8250-682764dfcb08@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:To:Subject:From; bh=9njSEBzngE3z/94/AgybU+gchFFgP7y8fRHemEvXTU4=;
        b=RiImWrTQrJGuNhoBhlQR1JHqyUxaZYjQ3R7ilmgb6VWhLz7tYZU9VAm3OyYvH7cUzHRNhmCP9kjOwx+epvE45vcD6qJ/wRuziaxLrXSdgBs7yK9IjezNtvEyCXAn8uSgDz62LsNmAsnVuqEMWfbCdIrkJOGEMvnmx+kgdAsjCv4=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm belatedly moving from iptables and ipset to nftables. I've become 
accustomed to using 'ipset swap' to atomically update large ipsets (by 
loading the update into a temp ipset, then swapping the temp ipset with 
the old one, then finally deleting the temp ipset). From reading the 
fine nftables wiki I gather that all nft operations* included in a 
single file run with 'nft -f <file>' are first built up in parallel 
memory structures and then applied atomically. Is this statement correct?

* I'm particularly interested in 'add element' operations.

Thanks,
Frank
