From: Robin Kuiper <kuiper.robin@gmail.com>
Subject: Re: nftables drops related traffic
Date: Sun, 14 Jun 2020 10:38:51 +0200
Message-ID: <f191415454505f73fd86bbd3260fee5f2eae9349.camel@gmail.com>
References: <4baae47f34b92314090a0cda3b7b50bb3f253b8d.camel@gmail.com>
         <673e1c37-f74f-717f-ced8-814eb6acb543@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=s+OF5qbRSIfACUEZCYjbq+eEUgFe1bS2pAzf5eKNBGo=;
        b=QYZTBvaqCUZrdFv9b9ROXvEUqv1lCvhHtIGrRCHJKIx+JSXPszkMMcd6FHiemhaqpt
         dgD+rVunHHPBILwKHuc7wrDF2dXQrU6BCP/k/DWWCTEBWnlxhpoRanXwBcjDZe1AMRgK
         0FuhBCu9iyFObHm/MzxK8DJ+onXZxbUsgjx76rLfiYmcq820DENJl9+u99KNDiCFj1Q5
         4dCOWHoOIARvTISQjW1Se3MnL1dUGJ2ghlm7uuB9WsNx5dd/SgahqdXQ1HLY93G/NTRw
         05Zy3UGTjl6SH/UaB9DyXRbh7yZ/EMV34oRRIjmsaIykh797c4hqweG1O8Zha5ScZ8dn
         4KeQ==
In-Reply-To: <673e1c37-f74f-717f-ced8-814eb6acb543@plushkava.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kfm@plushkava.net, netfilter@vger.kernel.org



On Sun, 2020-06-14 at 02:17 +0100, kfm@plushkava.net wrote:
> If you want to be able to rely exclusively on the related ct_state
> to 
> allow such packets to pass, check that your kernel has 
> CONFIG_NF_CONNTRACK_TFTP enabled. It's usually enabled as a loadable 
> kernel module so, if you are able to "modprobe nf_conntrack_tftp"
> and 
> observe that the module is listed by "lsmod", you should be in good 
> standing.
> 
> The other thing you should know is that nftables has a specific
> syntax 
> to register connection tracking helpers and to attach them to a
> given 
> rule. The man page contains an example for FTP, which should be 
> straightforward to adapt:
> 
> https://git.netfilter.org/nftables/tree/doc/stateful-objects.txt#n29

Both solutions worked, but for both I needed to enable helpers by
running `sysctl net/netfilter/nf_conntrack_helper=1`, as specified in:

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_connection_tracking_metainformation

Thanks for your help!

