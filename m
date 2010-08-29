From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Sun, 29 Aug 2010 20:36:02 +0200
Message-ID: <4C7AA892.2050608@wpkg.org>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org> <4C7A9825.9080602@abpni.co.uk> <4C7A9A0C.50203@wpkg.org> <4C7AA590.6040704@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=default; bh=NLg8kTuF3
	0yGDNUBHTKm+XucwHU=; b=kafu2TWkJJKpuv0dPafsnCM++RoHzBqibHHzKYyYl
	9oIg35QHEwgkCj+q6fQey5ALJkrQ94XGvbxT7U57D7vZJ637qgwusSLy7troDvpz
	4VnQIAKU5VHdbhIH+fs6TqrOwy0M0zimSS+Z+6b+9PmF10VbJyfEThyG8P4I3tRS
	UY=
In-Reply-To: <4C7AA590.6040704@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On 29.08.2010 20:23, Jonathan Tripathy wrote:

>> I can use anything, as long as it "pins" given MAC/IP addresses to a
>> VM guest - and that any "rogue" guest is not able to disrupt traffic
>> to other VM guests (or, worse, the gateway) - i.e. by changing its own
>> IP/MAC to something else, possibly addresses used by other guests /
>> gateway.
>>
>>
> Yes, but the INPUT chain is only relevant for traffic destined for the
> host itself. Does the host actually do anything in your case, or is it
> just a bridging device?

Not sure I understand your question correctly, or if we refer to the 
same thing if we use "host".


The "host system" is a bridge and gateway, and runs VM guests (KVM).


As guests are fully virtualized systems, they are technically free to 
change their IP and MAC address (users have root access). This means 
they can be a danger to other virtual guests, or generally network 
infrastructure, if they change their IP or MAC addresses to something 
different they should have.

Therefore, I would like to prevent it, but so far, my tries with 
iptables or ebtables were not really successful.


-- 
Tomasz Chmielewski
http://wpkg.org
