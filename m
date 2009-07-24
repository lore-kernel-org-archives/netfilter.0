From: "Nguyen Anh Dung" <serepok@gmail.com>
Subject: RE: Is there any patch that makes iptables get Dynamic Access List?
Date: Fri, 24 Jul 2009 16:36:29 +0700
Message-ID: <FD85CE4373394ED096E5147E2B264DA1@home>
References: <ff3811580907230706nfec2577ya45b538d02f6db85@mail.gmail.com>  <t31h65199vtd2hsuvetre90h7p53g56dmq@4ax.com> <0B88570D519A4C2A9D72B6D56448FC3D@home>  <frvi6519ll5s7q59t45vrahqtfsk8fb3ji@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references:subject
         :date:message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:in-reply-to:x-mimeole;
        bh=QWBiAwl6GHSON/EZl40UndJ7O3qedo50iNDSFAHkcGo=;
        b=M+mwYzf6HVZktC0TbADJynp1JS9R/XKoaJqjn5v7hA/fymPcmdfLLBofKuBRyXNOt1
         LVc9L/1jGYZRY1nsYNC6sa32W8tZ5IZLVIMeU5CCh2LQGwwsSNTKrhiymRmpiWvpctOF
         S5dOylBe9OTW2t52DInK3e31nEYqRZdLbinx8=
In-Reply-To: <frvi6519ll5s7q59t45vrahqtfsk8fb3ji@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
Thanks, I think it really helps! Reading it...

Dzung Nguyen.

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Andrew Schulman
Sent: Friday, July 24, 2009 4:33 PM
To: netfilter@vger.kernel.org
Subject: Re: Is there any patch that makes iptables get Dynamic Access List?

> User Telnets to access server configured for Lock-And-Key.
> User authentication takes place. Authentication from local access server
or
> RADIUS or TACACS+ (CiscoSecure). If user passes authentication, the IOS
> software creates a temporary entry in the dynamic access list. The user
> Telnet session is terminated at this time.
> The user exchanges data through the firewall.

NuFW: http://www.nufw.org

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
No virus found in this incoming message.
Checked by AVG - www.avg.com 
Version: 8.5.392 / Virus Database: 270.13.26/2257 - Release Date: 07/23/09
18:00:00

