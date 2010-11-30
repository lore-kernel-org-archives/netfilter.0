From: Edison Figueira <efjgrub@gmail.com>
Subject: Re: ClusterIP network slowdown
Date: Tue, 30 Nov 2010 10:59:47 -0200
Message-ID: <AANLkTi=NnAvZ0A+St0zH9W8GUR0dpzAxJAa4XCx4YxXW@mail.gmail.com>
References: <1291107610.2488.46.camel@nerino>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=B5QZhbXwj9kC4VazA0llNT3Edgi4fpd79KzODTKv8qM=;
        b=pRvnrwo0yJNnFZ0fTvp4ia/hUje+pSxY0mKyZbQbkvKVR0iGWMj1Vs4vdsNoBeHcj6
         LTwr6OSPSNnudlO+s+uJ3lGLeJn7G4GjVZLYqLmAD31hTqa1pB6gNuqAHfwvfITP80dK
         yeTIeQuoUYN2u5yaRayTuavAb7IDsVMt484qA=
In-Reply-To: <1291107610.2488.46.camel@nerino>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michele Codutti <michele.codutti@uniud.it>
Cc: netfilter@vger.kernel.org

Hi Michele,

Both cases is because the CLUSTERIP uses broadcast addresses to
work, in the first case the message is because the packet is sent to
two machines and one of them always drops in order, to solve this
just disable debug netfilter.

The second case is probably because all the packages that are
being sent to the CLUSTERIP are being copied to all
ports on your switch, to confirm this do a tcpdump on any workstation.

The solution to this case is, enable "IGMP snooping" on your switch.

Att

Edison Figueira Junior

2010/11/30 Michele Codutti <michele.codutti@uniud.it>
>
> Hello, in these days i had fun with the ClusterIP target associated t=
o a
> web server. All is good and bright with the exception of two issues:
> - the message "CLUSTERIP: no conntrack!"
> - a general slowdown of the other network services (like ssh) of the =
two
> nodes of the cluster.
> To solve all my problems i've inserted this iptables rule:
> iptables -I INPUT 1 -m state --state INVALID -j DROP
> This is a solution that isn't good enough because i manage the apache=
2
> and the clustered ip with heartbeat2.
> Example: if i standby a node (for maintenance) and resume it after a
> while this can be a problem because heartbeat put the clusterip rule =
on
> top of the others so the dropping rule above became the second one an=
d
> then the workaround had no effect.
> Why the clusterip had such an heavy impact on the networking? Before =
the
> clusterip my cluster was active-standby and i've got no problems at a=
ll.
> Now that the load per node is halved i noticed more load than before.
> The strangest thing is that (with the top tool) this load seem not ex=
ist
> and the nodes are not loaded at all:
> load average: 0.50, 0.36, 0.37
> How can i fix this without the dropping rule above?
> There is a way to see how the networking is loaded?
>
> Thanks in advance.
>
> Michele
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
