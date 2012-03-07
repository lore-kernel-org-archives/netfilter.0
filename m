From: "cmlitguy@gmail.com" <cmlitguy@gmail.com>
Subject: Re: Make a redirect if NAT out interface is down
Date: Wed, 07 Mar 2012 18:19:21 +0200
Message-ID: <4F578A89.4070402@gmail.com>
References: <4F515C9B.3030209@gmail.com> <1330891448.30413.347.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=3pW/iOlAQMr558GZXp5+pDrjkfow+uSZJQTDFWQHs9w=;
        b=NOD/YWGhQSZBNfh5pbBBSAE/6aaerC/z3MuXBeKvdmLVQQb4CVqLAtQrSB1DDwwCr1
         AP0fZHuq2hhNooUvLeMZeeeZUZgS62GAY+IuUyTfxR+eTxg7/i+gpqW1RcfwVRwTuMV/
         WM3B+P4DBzo74FW0D1sjuNBdertj7AoJYFG/fMDyVX8EtSGlq3T1QavorxuraK8gxmcS
         ZSIlYwbG7EFl/leSCFdKA17ZwfqIcUgjDGnESuS1lXoJvdWWX8RosBJnaH18nsYD9T/j
         1yP5P0udeuu5Ar9hC6pTzVvknpWaQtizFIIzjWCJS2CB9m5YzKkq8oyo9mjFMwjJ+wYU
         LuaQ==
In-Reply-To: <1330891448.30413.347.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Hello Andrew Beverley,
Thank you for reply.
I tried this in CentOS:

vi /sbin/ifup-local

echo  if  is  now  up  >/tmp/log.txt

I tried this in CentOS:

But it doesn't work with vpnc and tun0 interface.
I used netplugd to monitor up/down events and generate appropriate rules in iptables.






On 3/4/2012 10:04 PM, Andrew Beverley wrote:
> On Sat, 2012-03-03 at 01:49 +0200, cmlitguy@gmail.com wrote:
>> Hello,
>> I have a question about possibility of making a redirect if  NAT out
>> interface tun0 is down.
>> This is iptables rule for Masquerading our network via VPN connection.
>>
>> iptables  --table  nat  --append  POSTROUTING  --out-interface  tun0  -j  MASQUERADE  -m  comment  --comment  "Masquerading"
>>
>> When VPN goes down, we can't access some resources and we need to verify
>> its status and establish it again.
>> Is it possible to make a redirect of all traffic to another host - Web
>> Site(via IP address) of tun0 is down ?
> If the interface actually does "down", then I would use your operating
> system's networking scripts to run a "down" script. E.g. for Debian
> use /etc/network/interfaces
>
> If it just stops responding, then I'd consider LSM[1] to monitor it and
> do something similar.
>
> [1] http://lsm.foobar.fi/
>
>

