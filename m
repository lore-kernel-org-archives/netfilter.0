From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: snat --persistent
Date: Mon, 26 Apr 2010 22:34:35 +0400
Message-ID: <37141272306875@web115.yandex.ru>
References: <1393124438.20100427001703@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1272306875; bh=GsW9ZOtMMZKfv5d+iQBDf25YHoBQJvVSr3ZMY2x1K0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=cwsaiCFlAbsjeLiQPcPJUmQNFJQJg7CV7dAn/cMa1eFIe7crt85ppCy7OIcjLilwJ
	 BSE5D4JJR2wLW0MzVaKdeMEKYPe3Mbvxx1IwNvItjavfGoRAqteYIENUTTh6qccpMS
	 0AmKlAWZh6UCqZMcD99GcDzVMwWu3c4ij7xh+PQY=
In-Reply-To: <1393124438.20100427001703@mail.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mindb0t@mail.ru
Cc: netfilter@vger.kernel.org

Hello,

>  1. What does "client" mean? An IP, process?

Source IP-address.

>  - Will all my connections go through one IP?

Yes, until you don't change source IP. Only original source IP-address is
using in hash function for selecting IP-address from NAT-pool.

>  - Or for each connection IP will be chosen randomly?

This is default behaviour. Source and destination addresses are using for
hash value calculation in this case.

-- 
wbr, Oleg.
