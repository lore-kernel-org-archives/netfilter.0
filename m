From: Andrew Beverley <andy@andybev.com>
Subject: Re: traffic shape per ip
Date: Thu, 19 Sep 2013 21:34:26 +0100
Message-ID: <1379622866.3407.93.camel@andylaptop>
References: <523B45EA.5090501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <523B45EA.5090501@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1379622865;
	bh=mDQ8U6NU4BPi6h0vOZR9fAXmmkG8QOumLWVD/KVDrS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=NOvpgq7vEyKaTGuk/twtxGO2c9cL6T03Pqx7kxhsRY1uZ0Swanr/N3trsNHUG1Q7f
	 OOM84bbk+vYqfMg/7sz54dj1p5DBi8JmrtQprTD713BtTOA27FYWJsYZ7rnahdZa4T
	 JlphpxREtPvxvAFctpDRTUk2CShS5xDVlFjf4dQg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: binary <dreamer.binary@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2013-09-19 at 21:43 +0300, binary wrote:
> i would to limit the bandwidth of some users based on IPs:

[...]

This is not as simple as you might think. In order to shape per-IP,
you'll need to set up a class for each individual IP address, and then
filter to that class. I am not aware of a way to write one rule to say
"limit each IP address to this amount".

Presumably the reason to filter per-IP is to stop single users hogging
the bandwidth. If so, a better approach might be to classify the type of
traffic and then shape on that, or alternatively share bandwidth evenly
per-IP rather than per-connection (as is the default). There is some
information on how to do this on this page at the end of the "downlink"
section:

http://www.andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux

If you have any more questions you might want to use the LARTC mailing
list instead of this mailing list.

Andy


