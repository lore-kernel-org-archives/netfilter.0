From: MargoAndTodd <margoandtodd@gmail.com>
Subject: Re: what should I use for "unassigned" ports?
Date: Thu, 07 Jan 2010 11:03:54 -0800
Message-ID: <4B46301A.5080207@gmail.com>
References: <4B44D277.3000801@verizon.net> <56378e321001061233o121c12fgadc33b03639343c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=o2P6gwNRvJsdBXVztLRG/zwpg9k6ZkhzDurHBl2zhoU=;
        b=tYj/XWPo/qI+yhBScuk1ZSN3JDyu11NKMEBT5FRfnt0yCYLPjGDOkZ9oK5G6UvGop6
         SNxIN1IoZYQvMOkvCuoLdt1YefeG/2CjqCuYaEfIUijwAKF7Prw1tPegRF7KDtMRqKAt
         ng4YOGEjR9NbSyIv6q+pZXnqg7mqGJzLQ/+NQ=
In-Reply-To: <56378e321001061233o121c12fgadc33b03639343c8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 01/06/2010 12:33 PM, Richard Horton wrote:
> 2010/1/6 Anthony Ewell<amewell@verizon.net>:
>
>> Having taken a more recent look at "/etc/services", I
>> am finding zillions of service ports above 1024.
>>
>> With that in mind, is there a better starting port
>> for my "unassigned" ports?
>>
>
> Sadly these days nope - the assigned port numbers are now all over the place.
>
> However, alot of them are not likely to be in use on your system so
> you ought to define your unassigned port range by what you are
> actually running not by the contents of /etc/services (same goes for
> protocols).

So, pick the highest port I use and go somewhat above that.
That will work.  Thank you!

-T
