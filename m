From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: HTTP Access Blocked After iptables Update
Date: Wed, 04 Nov 2009 10:52:50 +0000
Message-ID: <4AF15D02.1080201@gmail.com>
References: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC> <200911032206.18489.fakessh@fakessh.eu> <C387A75055774404B36410B61AF40D41@RomoPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=D4FU4DRhAKf/sHn1IYY7qF4e4QvlsRXecDC3+AenVqE=;
        b=mP7fNEkaRb/CxnRQT9/8KW23k1nKTy+uVVmY+vb5512y+sOhK9yG8HgcMafjBrK427
         l+Mh8rqwy1TF8RQZojWjh20CfDK0ccmkWJfGAauMVE7+pR74uAbLaYlTpjk9rykwz1HE
         bG7ioF9PYcYHPHMDDLl4ioRDGhbk5KfyzJjNI=
In-Reply-To: <C387A75055774404B36410B61AF40D41@RomoPC>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JR <jdnromao@gmail.com>
Cc: fakessh@fakessh.eu, netfilter@vger.kernel.org

JR wrote:
> Hello again.
> 
> Can someone please help me on this?
> 
> After server reboot all sites are on, and iptables is running. However if I
> restart iptables (service iptables restart) all sites become unavailable.
> 
> And in "top", (after the iptables restart) all I see is root processes.
> I've
> updated kernel, may be related to it?
> 
> What can be the cause?
> 
> Any help will be very appreciated!! Thank you!
> 
Shot in the dark, when you do iptables restart does it do iptables-save and
iptables-restore ? Check in /etc/init.d/iptables.
