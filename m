From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: qos and iptables
Date: Mon, 17 Aug 2009 22:15:30 +0530
Message-ID: <cfeab66d0908170945p66fdd4a1x3c959b81b67027a8@mail.gmail.com>
References: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=pZ+8ZK35RLeSruW/Gtf9K7nsjgNbiImxZZKGJmGqM1A=;
        b=R5WRR+PXGTb/Jq3VAHskbM4h4PM4g3phhIWhrtPAnHumHO79rgIS6tWfibz6C8td1h
         Ms3LOhtr0vVrFMJYs1Sftp/XG9iNd/VkT7tNCAd0x9BA4GxiCfWqEoWoISfjc+h6Z1QA
         Kp3gvItCpq7TQNSGyI2mDHOlaBCu6as/phi7U=
In-Reply-To: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

clear picture



LAN                                        WAN

------>   eth0  -------------> eth1---------->




















On Mon, Aug 17, 2009 at 9:39 PM, ratheesh k<ratheesh.ksz@gmail.com> wro=
te:
> Hi ,
>
>
>
>
> lan
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0wan
> ----------------------------> =A0 =A0 =A0 =A0 =A0 =A0 =A0eth0
> --------------------------------------------> eth1
> --------------------------------->
>
> suppose a packet is =A0going =A0from lan to wan . =A0First it will go
>
> =A0prerouting chain -----> forward ---> postrouting =A0 chain
>
>
>
>
> i want to know when qos rules on both interfaces will be executed wit=
h
> respect to iptables chain =A0?? . =A0forward chain =A0will be execute=
d after
> =A0qos rules on eth0 is executed , ????
>
