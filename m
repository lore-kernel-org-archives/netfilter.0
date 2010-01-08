From: MargoAndTodd <margoandtodd@gmail.com>
Subject: Re: passive mode ftp high ports driving me nuts
Date: Fri, 08 Jan 2010 08:09:38 -0800
Message-ID: <4B4758C2.7050607@gmail.com>
References: <4B46323E.1050106@gmail.com> <4B4707EA.9010301@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=dfC4bkk9gTmRLGz4RLW7IderqyC8m+23AsXL0BQM90Q=;
        b=lmB/33u/VfhJXuBkMGMCpa76JS4Ph6myXgnEKdvUW2dB1rWWF+Z/oEyxGneHW9yosq
         yQl66Jv72qaEh0/il91oAD7ytqmKbEPHYCa2fZhwnmOU/xk/IxdQbY3EOfJv1T1WkPIm
         Z4VnmzV658kxiVFffv2xG30IVJYenqAnTIVSo=
In-Reply-To: <4B4707EA.9010301@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>> It is the "--sport $unassgn --dport $unassgn" that is killing me.
>> How do I restrict the last three to just passive mode ftp?
>>

On 01/08/2010 02:24 AM, Mart Frauenlob wrote:
> use the 'helper' match extension. i.e: -m helper --helper ftp.
> if you need to distinguish between active and passive, you still can use
> the port and state matches for that.

Hi Mart,

Thank you!

Can you point me to the directions/manual for the
"-m helper --helper ftp" so I can figure out what
exactly it is doing and how to install it?

Many thanks,
-T
