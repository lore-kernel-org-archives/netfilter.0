From: Andrew Beverley <andy@andybev.com>
Subject: libnetfilter_conntrack callbacks and nfct_destroy
Date: Tue, 03 Aug 2010 07:24:14 +0100
Message-ID: <1280816654.1349.643.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1280816667; bh=yPaUooGybsbKfDIEKmHg3yNo2Ukbr8HsZtVQs
	fgfy3k=; h=Subject:From:To:Content-Type:Date:Message-ID:
	 Mime-Version:Content-Transfer-Encoding; b=lTHN/oxewDS60RdQDWO5ytOU
	cgNdBdZLIlYBj8hjE/Bzy5km4VD4tD/6sWuxs81Du2WjYu+2o98j+/YfcN4pu4Zi9Dp
	iuv6KxAHF25uL31alFZ7EHGqsXoVhbL760qpc7DMsF0a9ycvPHnLbCrwR9KnIS91JaY
	DNSkcU3j9RPeo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have 2 questions regarding libnetfilter_conntrack please:

- When using nfct_callback_register() and then nfct_query(), is the
callback that is subsequently generated a synchronous callback? (It
appears to be, I'd just like positive confirmation).

- Should nfct_destroy() be called after each use of nfct_new() to
prevent memory leaks? I assume that the answer is yes, but only one of
the examples in the source code use it.

Thanks,

Andy


