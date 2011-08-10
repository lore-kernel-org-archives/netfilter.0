From: Ryan Whelan <rcwhelan@gmail.com>
Subject: Re: Sniffer + Iptables
Date: Wed, 10 Aug 2011 09:02:16 -0400
Message-ID: <CAM3m09Q2UAU9=ZDMAgujxNBiTC31HRyWw9m0yrTBL1w+S4ZwnQ@mail.gmail.com>
References: <F39547DD-D193-4529-A40F-88801B58FDD9@me.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=207O4pQb9YKZTiSy/jauJ4YxjRVsUKsMUsjBqA33Z9E=;
        b=wm9fs4v76tvPBc4U+RzxNhI7EFid70LFnIOmxSDibf/Ta3CHrdp0a56KUHpCasa73P
         6p2Q3RPR2l+AmtkVeeHCe3COo9yrweCHs6+j3ewbkxunD5GAGey5USB9UoXe6ea8+CXz
         uYH/bUg3nkDPcgyK8Pu4hZcU+yToP09VlKDv0=
In-Reply-To: <F39547DD-D193-4529-A40F-88801B58FDD9@me.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniele Rossetti <daniele.rossetti@me.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Are you trying to capture the entire packet or just see which packets
get through? For the latter you can use the LOG target.
http://www.linuxtopia.org/Linux_Firewall_iptables/x4238.html

If you want to capture the entire packet, I believe ULOG is what you
are looking for.  I've not used it, so I might need correction on
this.

On Wed, Aug 10, 2011 at 7:22 AM, Daniele Rossetti
<daniele.rossetti@me.com> wrote:
> Hello people!
> Does someone know how to sniff packets after netfilter chains??
> Because tcpdump works before any chain so it capture packets which sh=
ould be dropped by iptables and I need to sniff only the packets that s=
urvive iptables filter
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
