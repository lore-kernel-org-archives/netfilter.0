From: =?UTF-8?B?RMSBdmlz?= <davikovs@gmail.com>
Subject: Re: Translation of addresses inside ICMP errors
Date: Tue, 13 Mar 2012 22:58:15 +0200
Message-ID: <4F5FB4E7.8090603@gmail.com>
References: <CAHQn7pLfzDNrEsUawtqeE_yyeqKpUp4n-E=mTaghwdRoJWo5oQ@mail.gmail.com> <CAHQn7pLfLuYS=XC1SYxYNPxL35aMD_pU8dd6mFt-FFRiqsrAAg@mail.gmail.com> <4F5F1D00.7030901@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=DovuDzADnzTBZBcMkpcHF0/dL0Gu04IKkEdq0Xpjyy0=;
        b=dnXoS41degt5Zy0h7j/eUoookAOdR6BWgzhEBD19mw2AacNOQywwmZAWc8AHdcZr7U
         0dzzKHg3cqt+6OY5R6PfQJAbvQCXCvVJvY0VikMyxZTjNrndEklkHeo7WombtZEfXr5+
         1omy7ZmG9pd7UaVdG+oC6TvThBPJc+CoqoSGCKfDI9tOq2ZfITJDDN8o3pmSABc6593H
         al77emRQgZVGaySvM03bj0ZlfCTq7DDSVxFs2hJl3XCAlc3lNJWH8Y999WjmyqEJBDeb
         gj4feKxHmbxBYdGwRGGTaV0RC9j8/dSlL/PWZ7pBiqUyojhwU72Cdm6Y5u5fW3QfMvTD
         pEQw==
In-Reply-To: <4F5F1D00.7030901@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am sorry - looks like netfilter DO translate IP addresses inside ICMP
error messages.
