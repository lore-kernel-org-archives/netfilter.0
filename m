From: Daniel Huhardeaux <tech@tootai.net>
Subject: Re: nftables v0.9.0 netlink: Error: set is not a map
Date: Tue, 22 Oct 2019 10:31:42 +0200
Message-ID: <ef1f35ef-44ac-43d8-2a1a-233293b89e7e@tootai.net>
References: <37d8e802-87c2-4ef6-d0da-173bbd2ded60@tootai.net>
 <87sgnld3kt.fsf@goll.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1571733103; bh=tGlTHGs8j148Lflabrhn5juMoUpGZPek5xchylCD1oo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=Ltwro5vImJ1x49K4VjLq+2EHxtzs7vQm/Knu15XD/iLRLZnvZmNID97DmfK5xPyvG
         615wp85Am5Z9jQ3tya3wq8r10H08vP7zlbn5SDq8loQEBCFY04fDnblBvv5LRqc9og
         vfWI4jghO8Oyz7/t3d4T3ypizRSuHnMYwKoiTQpo=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1571733102; bh=tGlTHGs8j148Lflabrhn5juMoUpGZPek5xchylCD1oo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=Rkysn1q0qo9ralCPSl2CS4cLmas2xqX1N8zSNJ2LT3TII798PGFMGWRKyeLvjmPyx
         tCkb0UQthOIZ6NBBlzCLtN09Px+b1MP8kgMZNs22k7FHIUGJ6ef9j9HU1KQRXu9cVs
         4T64ke/bFvnENjvHJvexf53I8bKeCguNDipkZWbw=
In-Reply-To: <87sgnld3kt.fsf@goll.lan>
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Le 22/10/2019 à 02:30, Trent W. Buck a écrit :
> Daniel Huhardeaux <tech@tootai.net> writes:
> 
>> I created a bash script under Debian/Buster to create nft rules: it
>> works perfectly.
>>
>> Now I copy this script to a Debian/Stretch machine (nftables v0.7.0)
>> and get in troubles to make it work: at some point I receive the
>> subject error.
>>
>> OK, I think it's a version problem: I installed nftables from Stretch
>> backports which is the same version as the Buster one, v0.9.0 But
>> bang, error is still here :(
>>
>> What can be the cause of this error? Yes, I use sets, and no, they are
>> no maps defined.
> 
> Can you show us your actual ruleset.nft?
> 
> Or (better yet) distill it down to a minimal test ruleset.nft that
> generates the problem, and show us that >
> I don't recognize the specific error.
> I have seen similar errors before due to brainos in my ruleset.
> 
> I agree it doesn't make sense that the same version (nftables=0.9.0 on
> Debian 9 and Debian 10) should parse the same way - so maybe it's a
> difference on the kernel side?
> 
> Are you running
> 4.19.67-2+deb10u1~bpo9+1 on Debian 9, and
> 4.19.67-2 on Debian 10?

Debian9 Debian 4.9.189-3+deb9u1
Debian10 Debian 4.19.67-2+deb10u1

I found the culpit: myself. I copy values from iptables rules where 
range are given separated by colon and I forgot to replace this one by a 
dash :(

Thanks for your support
-- 
Daniel
