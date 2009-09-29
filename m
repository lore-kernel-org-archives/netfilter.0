From: Steve Fink <sphink@gmail.com>
Subject: Re: CPU usage of simple DROP rule
Date: Tue, 29 Sep 2009 12:45:44 -0700
Message-ID: <7d7f2e8c0909291245i5c9bf0bal93757ce374c406d6@mail.gmail.com>
References: <7d7f2e8c0909291131m5cd58372ta5907f1612d8fa05@mail.gmail.com>
	 <20090929212744.6679cfec@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=doWDyTSxMrXD1mgsjPK10z7GLdYB1y3LHlK1TIqYIOc=;
        b=XRWZFS84LW3Y6jBF3yASZpOg4HGKtJUu7f6EwbxTEydp6JjMGb11tqsFQdGd1P+7pd
         hTRXLS6CT+9Bs37zahFDRwr26r0phAvJ/Oc5J+dbb6WXYPqYLWAkMrXKk4iwkVoZJb7O
         S/dmQGIhTnDdMorOjlg6NSJ2igqb6KMbrrEBg=
In-Reply-To: <20090929212744.6679cfec@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Well, I was originally having a problem with the CPU load distribution
independent of netfilter. Initially, one CPU was getting the bulk of
the IRQs, so I used smp_affinity to spread them out more evenly.
Oddly, that made no difference. However, when I created multiple
threads sending the packets out, and forced all packets coming from a
particular thread to go out on a specific interface, it fixed the
problem. (So I have one sending thread per NIC.) I still don't
entirely understand that -- with the smp_affinity method,
/proc/interrupts showed the interrupts spread out over CPU1..CPU5, and
yet CPU0 was getting hammered with soft irq processing. I think the
(single) sending thread was running on CPU0, which mattered more than
the smp_affinity of the irqs themselves.

How would I know if I'm using intel i/o dma or whatever? 4 of my 6
total gigabit NICs are using the e1000e driver. The other two are the
'igb' driver, whatever that is.  modinfo says "Intel(R) PRO/1000
Network Driver" for e1000e and "Intel(R) Gigabit Ethernet Network
Driver" for igb. lspci says

Intel Corporation 82576 Gigabit Network Connection (rev 01)
and
Intel Corporation 82571EB Gigabit Ethernet Controller (Copper) (rev 06)

dmesg says:
igb 0000:05:00.0: eth0: PBA No: ffffff-0ff
igb 0000:05:00.0: Using MSI-X interrupts. 4 rx queue(s), 1 tx queue(s)
eth4: MAC: 0, PHY: 4, PBA No: d98771-007

(the latter is from e1000e).

By "nic coalesce parameters", do you mean TxIntDelay and
TxAbsIntDelay, or InterruptThrottleRate, or IntMode (all for e1000e)?
Or something else? How can I tell what the current settings are?
(Sorry, that's probably a basic question.)

Thanks!
Steve

On Tue, Sep 29, 2009 at 12:27 PM, Marek Kierdelewicz <marek@piasta.pl> =
wrote:
> Hello
>
>>I have a single OUTPUT rule (drop a particular UDP host:port) that
>>...
>>My 8 cores are all at about 30% usage when I have no rules defined
>>(and the packets are going out to the switch). When I add that rule,
>>one of the cores shoots to 100%, another to 70% or so. The rest don't
>>really change.
>
> Looks like two cores are being hit by ksoftirqd. There are some paths
> you can explore to achieve lower cpu usage/better core-load
> distribution:
> - try using smp_affinity - bind different nic irqs to different cores=
;
> =A0you can also use bonding to achieve better traffic distribution
> =A0among nics;
> - are you using intel i/o at dma support? it should lower network
> =A0overhead for localy generated traffic;
> - try adjusting nic coalesce parameters - it should lower network
> =A0cpu overhead at the cost of higher latency;
>
> Cheers
> Marek Kierdelewicz
>
