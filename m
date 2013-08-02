From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: [RES] Re: net unreachable ipv6
Date: Fri, 2 Aug 2013 13:17:43 +1000
Message-ID: <CAMD-=V+myg5gef_7L2R+2Lq071PseYZeqDbFmjVDy4X1uBexBQ@mail.gmail.com>
References: <CAMD-=VJjymnAL9FuGnSTLvxFLnmAy9nrO9mdMkvbWNdiDxw1GA@mail.gmail.com>
	<51FAA2EF.4070001@ngtech.co.il>
	<CAMD-=VKHbG8dXDtrUJAsZMG3ipHOBED6u=dCQUwifc8bQo8CQA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=fePFlh51rtAKjiIoiFm0RUOJxilnNFf+NIIZ0GguUMg=;
        b=1DP1ZgFEZb8+3S3CirgG8tHLjecBGhTYO/r41nZzwq9Kj+OdoJ9RzZAa9y9crj7u87
         9NfinqoYNUwWRyRM1IrMlotEWiwnaqhjuZfifhZgEoOhGkt4QHkdKXavLhtWesPNxEYS
         nUsCFGo+25td5De3OLLJ+Yrj6+XyZPSOxlXZfsYG5GtcLpf+XnCiB4UCKU7l/JUtKhzC
         B3jJ6zmy65+tEHGMUxRLl2fAVndIYOGPGbU+iqsUsp61MCbtg7yD9P7n2QHw6LJZoIT1
         1zVHFe/bhMFSrwWEaTeowQhL7Je5sS3QiDMqGExokO8QkZLxYYVEpHzoiKIpVxt1qoit
         MJ5A==
In-Reply-To: <CAMD-=VKHbG8dXDtrUJAsZMG3ipHOBED6u=dCQUwifc8bQo8CQA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter user mailing list <netfilter@vger.kernel.org>

Thanks to a very helpful member of this list, off-list (so not sure if
he wants to be named and famed), the problem has been resolved, by
allowing INPUT for neigh discovery packets type 135 and 136

I have quickly learned that the ipv4 habits of yesteryear must go out
the window for ipv6 to work.
