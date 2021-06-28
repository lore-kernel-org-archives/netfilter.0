From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 13:47:03 +0200
Message-ID: <fc8a9cbf-7424-1d14-e927-bbf454733434@tana.it>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
 <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
 <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
 <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
 <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
 <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
 <83719383-c18d-dcb6-07f6-f123872fa68b@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1624880824; bh=rNawX8TDL8X9j/LUiMd6FC2RexnHfexgFiCLH/Z9MDQ=;
        l=917; h=To:References:From:Date:In-Reply-To;
        b=B8HV+hLe3ZxyrtqNCY2ASheJLNlKxXyvVJ0/v2/zwX3X3zqxnyPdJvEUO62+42M0z
         FYgX6LQ6pwUGZw0mwO55+6B6BSnNJWBZB1f5e+v4LVbf6Q3OmUphfeuMaxGAXkqV0G
         zaI4W38vm7lh+EPQSqa3qcfM6MD827oXbVu9R1h7LUGw2ApTQBhd0WQuL7UdI
From: Alessandro Vesely <vesely@tana.it>
In-Reply-To: <83719383-c18d-dcb6-07f6-f123872fa68b@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

On Mon 28/Jun/2021 12:17:11 +0200 Reindl Harald wrote:
> Am 28.06.21 um 11:23 schrieb Alessandro Vesely:
>> A complex script doesn't have to be error prone.
> 
> it is by definition more error prone than a simple restore which has exactly 
> that job and it makes no sense to argue about such simple facts


As Kerin showed, restore is not intrinsically simpler, as it has to deal with 
the same amount of data.  It is only laid down in a different format.  The 
shell format is more verbose, but has some advantages:

* it allows to test each single command separately, and

* its format is time-honored and fully documented.


> do what you want but stop talking nonsense when it comes to best practice 


One "best practice" that I'd object to is blindly restoring whatever was saved 
on shutdown.  How can one control that?  Booting with some clean, well-defined 
data looks safer.


Best
Ale
-- 





















