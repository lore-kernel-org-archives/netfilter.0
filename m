From: nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com
Subject: Re: nft list sets changed behavior
Date: Sun, 18 Jun 2023 14:12:51 +0200
Message-ID: <962b1e4f-63e2-bc3b-bf27-5569c6402c0f@qmail.sunbirdgrove.com>
References: <60e59333-3d37-5b66-e0ed-8e7d4c01d956@qmail.sunbirdgrove.com>
 <20230618122216.3bdd0e34776293adb0655516@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qmail.sunbirdgrove.com;
        s=dkim; t=1687090372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y6n0c+vbYIg+N4Z5hDbIJWxGFPzDBUW+ATHkyLZ0YVg=;
        b=xTPYg5MafZqJmoBhidGgdRSiPimIn2hYJ9EVZA0HCqkz45PlSHvmgrq35XurZfmH9YWd/8
        hISWNHUOVAvKbcBil3qManLbWZ4Mo4puj7NEMGNVi28MfdEwAutJcegbwMtOQaTlNA2G1X
        qqoswEE7Sfa5Y2xqDIrCCRlh6eAOSeA=
Content-Language: en-US
In-Reply-To: <20230618122216.3bdd0e34776293adb0655516@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thanks for your reply. On Debian 11 it did list the elements for at 
least a year, that's why I'm surprised about this change. 0.9.8 vs. 1.0.6.

I'll look into filing a bug.

On 6/18/23 13:22, Kerin Millar wrote:
> On Sun, 18 Jun 2023 02:42:46 +0200
> nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com wrote:
> 
>> After updating to Debian 12 my tools relying on 'nft -j list sets' fail.
>> It now does not include the elements in those lists like it did on 11.
>>
>> Is this hidden behind an 'anti-terse' flag now?
>>
>> Web searches, the changelog on the site, and manpages didn't reveal
>> anything.
> 
> Running `nft list sets` doesn't list elements either. Unfortunately, whatever the intended behaviour may be, it is not documented at all. The nft(8) page states that the "list" verb should "display the elements in the specified set", which can only describe the "list set [family] table set" syntax, rather than the "list sets [family]" syntax.
> 
> I agree with the implication that to have "list sets" include the elements, unless -t is given, would be more consistent and logical. I would suggest filing a bug for further discussion.
> 
