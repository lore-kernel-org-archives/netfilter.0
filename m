From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Removing VLAN tag from outgoing broadcasts
Date: Wed, 19 Oct 2011 17:23:36 +0200
Message-ID: <4E9EEB78.90304@freemail.hu>
References: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>	<4E9ECEB4.9020402@freemail.hu>	<CA+JOZmOF5ydmaAYSBcuU7ZQ8ZijCEV6bSL8uvaJFbmn9DP3=tA@mail.gmail.com>	<4E9EDB76.6080006@freemail.hu> <CA+JOZmOsUvB_Ly-1SScvDMecrOy7Dka3G+6fzaqyCOYzCfJAgg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+JOZmOsUvB_Ly-1SScvDMecrOy7Dka3G+6fzaqyCOYzCfJAgg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Robinson <mike@robinsonhome.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Hi Mike,
> Now I need to connect eth2 directly to a (non-standard) device (don't
> ask :) that will take care of the broadcasts, but they must be
> untagged.  So I was hoping to create a rule that would essentially
> direct the outgoing VLAN-tagged broadcasts to the native VLAN
> (untagged).
>
>

As I mentioned before: (AFAIK) the switch WILL remove the VLAN tag on an 
Access Port...
If I understand you right you want to send ALL broadcast packets to this 
device...
If so then maybe you need the TEE target in the iptables/netfilter 
framework...
Jan Engelhardt can help you with that... :D

I would:
- set up a new VLAN (2051),
- put the other side (this non-standard device) on an Access Port,
- copy (with TEE) the traffic to this new VLAN...
(Or just forget the first two steps and use an other ethernet interface 
and a cross-link cable :D )

Hope that helps. :D

Swifty
