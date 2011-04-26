From: carlopmart <carlopmart@gmail.com>
Subject: Re: Using source nat to discriminate traffic
Date: Tue, 26 Apr 2011 11:45:44 +0200
Message-ID: <4DB69448.6080009@gmail.com>
References: <4DB68B40.2030806@gmail.com> <alpine.LNX.2.01.1104261115080.20267@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ATPdm3UMZNOykPIQveGNoxPUbM+CmvC200WD2oVblhc=;
        b=Ftlp0CyaSFaIbcAEz9bmL3YbU+HPoyPs6a1mUziILZAmCzBlLjU7U8IbFQW58CQyak
         kS/nC2BCJVMhqwUSm/CgZQ0OZK5bIuBfnPc9T3h9dZWIU3ulSj+Y7/G1dxmNMP5vD8yK
         x7fAbNXNiD0kyb6je79Y4VDRcWOa0tEmoIcDU=
In-Reply-To: <alpine.LNX.2.01.1104261115080.20267@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/26/2011 11:15 AM, Jan Engelhardt wrote:
> On Tuesday 2011-04-26 11:07, carlopmart wrote:
>
>> Hi all,
>>
>> I have a problem using source nat rules to discriminate traffic on one host.
>> This host has several ip aliases assigned to provide several services. Problem
>> starts with mysql client. This host needs to access to another host that acts
>> as MySQL server. This MySQL server has some acls configured to access
>> databases, in this manner:
>>
>> - BBDD_1 can only be accessed by ip address 172.21.2.2.
>> - BBDD_2 can only be accessed by ip address 172.21.2.3
>>
>> Both ip address, 172.21.2.2 and 172.21.2.3, are assigned to the first host
>> that acts as a mysql client. Latest release of mysql client contains an option
>> to pass --bind-ip-address, but my mysql client version not (and I can't do an
>> upgrade due to a tecnical specifications).
>>
>> Then, I need to discrimanate traffic on mysql host client when it tries to
>> access to mysql server. I have found a partial solution putting this iptables
>> rule:
>>
>> iptables -t nat -A POSTROUTING -o eth1 -d 172.17.3.3 -p tcp --dport 3306 -j
>> SNAT --to-source 172.21.2.2
>>
>> This rule works ok when mysql client tries to access to BBDD_1
>
> Assuming BBDD_1 is 172.17.3.2, this rule won't be considered at all. Of
> course stuff works because some address is the client's default.

MySQL host ip address is 172.17.3.3, always, to all BBDD.

-- 
CL Martinez
carlopmart {at} gmail {d0t} com
