From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nftables tutorial for dummies?
Date: Fri, 23 Dec 2022 18:31:52 -0800
Message-ID: <c3debeb6-d12f-cbde-c32d-7862496d388c@zoho.com>
References: <47d2afb3-7911-a903-d36b-6b231b4524a2@zoho.com>
 <c22a1be1-c761-d5fe-13d9-9896c9e79fbd@gmx.com>
 <5b6be8b3-341e-f8ec-dd65-6cd235f8de4f@zoho.com>
 <DM8PR06MB7717024A696385FE163875FCF9E99@DM8PR06MB7717.namprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671849114;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=y0r2HDORYPa86OKa7bq2oZHxv9nqfw4iG4c4Yz6MWvM=;
        b=We271JllwEDF/JAa5MxmiPYdzU/gQgmmIh9DI0d6647XGLJmHv1W628szep/h9QQ
        +ibmRoVqPUD9gb3a8m9tQzFYbuLleU0gAqjgNG/UWyYaLpLspmjvGfBMHv4SjJpQRrh
        wOxEcEvppC3M/JVDdpf04tihWS74FikE1T+pktB4=
Content-Language: en-US
In-Reply-To: <DM8PR06MB7717024A696385FE163875FCF9E99@DM8PR06MB7717.namprd06.prod.outlook.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Atkins, Brian" <Brian.Atkins@netapp.com>, =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/23/22 09:02, Atkins, Brian wrote:
> I found one of the best ways to understand what's happening is to use tracing (https://wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tracing) .  You can see the traffic move through the chains and rules and get a better understanding of how your matching is or isn't working.  I often just set it on my input chain, or on another chain where I want to focus; you don't have to use a pre-routing chain unless you need to catch the traffic earlier.

Thank you!

