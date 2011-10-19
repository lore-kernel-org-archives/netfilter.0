From: Michael Robinson <mike@robinsonhome.org>
Subject: Re: Removing VLAN tag from outgoing broadcasts
Date: Wed, 19 Oct 2011 11:34:54 -0400
Message-ID: <CA+JOZmN=hXL+f20+rRMfYiM0RnGEknk60a65BtOATwEthxe_-w@mail.gmail.com>
References: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>
	<4E9ECEB4.9020402@freemail.hu>
	<CA+JOZmOF5ydmaAYSBcuU7ZQ8ZijCEV6bSL8uvaJFbmn9DP3=tA@mail.gmail.com>
	<4E9EDB76.6080006@freemail.hu>
	<CA+JOZmOsUvB_Ly-1SScvDMecrOy7Dka3G+6fzaqyCOYzCfJAgg@mail.gmail.com>
	<4E9EEB78.90304@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=bbSlLjn80N0nc3Ng2C/A2H4ouEoXnswJ87GnT1hG/Yw=;
        b=S5v6ICBvk6Xt64EcfnsKL7El7HRPyTWsP8Iv0Lv2qyJJBZ8w6ofFFwCbCn2RxUJeHQ
         1TRBOowm8b5w+WYE9U/zyWw46o/QE11ka6ZXjrtttFKe5qQmWAKybLjT1AHhcSWOQJVa
         ymww/Sx3IXo/pvbMve5FdXdyHnj+pYMcRA9mk=
In-Reply-To: <4E9EEB78.90304@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

> As I mentioned before: (AFAIK) the switch WILL remove the VLAN tag on an
> Access Port...
> If I understand you right you want to send ALL broadcast packets to this
> device...
> If so then maybe you need the TEE target in the iptables/netfilter
> framework...
> Jan Engelhardt can help you with that... :D
>
> I would:
> - set up a new VLAN (2051),
> - put the other side (this non-standard device) on an Access Port,
> - copy (with TEE) the traffic to this new VLAN...
> (Or just forget the first two steps and use an other ethernet interface and
> a cross-link cable :D )
>
> Hope that helps. :D
>
> Swifty

Thanks for the suggestion, I'll look into the TEE target.

-Mike
