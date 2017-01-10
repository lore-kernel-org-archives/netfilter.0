From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Iptables Reject with TCP Reset
Date: Tue, 10 Jan 2017 13:32:21 -0500
Message-ID: <20170110133221.560d3b6d@playground>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
        <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
        <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
        <19ab6efe-7891-3950-e468-11dd59e71246@familie-kuntze.de>
        <HK2PR0201MB212932A38853DB306E300014E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
        <4f4fa7f2-0f5f-ac04-4bc2-f10c455da613@familie-kuntze.de>
        <HK2PR0201MB212958238BE1225DA9B7FC09E8640@HK2PR0201MB2129.apcprd02.prod.outlook.com>
        <b7cce260df01445c8c387889d3b30114@CCDEX021.corp.corpcommon.com>
        <HK2PR0201MB21294E23EB7B6CFD0DE8D406E8670@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU v0AIWO7j020885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1484073144; i=@wpi.edu;
        bh=wIVnATnYgZXEclbbD5xV9yLB4WGMbeSVJmvvNEPUvuQ=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=QIhMl2F4HGCe6I4UdcvV4p6C0v6j8UZngVtOsyEjHb57ZiVy3iq5vhkrkKznLYeWK
         Z1H1/Uy0kOa5+SDlvd8GP7vzDBpEZdufvm/Nbzu7mHjuoDAqyZwDjaxai66n3bSorC
         l4m/9cNu67bfW0rQQyS9pk/wmmPAbZfcLwF4RnxU=
In-Reply-To: <HK2PR0201MB21294E23EB7B6CFD0DE8D406E8670@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 10 Jan 2017 10:09:55 +0000
Matt Killock <matt.killock@praemium.com> wrote:

> > The rule you made here makes little sense , It would be preferable to make a more simple rule at "the top" like this ...
> >
> > This will allow "all" traffic for rules you have already allowed through other rules in the FW ( no matter the IP or interface ) .
> 
> I note that it would be simpler to have one such rule for RELATED,ESTABLISHED but that's not the way we've done things here, much to Noel's disgust. :)
> 
> We've blocked everything, including OUTPUT, by default. There are no general SNAT rules or MASQUERADE. We've tried to allow only the bare minimum required for two-way traffic between a small set of host/port combinations. This has led to some unnecessary duplication of ESTABLISHED rules, and I didn't appreciate that RELATED traffic is what the 'REJECT with TCP-Reset' traffic is classed as but otherwise it makes (some) sense and does work.

This doesn't make much sense. A RELATED packet is the first packet of a new conn that a helper has determined is related to an existing conn (e.g., the data conn of an FTP control session). Once a RELATED packet is replied to, the resulting conn is an ordinary, vanilla ESTABLISHED conn; specifically, the RELATED 'tag' is discarded. When a packet matches a "REJECT with TCP-Reset" rule, netfilter immediately sends a TCP RESET to the end that sent the packet.

It may be that TCP RESET applies to the first TCP SYN packet of a conn. But RESETting only established TCP conns and using ICMP 'admin prohibited' for all other packets works well and is logical.

It almost sounds like you built a nearly stateless firewall.

A rule near the top that allows packets for ESTABLISHED,RELATED conns to pass is more efficient, and is probably significantly more-so on a busy router because *most* packets will be associated with established conns and should be handled without needlessly passing them through all the 'new conn' checks.
