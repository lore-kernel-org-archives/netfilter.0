From: Damir Franusic <df@release14.org>
Subject: How to get conntrack(CT) data using libnetfilter_queue(NFQUEUE)
Date: Sat, 9 Apr 2016 11:54:00 +0200
Message-ID: <5708D138.5080108@release14.org>
References: <5708D0CE.2070908@release14.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=release14-org.20150623.gappssmtp.com; s=20150623;
        h=subject:references:to:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=bvATYB0zy28MdjM8sXLNZUnD68riEI/WTzPrR+CpPCs=;
        b=VedMI03x27HwlKwKhVWipYnwn/j7EnisHNzwFe8qez3PI6fwVKgaYZSIyc0iydTM/u
         CmllRBTCCSnXM9i7M0hBdRyOAFlzStsCt46gHtn4euERnT7wj0P6MFX2vz+L+f8mZA2/
         aVHLjX5D1D5st7BzIyBBn6Bmz/128ynhWY/8J9QOB5jJBKh4i5S8x8CcWDwT7vwXQkpA
         BMotjujEFATGDV8tJpr/HBpedOuXg7pdPHEm/VlhJQU6NMfn/V9wOP7LdzWCV5vwoS/w
         JQMPPEgGqhIGNOwI9tCrZ9CfvmlQBtogpV0/wJHX8upxF5UGOtflTNAdZOXhwJOtbYeK
         ebpg==
In-Reply-To: <5708D0CE.2070908@release14.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

  Hi

I am currently using libnetfilter_queue to pop packets from NFQUEUE and 
fetching conntrack data separately using libnetfilter_conntrack. I know 
there should be a way to receive both packet data and conntrack data 
when reading from NFQUEUE but I couldn't find any related documentation 
or examples. If there is a simple example I would really appreciate it.


Kind regards,
Damir Franusic
