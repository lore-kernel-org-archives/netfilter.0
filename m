From: Andrew Beverley <andy@andybev.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 18:24:02 +0100
Message-ID: <1303925042.18916.20.camel@andybev-desktop>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	 <1303885014.18916.10.camel@andybev-desktop>
	 <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	 <4DB80945.8040304@atc.tcs.com>
	 <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
	 <4DB817A5.3020604@atc.tcs.com>
	 <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1303925046; bh=6pxOy9ICk7vG7MS35UXbLe0ty9FYVLriwqFK/
	U4zrVM=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=QXZRhxQH
	L8ze3bBwW9lFcz4issL4FoX1UNr9JhSXtj5PjQlAxiqOAa42zusT4O4zLkB+8Mk8BlW
	bOk3Ncq16SZVjEupCNnUJnJ4bsj6FP7sLyXM8VFR79IU/BocPPxyZOfDdyXG3urEy1K
	fMmSDg8J1zDZMt9nJcYl0Jjyti4tQ=
In-Reply-To: <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Hendrie <mike@hendrienet.com>
Cc: Vigneswaran R <vignesh@atc.tcs.com>, netfilter@vger.kernel.org

On Wed, 2011-04-27 at 08:41 -0500, Mike Hendrie wrote:
> Alright. Please let me explain.
> 
> I am implementing squid in the school.
> 
> Squid box 172.20.0.3
> All workstations gateway are 172.20.0.3
> All workstations proxy settings are 172.30.0.3:8080
> 

Ah, that makes more sense.

> The proxy settings are working fine for blocking content, however, I
> am having the following issues:
> 
> The school's web server is hosted locally.

Locally where? On the same server as Squid (172.20.0.3)?

>  When the workstations try
> to access the site via the public domain name, it fails.

Okay... well there could be a lot of reasons:

Your workstations will be requesting the URL from the Squid server which
will be resolving the public IP address of the website. The Squid server
will therefore need to access the public IP address, which comes back to
the question above as to where on the network the website is hosted.

You might need to set the DNS on the proxy server to resolve the website
to the local IP address.

Depending where you host your public DNS, you may also have to make
adjustments to that.

The web server itself will need to be listening on the right port to
serve the request - it may only be serving requests on the public facing
interface.

In short, more information is needed about your exact set up to answer
the question.

> Also, there are several applications the school uses. These
> applications range from port 5000-5005.
> 

Where are the applications hosted? On the internal network, on the
public internet, on the proxy server?

Andy


