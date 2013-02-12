From: Andrew Beverley <andy@andybev.com>
Subject: Re: LOG target with MARK?
Date: Tue, 12 Feb 2013 07:36:32 +0000
Message-ID: <1360654592.30430.153.camel@andrew-desktop>
References: <20130212030235.GA16352@devnull>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130212030235.GA16352@devnull>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1360654601;
	bh=vB8oB9HbIKNiosGI3FTcYLL52+pARhNf6jUWx7hEmss=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=Nvdqrzr6cznAAOUpPPLVaTueufmoJg13/SSD093SWUvf4PauBqRChLvdirs7pojy2
	 WZmRUArpCZkCdoTyEfIsOH8sH3s+IUtGY3jWyr5J/UCLU66gpuwU/HvgKIN7tm85YQ
	 oucyGbFWcJ+AAS91W+9UdQoDPShntY18nhQDVTMA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

On Tue, 2013-02-12 at 11:02 +0800, Aaron Lewis wrote:
> Hi,
> 
> Looks like the LOG target doesn't output the mark of a packet?
> 
> I checked -j LOG --help and there's no such option, so what should I do
> to get the mark of each packet and print them?

It will log marks on packets by default. If there is no mark then
nothing will be printed; if there is, the value will be printed at the
end of the logging line (eg MARK=0x64).

Andy


