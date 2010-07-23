From: Padmalochan Moharana <padman.m@gmail.com>
Subject: Re: Regarding write send a packet to network that received in 
	NF_IP_PRE_ROUTING
Date: Fri, 23 Jul 2010 13:40:29 +0530
Message-ID: <AANLkTinfBr118bjpGc0NTc0K-UWnTH5uOejuVTRBRF-v@mail.gmail.com>
References: <AANLkTilFBhfh-jBBaO4eJAzDw0gU_PhBEcEc1mdsUjjo@mail.gmail.com>
	<alpine.LSU.2.01.1007230923580.10737@obet.zrqbmnf.qr>
	<AANLkTinw-mq4AKrqIqMzEitD0xUJkTxiT93Uey5TDK2r@mail.gmail.com>
	<alpine.LSU.2.01.1007230942001.14208@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=xFj3R2VMItmfmdXbTpr8cTYBs2TO0M9pfIpphy21iz0=;
        b=pC9VLP+0xcYNKm+Yb+LaIB8VLLEBGI1rz7RKIHAOokiMowHnwBANy+UiNRlbkkodDE
         hgbDE82dLGlrjPeETa4tCPSl5M4ymkVUjxP+mT291k3ZVmgdKGk2k2Uo4tW7I2pgbiII
         TmeveayaO/L5x+M4/7o5IsW/ddOwYeXFH7eQU=
In-Reply-To: <alpine.LSU.2.01.1007230942001.14208@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi ,
I have sent code of the function only which is called inside the
function that is register to NF_IP_PRE_ROUTING hook. In this
function,the IP header of the received skbuff is updated to resend the
packet to network in another device.

I think some  other parameter of the skbuff should be updated to
reroute the packet.Please let me know which parameter should be
updated to resend the packets to network in this case.

BR,
Padmalochan

On Fri, Jul 23, 2010 at 1:12 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Friday 2010-07-23 09:29, Padmalochan Moharana wrote:
>
>>Hi,
>>
>>Please get the source code for the issue.
>
> This does not even compile as-is.
>
