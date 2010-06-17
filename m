From: Ajay Lele <ajay.lele@gmail.com>
Subject: Re: Fwd: Can Netfilter "mark" be used with setkey spdadd?
Date: Wed, 16 Jun 2010 18:24:16 -0700
Message-ID: <AANLkTin_ISVEr4Z5zoVmGEm9RMbvjRlws7I1AnQkfCfU@mail.gmail.com>
References: <AANLkTikXfO5TnvTN946kVtdkO5rs6vwVx0DkOP5uIcRY@mail.gmail.com>
	<alpine.LSU.2.01.1006162019220.30698@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=HzK5fS2jQb+SrEyjaUz4IBpFOEppwml0asYO5zEPtmU=;
        b=XXxK21on7yXtW+or/lMQA2IujqU4AypfqkpwTjuZQ2RhOB/bG0qVW0aX9bNwxrNjKQ
         KSH7VoHEPK7zZJJ6yJQviHUxNosNHwurRFgXspy6xNbItDsn6IJ26dvAKUBEYurQAMUd
         7KGpmmvP+xTJcck0+7NWqIBCYV8ITUcfMxmrA=
In-Reply-To: <alpine.LSU.2.01.1006162019220.30698@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wed, Jun 16, 2010 at 11:21 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Wednesday 2010-06-16 18:21, Ajay Lele wrote:
>>
>>I am working on a VPN solution where packets entering Linux box are
>>manipulated using IPTables rules (SNAT, DNAT etc.). The nature of this
>>manipulation is such that packets destined for different sites end up
>>getting the same src/dst IP address when they reach the Netfilter
>>POSTROUTING chain. However a different "mark" is set using the
>>IPTables mark target by which packets destined for different sites can
>>be distinguished from one another. Is there a way I can use this mark
>>value while creating security policy using setkey spdadd so that
>>packets are sent over respective tunnels (tunnels are created
>>manually)
>
> A packet can be marked when it enters the machine and retains the
> mark as long as it exists, even across transformation.

Thanks for the info, Jan. What I am specifically looking for is
whether Netfilter "mark" value on the outgoing packet can be used to
influence which tunnel the packet is forwarded on. I know it is more a
question for ipsec-tools folks but trying my luck here as nobody
replied on their mailing list

>
>
