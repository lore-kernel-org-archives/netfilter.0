From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Traversal of chains for muticast packets .
Date: Fri, 5 Mar 2010 16:22:46 +0530
Message-ID: <cfeab66d1003050252n27fb7fa2s5ff92a30b0874566@mail.gmail.com>
References: <cfeab66d1003042146p62c3904cncfaedbeca4f41c12@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=acr54J7pE8FDYuj+DgAx5YGWjSF05vCFks9oEPoMBJM=;
        b=Ya4ZkbbLji9gH295Uo0c7SsTkl4WqsDBF6v6Ok5aEUpXBj0/ad7xHgq630XWdbMqJI
         0MtAbJnPdtDgnPD60Iyz6WF14b2iATSj57JAXDVtSzVgsnQQ0fUQSNv+UL7oxoMCn/DC
         DaGd7ZYKt97W8+UC0dV0t7R9fT4rwKrn/XsB4=
In-Reply-To: <cfeab66d1003042146p62c3904cncfaedbeca4f41c12@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

My gateway machine has two interfaces , eth0 is connected to wan and
eth1 is connected to lan side .


iptable -A    INPUT   -i eth0  -p igmp -d 224.0.0.1 -j ACCEPT
iptables -A  INPUT   -i eth0  -p igmp -d 224.0.0.2  -j ACCEPT
iptables  -A INPUT  -i eth0  -j   DROP
iptables  -A INPUT -i eth1 -j ACCEPT


iptables -A FORWARD -i eth0 -o eth1 -p udp -d  mutlicast-address -j ACC=
EPT

I have above rules , but  i cannot see mutlicast packets in my lan
client . But if i have
below rules , it is working . Why i need all rules to be called both
in forward and input chain ?
Am i missing something ?


iptables -A  igmp-rule -i eth0 -p igmp -d 224.0.0.1 -j ACCEPT
iptables -A igmp-rule -i eth0 -p igmp -d 224.0.0.2  -j ACCEPT
iptables -A igmp-rule -i eth0 -o eth1 -p udp -d  mutlicast-address -j A=
CCEPT

iptables -A INPUT -j igmp-rule
iptables -A FORWARD -j igmp-rule






On Fri, Mar 5, 2010 at 11:16 AM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> Hi,
>
> =A0 =A0 "packets those are forwarded traverse thru =A0 "NAT preroutin=
g ->
> Filter Forward -> NAT post Routing chains ."
>
> =A0 =A0 =A0But in case of =A0multicast packets , i can see packets fl=
owing
> thru =A0"NAT prerouting -> Filter INPUT -> Filtert =A0Forward -> NAT =
post
> routing chains . why it is so ? =A0.
>
> =A0 =A0 =A0Note - > I am running igmpproxy for for multicast proxy .
>
>
> Thanks,
> Ratheesh.
>
