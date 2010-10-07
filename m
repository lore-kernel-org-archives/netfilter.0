From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: how to best limit "rate of rejects"
Date: Thu, 07 Oct 2010 20:30:01 +0200
Message-ID: <1286476201.3383.48.camel@fermat.scientia.net>
References: <20101006142149.95231l9rz87p044g@webmail.physik.uni-muenchen.de>
	 <alpine.LNX.2.01.1010061444180.21694@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=content-transfer-encoding:x-mailer
	:mime-version:message-id:date:date:organization:content-type
	:content-type:references:in-reply-to:from:from:subject:subject
	:received:received; s=sel-2010; t=1286476202; bh=HLYesFBZ+i2krf8
	qb+Ht7hOp0ul+0UM8OJCLTggn+RM=; b=UXHaxn48pruIuuigsdv0gCciaCcWQFr
	au9MUfAJODUr9RGpO6fbwvwWY7TCQr58nQFAX65z7bhbgNjEylzly9Xym+fppLi0
	N3qBlMKdvoSrF3Cihef7MhKXeXcUUE0lyNyavSFpjlBC8lIHxYjmEfzLqGOYRi24
	wPh3jFcz7oi8=
In-Reply-To: <alpine.LNX.2.01.1010061444180.21694@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Jan.

On Wed, 2010-10-06 at 14:45 +0200, Jan Engelhardt wrote:
> > Is there some smart way to just limit the rate on those rejects? e.g. something
> > like a "wait with sending the reject for a second" target?
> 
> -m hashlimit --hashlimit 1/second

Which one do you mean (just --hashlimit seem to not exist).

And as far as I understand the documentation, this is the same as limit,
and it's just for matching,... so if the rate is exceeded the rule would
simply no longer match and I'd have again such a packet burst?


Cheers,
Chris.

