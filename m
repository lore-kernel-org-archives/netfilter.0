From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Set timeout, gc-interval and size parameters
Date: Fri, 6 Mar 2020 11:58:28 -0500
Message-ID: <0c4e6c3a-b7bb-9c0f-8cb1-15d71d956c4a@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=6IsSa+/YzxIVzQVOn4Mt8I9to0rbTl+ljqi/Tly7lCM=;
        b=Kvyrsy0rPsvb+NiuFco/3mMGhkaajcPXc9i3HfR8xNrNUYROYlnyCbK4MJHiZ0/rBKkCIIdq66LChGk+nTKRKJrs7mJjtUMgloRNkn1MqnQ94t45fECwSgnZSH7FPLdI29lp2Iew4KKt02ndITD6kkMiqfEx7IYek1CcGTtpTNM=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm trying to better understand how set timeout, gc-interval and size 
parameters work.

Consider a set with timeout 30m, gc-interval 60m and size 1000*:

In the following, the set begins with no elements. Then elements are 
added but never updated.

1) At "time 0" (on both timeout timer and gc-interval timer, here 
assumed synchronized for simplicity) the first element e0 is added.

2) Until 20m, 999 more elements e1 - e999 are added.
The set now contains its maximum 1000 elements, e0 - e999.

3) At 20m, nftables (through packet path) attempts to add element e1000. 
Does e1000 get added to the set?
What elements are in the set after this attempted add?

4) Until 50m no more elements are added.
At 50m all elements have reached timeout.
What elements are now in the set?

5) From 50m - 55m nftables attempts to add 100 packets e1001 - e1100.
Although all previous elements have reached timeout, garbage collection 
has not yet taken place.
At 55m, what elements are in the set?

6) From 55m - 60m no more elements are added.
At 60m the first garbage collection triggers.
Does the set contain the same elements before and after garbage collection?


* This may well be an inadvisable combination of parameter values, but I 
hope they're useful in understanding how they affect the behavior of the 
example set.

As an aside, does anyone know what effective gc-interval is used if it's 
not explicitly specified?


Thanks for your help,
Frank
