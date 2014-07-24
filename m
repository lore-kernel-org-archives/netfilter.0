From: Laurent Parenteau <laurent.parenteau@gmail.com>
Subject: ulogd2, netfilter, and link-layer information
Date: Thu, 24 Jul 2014 09:24:43 -0400
Message-ID: <CAKrqPw_gn1g4b6AQ3hq6xzKKyRuYHB_zubeRv9ETtHDaWHarxQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Lo2lQ+fdt1gnuz3mFYmyFOlDJXhq4vxC6Ug7YTzS/rM=;
        b=C4WZa3twjABt45tKd+PdS6TCLZCeEdpL/kRBent4sKdD5gB613k+aB5GKdW0r+TOze
         awyqt+xbqeJCuqofyzTgmVP2iU71Ec8Tlo44BexGlCmJqQsjHF00/DiIR0a9yw9FnWjE
         qxYzhy1iazO7bMeFhey4bgBD57Rh/b2Rb3pe6X5tDHnS7SvFV7sRbnN4wEp0ZotociPP
         n5vNCmajLJ+Jm5TRBzl5mvct7qbyyqQO1Bg9jCYSvifqNAoQfMT6wpdfCpSqILV4aY5y
         PkdTmYGz25SHOEVSIgymss6izPnTPWLRGphIZUM9z8Z3IT1PUDsynpnfQ2ipSzAe94Vk
         iHBg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have recently used ulogd2 & netfilter to capture some traffic and
create a pcap file.

In the resulting pcap file, there is no link-layer information.
Everything else is pretty much the same as what I get from a tcpdump
capture; the only missing information is the link-layer (layer 2)
information.

In wireshark, that missing information is displayed as a "Raw packet
data" section, with the content being "No link information available".
That sits between the Frame information and the IPv4 information.

So my question is, is it possible to capture the link-layer (layer 2)
information as well using ulogd2 & netfilter, or is this a limitation
of the tools?

Thanks,
Laurent
