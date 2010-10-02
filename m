From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 02 Oct 2010 21:08:19 +0100
Message-ID: <4CA79133.3070608@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=vj+k7xfPz+ZCivbYm5WK2yJbu0LSWlZRh9akKzqRFEw=;
        b=r1eK8WqdULYAN5tLAU0vw3KId40M8r5YPR7QqFeHL7c6uIyGaC4GikhbHw14j0T6EM
         nMOA/8XA9J5kNcrZWSgr1llTdnH4tN3ZIE+dTjRLP98qfgHvphAlq00fjrQv59CzyQF7
         C0HaAcV1MBKkY3qIbOc9qM0xKfpluVSyb3zSE=
In-Reply-To: <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>> As for ipportiphash and ipportnethash - there were recently included in 
>> the distribution due to another bug I found when compiling xtables (even 
>> though ipportiphash and ipportnethash were compiled the .ko files were 
>> never included in the final release making it impossible to use these 
>> two construct types).
>>
>> A couple of questions and ideas for future releases:
>>
>> 1. Normally I used to get ipset as part of the xtables source. Is that still
>> the case or do I have to download the ipset source and compile it separately
>> to get the latest changes you made?
>>     
>
> It's absolutely up to you: currently ipset can be installed alone, or as a 
> part of xtables-addons. Jan updates xtables-addons quite reqularly.
>   
I just taken the latest git from xtables-addons and it is not there.

>> 2. Related to that question - I used to get the xtables .src.rpm from which to
>> compile the code and make an installation rpm. I don't seem to be able to do
>> that any longer as all fedora repos are too slow to update the latest changes.
>> Do you have a link from which I could get the latest changes in ipset/xtables
>> in src.rpm which allows me to build an installation rpm. The reason I am
>> asking this is because I am building an update images on all my machines
>> (using kickstart) and need the installation rpms with the latest changes you
>> made. Compiling this from source won't be possible as there is now way I could
>> install this as part of the image-building process.
>>     
>
> No, I'm not aware of the source rpm for ipset. That's bad if there's one
> out there without refreshed. 
>   
This is a major headache for me for 2 reasons:

1. I use 'rpmbuild' to compile from source as it allows me to build rpms 
for different architectures (I compile on x86_64 for i686 with 'rpmbuild 
--target=xxx'). If I use 'ordinary' make there is no way (at least I 
don't know of any) I could compile for different architecture.

2. rpmbuild also allow me to pack the necessary binaries (executables & 
modules/.ko files) for the target architecture to be transferred to the 
target machine - conveniently in rpm which could be installed (together 
with the necessary dependencies) as part of the target image building 
process.

Even if I solve problem No 2 (i.e. by tar-ing the necessary modules and 
executables) I can't see a way to get past compiling for a different 
architecture (and resolve all the dependencies)! Any ideas?

On a side note, I just managed to built v4.4. in the last hour or so for 
x86_64 (haven't tested it yet) and had to readjust the prefix & lib 
directories in the Makefile (I use prefix=/ and libdir=/lib64) and 
installed the new version, but I can't do anything for my other machines 
(which are mostly i686-based and their image is built using kickstart).


>> Would it be possible to include a new construct - IP,port,IP,port (without IP
>> address restriction) - and how difficult is this to implement?
>>     
>
> It's not difficult, but I see little value in such a type. The client 
> source port (except for a few protocols in some cases) is random, so how 
> could it be useful to mach for that? Or do you know a case where it can 
> still be useful?
>   
I can give you of at least 2 uses based on my experience:

1. voip - normally I can restrict the range of source ports and ip 
address when a voip connection is initialed (usually ports 8000-8050 and 
I have to also define the right ip address to point to the outside 
network), but the only way I can do this at present is if I base this on 
UID in iptables (i.e. the id of the process this is run under) - I 
cannot use sets at all because I do not have the appropriate construct. 
If I had "IP,port,IP,port (and protocol!)" as a construct to work with I 
can just built the sets (as I use 4-5 different servers outside the 
network and they work on different ports too) and that would be it!

2. VPN - for the same reason: to increase security I normally bind the 
source port to a particular range and then if I had a "IP,port,IP,port 
(and protocol!)" construct to work with I will not be using UID in 
iptables to match, but will use this construct directly without any 
further need to do anything!

>> Similar question - would it be possible to include protocol (either by name or
>> its number) as part of all available constructs for matching? The reason for
>> this is that, as it stands, in order for me to match, say, "IP,port" hosts
>> form my personal VPN I need to use two separate sets - one for UDP and one for
>> TCP and I also to create two separate statements for iptables (one for tcp and
>> one for udp), which is a bit of a waste and not very easy to administer. It
>> would be nice if I could use "IP,protocol", "port,protocol",
>> "IP,port,protocol", "IP,port,IP,protocol", "IP,port,IP/cidr,protocol" and so
>> forth.
>>     
>
> The next branch includes exactly that, i.e. the possibility to specify 
> proto:port for the ipport, ipportip and ipportnet types. And IPv6 support 
> too.
>   
That's brilliant news! I take it you will be introducing protocol 
support for all the constructs, is that right? How long would it take 
before you release this?

