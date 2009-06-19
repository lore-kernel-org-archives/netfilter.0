From: =?windows-1252?Q?David_Bala=9Eic?= <xerces9@gmail.com>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 15:37:54 +0200
Message-ID: <9948385e0906190637n6e8d8203uc16eda958f7ce3fb@mail.gmail.com>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
	 <200906191413.43513.ben@differentialschokolade.org>
	 <9948385e0906190557q20f28cf4l118b70a6f5132a0a@mail.gmail.com>
	 <200906191508.18236.ben@differentialschokolade.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ab0J/3Ggdd//fiHG9t2LpS7mOLC3hj1rlToIFDMe39o=;
        b=CqJGzzBgL81V7IYBI9qVqFHr8INfQvGmBRZ2/zXbAc7sOpwKJ4TkhdY+xNJXm5vFP3
         mzFZgw+MW1R9p1foe0mhSKwN5wB2c4EAnDXhvjL0836Ov13OizJlyuzpUNrwSv6Aqdig
         36EPoZhT1FbaB2/c88KWbUuPNWGjE85QRKCW0=
In-Reply-To: <200906191508.18236.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benedikt Gollatz <ben@differentialschokolade.org>
Cc: netfilter@vger.kernel.org

2009/6/19 Benedikt Gollatz <ben@differentialschokolade.org>:
>> > Why do you want to conntrack proto-41 packets at all?
>>
>> I don't.
>> That is why I started this thread: How do I make proto 41 not being
>> screwed by netfilter ?
>
> As I've told you before: By replacing your MASQUERADE rule with the one that
> you can find in the SixXS FAQ.

Aha, I misunderstood you then...
I already did that. Now I just have to wait and see if it works or
will it block after some timeout.


Thanks for the assistance.

David
