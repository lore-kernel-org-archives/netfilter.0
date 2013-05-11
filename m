From: Alex Flex <aflexzor@gmail.com>
Subject: Re: synflood +syncookies + conntrack strange behaviour
Date: Fri, 10 May 2013 18:07:23 -0600
Message-ID: <518D8BBB.5050406@gmail.com>
References: <518C479D.1070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=I7kfylEYK4GR6RArleWSXq9NHzP3d6QmuYBbNrDHUZw=;
        b=egXDtqvGcxuDVXnmYYCdEC4aTqQBQ3/vfGV07zPFD2ME9bbRLEH7w2SkhYuq/jSJn3
         iz9el1CaZwkBhDbVnyK2k58B0rYrlv/UEmys7EHrmtxiviosJAZDA+nnajH/cbGzlEBu
         COU0XnK8NYA/CHNvPhcDz2zf1dP9ZiLRnVWlyc4Uk97UUwe7yXAu734BKvtBWqi9Dnau
         MASHutMFl/m00GEgcEe9D17KUvS8eUVIOXOBa7dGhQpeACmO94ZkiucrXz1vsd2NmNks
         umGNRxM92Z18hUVmgnFihPu2L6TZxe/JLLhxVQzPOTLOX0ABd3YRRntz8L40TXgch0tK
         zAVA==
In-Reply-To: <518C479D.1070904@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello netfilter,

Iam still wondering if the lack of error for the conntrack table full 
may be a bug in the module? Any help is much appreciated.

Alex
