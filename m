From: Kirk Hoganson <kirkhoganson@gmail.com>
Subject: Re: Round Robin or Random Source NATing
Date: Wed, 23 Feb 2011 11:43:54 -0700
Message-ID: <4D65556A.4040709@gmail.com>
References: <4D642A6B.4050806@gmail.com> <4D644BDC.1020107@kickstone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=W1+8TrI6M4jzICfcI1SmiV+wFDDd/87NbU96kf3sWow=;
        b=J4d9qOoQBegNM8hQ9a/dApK6tNtlCioL9MGs8pRr/hzBJjMLUvBA44c0v1+0lmoteu
         MqvYuInxH8yFjkYjjE3hSJgp5ws8NrCo7ymUph7V8b/hOq9NLFnlHQKZuI4WBpAlJQB6
         mIxfQn3cdvW/fmbH0YgobeFdmndpO/0tt+XMw=
In-Reply-To: <4D644BDC.1020107@kickstone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Lister <john.lister@kickstone.com>
Cc: netfilter@vger.kernel.org

Excellent advice.  I was thinking the module used a global counter.  I 
made the changes you suggested, and I'm seeing more consistent results.  
Thanks again, I doubt I would have figured that out on my own.
