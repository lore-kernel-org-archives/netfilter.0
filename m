From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Sun, 29 Aug 2010 19:34:04 +0200
Message-ID: <4C7A9A0C.50203@wpkg.org>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org> <4C7A9825.9080602@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=default; bh=1zsvZcZiE
	I86O3gYpV8NuF6t86c=; b=rb5klRHeJLgHgQbKpFz3n1jKuipJu8IOrlIbcYwvo
	5v+35x2QU/BEROSQK2KPhpCGubRx59u/Vm6djy4jcgujavAtD7UaUHqPZDEl53IU
	abQMFwmMQVr9nACbCRIN5j7HB0/VBAZbYn5Erf3V5GOwOgtdoFxCmpHM6mjdaf7q
	f8=
In-Reply-To: <4C7A9825.9080602@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On 29.08.2010 19:25, Jonathan Tripathy wrote:

>> Also, if I do this on the "rogue" guest (with MAC, IP belonging to the
>> "other" guest):
>>
>> ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
>> ifconfig eth0 1.2.3.22
>>
>>
>> any communication to the "other" still breaks (from external hosts).
>> So, no improvement.
>>
>>
> Why do you need to use the INPUT chain with ebtables in a VM
> environment? In my ebtables setup, I have INPUT to drop everything,
> except stuff from/to the loopback interface (lo)

I can use anything, as long as it "pins" given MAC/IP addresses to a VM 
guest - and that any "rogue" guest is not able to disrupt traffic to 
other VM guests (or, worse, the gateway) - i.e. by changing its own 
IP/MAC to something else, possibly addresses used by other guests / gateway.


-- 
Tomasz Chmielewski
http://wpkg.org
