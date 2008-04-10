From: Martijn Lievaart <m@rtij.nl>
Subject: Re: FTP connection without NAT
Date: Thu, 10 Apr 2008 23:39:42 +0200
Message-ID: <47FE891E.3030400@rtij.nl>
References: <008801c89aa8$8e306a60$8119fea9@MingChing> <alpine.LNX.1.10.0804100744410.8765@fbirervta.pbzchgretzou.qr> <017001c89af3$d5e934e0$8119fea9@MingChing>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <017001c89af3$d5e934e0$8119fea9@MingChing>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@vger.kernel.org

Ming-Ching Tiew wrote:
> Jan Engelhardt wrote:
>   
>> On Thursday 2008-04-10 03:16, Ming-Ching Tiew wrote:
>>     
>>> 1. FORWARD rule policy is DROP.
>>> 2. Inside can ACCEPT NEW connection to go to outside.
>>> 3. ACCEPT established or related connections.
>>> 4. FORWARD tcp port 21 from outside to the
>>>    inside FTP server is ACCEPT.
>>>
>>> Will the connection tracking modules help in allowing
>>> passive FTP session to get through to the FTP server ?
>>>       
>> Make sure nf_conntrack_ftp is loaded so that RELATED can do its job.
>>     
>
> Is it necessary to specify the ftp port if it is not port 21 ?
>   

Sadly, yes.

M4

