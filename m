From: =?windows-1252?Q?David_Bala=9Eic?= <xerces9@gmail.com>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 14:57:21 +0200
Message-ID: <9948385e0906190557q20f28cf4l118b70a6f5132a0a@mail.gmail.com>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
	 <200906191218.03217.ben@differentialschokolade.org>
	 <9948385e0906190503i223f715s49730aa8e5e5df89@mail.gmail.com>
	 <200906191413.43513.ben@differentialschokolade.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4e79hUOB6QpLXpTcSGNhQHHkz4CI3dlqRt2XMWeEGgM=;
        b=tX3VQpmmvDuT1XPtAGAmgSbL3TjrZ1giFDP7cDRSICOUf65XBhCBUnSBv/TBOWgvdE
         RJo0Wb4DIvAAP77lAA76LO4anoqVp+awnBakQux3qApPBFEGkgL/IWXHYQiTThph8Y2B
         JFc4oKgviwYPqd5bc+0T6cHuB0yVhplACY838=
In-Reply-To: <200906191413.43513.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Benedikt Gollatz <ben@differentialschokolade.org>
Cc: netfilter@vger.kernel.org

2009/6/19 Benedikt Gollatz <ben@differentialschokolade.org>:
> On Friday 19 June 2009, 14:03 David Bala=9Eic wrote:
>> One more thing: Where is the timeout for this set ?
>
> /proc/sys/net/netfilter/nf_conntrack_generic_timeout I presume.


I have no netfilter dir under /proc/sys/net

(linux 2.4)


>
>> After the mentioned ping, the world can contact me for hours.
>
> That's much too long for the default setting of a timeout. AFAIK the =
heartbeat
> client must send keepalive packets every 300 seconds so the tunnel an=
d
> connection tracking timeouts may influence each other.
>
>> I want to lower the timeout to a minute or so, so I can test the
>> setting without the need to wait hours for the timeout to happen.
>
> Why do you want to conntrack proto-41 packets at all?

I don't.
That is why I started this thread: How do I make proto 41 not being
screwed by netfilter ?

Regards,
David
