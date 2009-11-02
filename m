From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 2 Nov 2009 21:58:38 +0000
Message-ID: <ac5c74140911021358i36d81ff5r3fe2305c2017d18f@mail.gmail.com>
References: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>
	 <4AEF0003.5060404@plouf.fr.eu.org>
	 <ac5c74140911020902s71f6660cl28e7f3d8a436afa8@mail.gmail.com>
	 <4AEF4E5A.9010407@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=QfRDaY4X50M4JqDxn28tKYtcvzZr6/0f/2NvahQ8tX4=;
        b=KyCyk5jamv/tbDPlm2q4lnotAHuy2cLmRUrwVRjl98ACSugxoxrb54gfHqUTYMbRu3
         /FsuX6OF59FsTcSSd/GXRTyj53+7FDMOvEhOkZjZSk2jZLBRx5SADpOIBDzxSBreK/n3
         lRnjLwBZNOphHQSo/SRvX8jcmEaCYmjRaghgA=
In-Reply-To: <4AEF4E5A.9010407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>> I was thinking of a typical SOHO router (combined switch, routing, nat
>> and firewall) or a simple standalone linux box that has a switch (even
>> outdated hub!) connected to it and then the 3 machines on the far side
>> of the switch.
>
> With a SOHO router, it depends on how the built-in switch works. If each
> ethernet port is or can be set as a separate interface (possibly through
> the use of VLANs), then you can build a Linux bridge and inspect bridged
> traffic with ebtables or bridge-nf + iptables. Otherwise, a plain
> switch, either built-in or external) won't allow you to inspect LAN
> traffic. Traffic between two machines will just flow through the switch
> without hitting the firewall.
>

I'll look into etables, thanks for the pointer.

My home router is a Linksys WRT54GL with a 4 port switch. I have
installed DD-WRT on it.

I just presumed, at least on a home network SOHO, that I could control
access to internal LAN devices at the iptables rules level (layers 3,4
and 7 if l7-filter is inbuilt).

I just took a quick look at switches and see they perform rudimentary
routing at layer 2. So thanks for clearing that up. I'll do a bit of
reading into etables.

If I understood what you said about firewalls and switches in broad
terms (possibly in an enterprise setting)  I can essentially  "trick",
for a want of a better term, the switch to forward all traffic to the
firewall for inspection regardless if the packets are outbound or not.
