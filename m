From: Frank Myhr <fmyhr@fhmtech.com>
Subject: nftables equivalent of "ipset test"?
Date: Mon, 9 Mar 2020 13:53:31 -0400
Message-ID: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=dUw6gQ1Ewav18OXWwJS30F6jYYC9ucMHQf1irYeAJ0E=;
        b=tc5v5nXgL+j/hQDhAMrLSN6390s+LdvnpTL9or0d8clf7SXLcIHF8lQMDREnpTq46HxU8Pndyh57a2f08pC3YqCPixqka376wYH3vPZc0ZzSmelwzHdZDoDCE7N4Tjh1btKBFlLnnSdDpDSyv/ucYeHfvOlpgnJtl9zEj2GYmSE=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Is there a recommended way to test whether an element is a member of an 
nftables set?

Thanks,
Frank
