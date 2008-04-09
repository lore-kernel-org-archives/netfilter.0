From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: Ranges and Single IPs
Date: Wed, 9 Apr 2008 11:40:58 -0700
Message-ID: <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com>
References: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=k38f8696f/+9xZrQn8QyCmePABPwQy4eNKBedFDeIiI=;
        b=cXBh1SqaTBuiVdw0s1d/P+3qjPzcbbwuRKxUSy3lcnuW6hxFUMLLnae8dW3hEsHfcbzrwhwoC9jQ6BltXXHEpjzkm5QZeBucLr5/FLROj2XgfOPQzinq9ZgvDfa5E2AyVPdBKcSjr42XE2ReptgwFDE04/Sq4hpsZvYreCzgTsk=
In-Reply-To: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'd like to write a rule for a group. A group can include both single
IP addresses and ranges of addresses.
ipset can do the job with single addresses.
ipragne can do the job with ranges

How can I combine the two ?
