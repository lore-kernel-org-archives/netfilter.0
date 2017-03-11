From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: Re: ANNOUNCE: New talk accepted on Netfilter Connection Tracking
Date: Sat, 11 Mar 2017 09:26:16 -0500
Message-ID: <715ce549-543c-81b5-6025-a57bcf02746d@mojatatu.com>
References: <71f7cf32-ab66-2b05-aa55-631e08d23a45@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=DWe7FuZ6YKpGt6sLMtFprDqr8B2fhfzoUocFz2z8FHA=;
        b=NeGQVtd4d3C5SbZAC1ofUNRyAgb2Qq0i6FHFqZ7xHqz1HBRSuYDbz9SnpeSZdfiZo3
         vXFBeMOI08LsJkKN3wqzzRinZ1Pa0p4kRk40SZzRj1Z+iqaeP/G7BqkZkyG/B9msp137
         +srUqKnKPr8Ze13Fe6YVnvD+Hpyaqgh6FZ7HC2DDfhZMCbAEkFZfKuhYrf1ybxDgvWci
         sL+veN14qboU1XBt/4ob67KxHN3tXXVOtJAxeAnKaBiRhvErQc6t7KZ/EqqGPfxOU1//
         U8mf0PzSeihIzpxd8DWeNzBIFNpqVDvSgmT9s+Vhmy423TYcZgg7DYmGpQgN5m5n9NbB
         i0Fg==
In-Reply-To: <71f7cf32-ab66-2b05-aa55-631e08d23a45@mojatatu.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org

Apologies - I used a template and forgot to change the subject.
Will send a new announcement.

cheers,
jamal
On 17-03-11 08:48 AM, Jamal Hadi Salim wrote:
>
> The tech committee would like to announce a new accepted talk.
> OVS without OVS, by Joe Stringer
>
> The description is as follows:
> -----
> The OVS kernel module provides a user-facing API that models a datapath
> bridge that connects multiple ports and is configured through a single
> flow table. This flow table allows policies to be written around a wide
> range of fields and provides actions to manipulate and redirect packets.
> A primary goal of this design is to allow flexible user-defined policies
> without complicating the kernel for every use-case; this has been
> well-aligned with recent industry interest in SDN.
>
> The most well known user of the the OVS kernel module is ovs-vswitchd,
> which is a fairly large userspace program that provides an OpenFlow API
> for programming. However, there are a number of other users and
> use-cases outside of ovs-vswitchd and SDN for the OVS kernel module.
> This paper presents the OVS kernel API, shows how it can be directly
> configured with simpler low-level utilities (eg, ovs-dpctl), and looks
> at how it compares to similar APIs such as cls_flower. Finally, this
> paper surveys a variety of open source projects which build upon the OVS
> kernel API without using the OVS userland utilities.
> ----
>
> cheers,
> jamal

