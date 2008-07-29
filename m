From: Brian Mearns <mearns.b@gmail.com>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Tue, 29 Jul 2008 06:25:54 -0400
Message-ID: <488EF032.5020000@gmail.com>
References: <488A7D17.4070506@gmail.com> <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :organization:user-agent:mime-version:to:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=txwnasL/Gwqg30mQW2hBHdUqesdNnPBhbBhpzkZ0l7s=;
        b=GMckoN8S/vz8aOih92i6Dhfwi06WMclz6WUU3Tz5d4eEL4pK9ZIz/WPJrR/DyL4rS8
         /lJoreymwhfu8831pZ/nldkG7wm6NmFqIwbluZJYtlaUIlEejtYWp5ir05vajTk99elK
         T6saOgd6k7fVJXsOAt/8PRuykIHkWJRcyfJe0=
In-Reply-To: <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Schulman <andrex@alumni.utexas.net>
Cc: netfilter@vger.kernel.org

Thanks a lot for the help, Andrew. The iptables source I have doesn't 
have a configure script...oh, but it does have an autogen script. I 
guess I was probably supposed to use that first. But it's a moot point, 
apparently, because of xtables, so I will be switching to that.

Thanks,
-Brian

Andrew Schulman wrote:
>> The latest version of POM seems to be from 2004, and I saw some 
>> references in the mailing list archive seeming to indicate that is' 
>> being deprecated, but is there anything to replace it?
> 
> For POM-ng, if you look in the snapshot directory of the FTP server, you'll find
> daily versions up to yesterday.  However, I recently tried to use on of those to
> install the condition patch, and it failed for reasons that I wasn't able to
> figure out in 30 mins. or so of research.
> 
> POM has now been superseded by xtables-addons
> (http://jengelh.medozas.de/projects/xtables/).  Unfortunately the netfilter site
> hasn't been updated yet to reflect this.  Discussion threads on that in this
> forum within the last week:
> 
>   POM Xtables???
>   patch-0-matic problems..?
> 
> At first I was annoyed at yet another big change in netfilter patching, but
> xtables-addons is better because it doesn't require you to patch either your
> kernel or iptables.
> 
>> I'd really like to patch in TARPITs, but the latest POM does not work 
>> with the latest iptable src ("doesn't look like a iptables source code 
>> directory to me.")
> 
> You have to run ./configure in your iptables source dir first.  Not sure if that
> used to be the case-- I think it wasn't.
> 
> That gets to wny I always used to hate using POM.  It was unique and volatile--
> about once a year someone would change something and my script would break and
> I'd have to go back and figure it all out again.  Good riddance, I say.
> 
> Good luck,
> Andrew.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
