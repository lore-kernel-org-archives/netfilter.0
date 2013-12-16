From: Igor S <nat4592@scarlet.be>
Subject: Re: SNAT range does not use unique IP
Date: Mon, 16 Dec 2013 09:17:35 +0100
Message-ID: <b52fefde900473c435ec56a50c2f5242@scarlet.be>
References: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be>
 <20131212223443.GA2211@home> <dbbe65eac46a94f6da1bf3b22ec75b34@scarlet.be>
 <20131213172115.GB3067@home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scarlet.be;
	s=scarlet; t=1387181856;
	bh=KXRG1cfxauXPLetPelrmIuP45T5ot+K9b+E/9SNlwQU=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID;
	b=ky0ENhJnTnOA6kfErGHoULgjhsgvCaRYj0FV/Bbpiy+7Mwtmw2FT6MDtBwg9Q35ij
	 t7gn3pOwlicZuLI5yNCTECsGD6M9Cc0NMtJiCmEMTSaN4d939YfU9dLR/sYMVyb8gK
	 AEHpekzwW0AbAI83/yc4PxiVY5hIYmarBHk6tPzg=
In-Reply-To: <20131213172115.GB3067@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil Oester <kernel@linuxace.com>
Cc: netfilter@vger.kernel.org

On Fri, 13 Dec 2013 09:21:16 -0800, Phil Oester wrote:
> On Fri, Dec 13, 2013 at 03:34:33PM +0100, Igor S wrote:
>> On Thu, 12 Dec 2013 14:34:44 -0800, Phil Oester wrote:
>> >On Thu, Dec 12, 2013 at 10:55:53PM +0100, Igor S wrote:
>> >>I am trying to build a kind of a dynamic 1:1 SNAT gateway that is
>> >>supposed to build every incoming IP to a unique internal IP in the
>> >>internal network without any port mangling.
>> >
>> >Then you should be using the NETMAP target.
>
>> Hi Phil,
>> Thanks for the quick reply
>> NETMAP would not be good for my case as the server is not supposed
>> to handle the entire 100.0.0.0/8 network. It only has to map the
>> number of addresses specified in the range. And i need to know in
>> advance what addresses can be used on a particular NAT server.
>> The idea of using SNAT is to "compress" the source network and
>> translate only the active clients.
>
> Unfortunately, SNAT and NETMAP are the only two options available.
>
> Phil

Understood. But is it normal that NAT uses absolutely the same IP/port 
combination for different source IP's?
Igor
