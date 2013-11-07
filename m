From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 20:53:57 -0300
Message-ID: <CACuyg25f1m5dxUzLK+yJE2VeLqPAQMuWUrd_i_X7+MThJtNimA@mail.gmail.com>
References: <5278501B.4040406@ngtech.co.il>
	<CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
	<527BC564.1000008@ngtech.co.il>
	<CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
	<527C0E1A.6050003@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ByGC3fWXr3Q6lXxXcrc3lEWG1ba8YuaKgtUDZoLwcXw=;
        b=ucete9ANykmqckKQwhKqQMsQ5f6uDKjA+ClQ6mZ/BdVeHKgsZApHIZpwLvbxg65XW3
         gLbwrrEKl4PduWpQkIRdIRsJg4/GBzD3Kg8ooMu6DS7kBaY9JfhdpJl6Jj5D493KxGyK
         zQLY8wgzZ6wR0ssvKr23BdfuDqjwMqoWdmXZ8Jwc7Vnwp7fCiJ5i2kIptCk5pQhhrxoK
         SAgtYfTnq7abCfs7Af8/NSQqelMagB/VlXepyi8FC5m7H5cRiFYFWvG2TO2NzDYPYxTB
         MeeN0wfdZ2Kg5Gu0mYtuWlnWb/28DEfxEYssfA2cvLLKmfaTG70nVqKB4CLLnTb1Y5Sj
         TQKA==
In-Reply-To: <527C0E1A.6050003@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

2013/11/7 Eliezer Croitoru <eliezer@ngtech.co.il>:
> This is the part when I got confused while trying to understand the "ipv4
> route cache removed".
> ip route show cache will show "blank".
> but when I run ip route get 201 I see the result with "cache".

I was a little confused... rs
Are you working with a *disabled routing cache kernel*?

IMHO, as the Neal Murphy comment... the configuration that you showed
does not allow balance per packet.
You need the routing cache to avoid this problem. Just set gc_interval
and gc_timeout values according to what you need.

During 60sec (default) you get the same gateway (for all lookups).
But each learned path will be maintained by gc_timeout sec.
After this time, the system selects a new gateway and eliminates expired paths.

Just decrease these values and not set to 0.
