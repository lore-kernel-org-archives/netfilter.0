From: "=?windows-1257?q?K=E2rlis_Repsons?=" <karlis.repsons@gmail.com>
Subject: Re: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 19:40:09 +0000
Message-ID: <200902031940.09273.Karlis.Repsons@gmail.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com> <4988992f.20038e0a.3b6a.ffffd8a6@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=ZPlRH9EmxiI1EPSTbpF0eLISz+KCYy7whOcsl3O0d8M=;
        b=oJsJrWjk83LrxW1WyNaKS/1RAzQsRICcOh4Hrt6TlJbQo1t7GoloerY7oIrxRjz4Ge
         98YA6ULZWThKLbSoFcqgaAnciDizLKauk3cCsJHzbL2RfbsGNKxNjn1HDsUErKwL3YFY
         aozdCJSM9ytxBjOjeuNpJnU5FfE2tu5R2ID/0=
In-Reply-To: <4988992f.20038e0a.3b6a.ffffd8a6@mx.google.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@vger.kernel.org>

On Tuesday 03 February 2009 19:21:05 Gilad Benjamini wrote:
> Your description is not very clear, but my guess is that you want to run a
> bridge on this PC. "man brctl" is a good place to start.
It is all very simple: think of one computer with two RJ45 inputs, one 
connected to LAN, other to laptop, which needs access to LAN too. The problem 
is: I have only one cable to LAN and no extra switch.

Is that only bridging to use? I would like to set up routing for that, because 
it seams simple enough for me (and I want to see how it can be done), but it 
turns out not so in practice today :(
So do I have to use bridge in any case here?

> Most distributions have an easy way to setup the bridge via the network
> configuration files.
>
> If you actually need to set your machine as a router that's a different
> issue.
I am interested to set it up as a small router, yes. 

>
> Regarding iptables, you will need rules on the FORWARD table to catch
> packet travelling through the bridge.
>
> > -----Original Message-----
> > From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> > owner@vger.kernel.org] On Behalf Of K?rlis Repsons
> > Sent: Tuesday, February 03, 2009 9:54 AM
> > To: netfilter
> > Subject: Forward packets from one interface to another?
> >
> > Hello,
> > maybe someone here can help with this problem: I have two NIC ports
> > (for RJ45
> > I mean) on my PC (pH) and it is necessary to attach another PC (pB) to
> > the
> > spare port similarly to like it was attached to switch. pB has static
> > IPv4
> > just like pH.
> > But. I want to do it with routing and iptables! Please, please, I have
> > always
> > failed using two interfaces, I would appreciate an example of how can I
> > change it!
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


