From: Igor S <nat4592@scarlet.be>
Subject: Re: SNAT range does not use unique IP
Date: Fri, 13 Dec 2013 15:34:33 +0100
Message-ID: <dbbe65eac46a94f6da1bf3b22ec75b34@scarlet.be>
References: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be>
 <20131212223443.GA2211@home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scarlet.be;
	s=scarlet; t=1386945275;
	bh=QRU4JBVN67MLzOiuT8Bt7NdBWLcizVJerej5zmyyCk8=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID;
	b=GFjg5M/Rzz1GmM/7xY2YSAI2EYAs3DT3cknogUrQrTC+oosweNo0g+kGRDJrtmHLm
	 f99ShQspxICMELZ02eafoesrUUYnvIaQXaowjOi0cJPfn5L+HD9t8jTwE6ku57cRLZ
	 HB3qOBoGdLX2oJsGApVRLGciEKYdGbv3K4JrXA7s=
In-Reply-To: <20131212223443.GA2211@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil Oester <kernel@linuxace.com>
Cc: netfilter@vger.kernel.org

On Thu, 12 Dec 2013 14:34:44 -0800, Phil Oester wrote:
> On Thu, Dec 12, 2013 at 10:55:53PM +0100, Igor S wrote:
>> Dear netfilter guru's
>>
>> I am trying to build a kind of a dynamic 1:1 SNAT gateway that is
>> supposed to build every incoming IP to a unique internal IP in the
>> internal network without any port mangling.
>
> Then you should be using the NETMAP target.
>
>    NETMAP (IPv4-specific)
>        This target allows you to statically map a whole network of
> addresses onto another network of addresses.   It  can
>        only be used from rules in the nat table.
>
>        --to address[/mask]
>               Network  address to map to.  The resulting address will
> be constructed in the following way: All 'one' bits
>               in the mask are filled in from the new `address'.  All
> bits that are zero in the mask are  filled  in  from
>               the original address.
>
>
> Phil

Hi Phil,
Thanks for the quick reply
NETMAP would not be good for my case as the server is not supposed to 
handle the entire 100.0.0.0/8 network. It only has to map the number of 
addresses specified in the range. And i need to know in advance what 
addresses can be used on a particular NAT server.
The idea of using SNAT is to "compress" the source network and 
translate only the active clients.

Thanks,
Igor


