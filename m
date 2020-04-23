From: zrm <zrm@trustiosity.com>
Subject: Re: has somebody an idea what fills up the log (5050/udp)?
Date: Thu, 23 Apr 2020 01:23:27 -0400
Message-ID: <fcf7ebcd-fd46-6279-8ad8-ab86ae0722de@trustiosity.com>
References: <d57c8f54-e0c0-1545-6f4c-a5c3ec78763c@mathemainzel.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1587619408; bh=BjZeZw8mr7N0JI4k/8ebOzL5rF2rxMzfQrYCjs2XdvI=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=ijd/K2goyagPu2frAGc0h7cn1KNY9gGiJQ3he9coWMqd7TST861c0y0F2/m/eib6A
         Z2sL/ZG3KBGSwWocPe5J3gvajKQGCneCMNp+cLzPRx6W2HLMAOYJCN5iFOj4DOnasl
         xaVk1qAfgOmnsKMQdCoVIQjNB+dD6qhPsnpvP7KM=
In-Reply-To: <d57c8f54-e0c0-1545-6f4c-a5c3ec78763c@mathemainzel.info>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Walter H." <Walter.H@mathemainzel.info>, netfilter@vger.kernel.org

On 4/23/20 00:56, Walter H. wrote:
> Hello
> 
> my Win10 box fills up the log of my router (Linux box)
> 
> [23-Apr-2020; 05:44:11.861029] IP[IN]: IN=br0 OUT= 
> MAC=ff:ff:ff:ff:ff:ff:a8:5e:11:3d:8f:77:08:00 SRC=192.168.1.10 
> DST=192.168.1.255 LEN=71 TOS=0x00 PREC=0x00 TTL=128 ID=51279 PROTO=UDP 
> SPT=5050 DPT=5050 LEN=51
> [23-Apr-2020; 05:44:16.864767] IP[IN]: IN=br0 OUT= 
> MAC=ff:ff:ff:ff:ff:ff:a8:5e:11:3d:8f:77:08:00 SRC=192.168.1.10 
> DST=192.168.1.255 LEN=71 TOS=0x00 PREC=0x00 TTL=128 ID=51280 PROTO=UDP 
> SPT=5050 DPT=5050 LEN=51
> 
> these are 2 entries, nearly every 5 second one entry (source port and 
> destination port always 5050/udp);
> what might causing these - I guess broadcast?
> 
> Thanks,
> Walter
> 
> 
> 

192.168.1.255 would be a broadcast address assuming your network is 
192.168.1.0/24. There isn't really any way to tell what application is 
sending them based on what you've provided other than to do a search for 
applications that send broadcasts using port 5050.

What you might want to do is look at the client machine and see which 
application is bound to that port, but that's more of a Windows question 
than a netfilter question.
