From: carlopmart <carlopmart@gmail.com>
Subject: Re: Using source nat to discriminate traffic
Date: Tue, 26 Apr 2011 14:42:43 +0200
Message-ID: <4DB6BDC3.1070306@gmail.com>
References: <4DB68B40.2030806@gmail.com> <4DB6B471.7000805@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=tI6UZjffbTebv7ANC1d/ZUZBXW7UB9oFl+yG1OBsuw0=;
        b=utihwZ1z6wIKymlkgXudOZ5+cduMvP9YpWmLoHo5huZN83hDclHzjTLkEteku69+X2
         7n9iyLuKUFPpoK7mWcHe4SgamXIhrqC7HfF+NILvMzcIsHZtoJwx/A0S6ucUWgkxtcJ0
         nLhGMAcU/3uME2wdKv0CUrj9UCfmhxkCPzkPw=
In-Reply-To: <4DB6B471.7000805@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/26/2011 02:02 PM, Vigneswaran R wrote:
> On 04/26/2011 02:37 PM, carlopmart wrote:
>> - BBDD_1 can only be accessed by ip address 172.21.2.2.
>> - BBDD_2 can only be accessed by ip address 172.21.2.3
>>
>> Both ip address, 172.21.2.2 and 172.21.2.3, are assigned to the first
>> host that acts as a mysql client. Latest release of mysql client
>
> IMHO, if both the IPs are bound to the same host in a permanent basis,
> it would be better (request the admin) to change the ACLs so that both
> the databases (BBDD_1 and BBDD_2) are allowed from the same IP (either
> 172.21.2.2 or 172.21.2.3). Then as you know, your iptables rule will
> work for both databases.
>
>
> Regards,
> Vignesh
> --

Thanks Vignesh. Yes, your solution is perfectly and correct. But exists 
a problem: this hosts is included on a cluster (RHCS) with three nodes 
(in three weeks, will be six nodes). Service can run on a hostA, hostB 
or hostC ...


-- 
CL Martinez
carlopmart {at} gmail {d0t} com
