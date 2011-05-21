From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 20:42:05 +0100
Message-ID: <4DD8158D.4040306@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Ej4Ywf3bqCcec0+q0QNEjbAlKIzH3cKml3s906yCYfA=;
        b=chqvkkW9n1089jtYnIYwrpX8ME7s8eDWNVt4RNdEFd1JToK4W0w/0fjNtok8uj1O2y
         j5oL4x63h3/RbdsMBJgporIlPdaRnVakjd8fhO2fx4E9TIr4yGuHKFyP4KdIeoFianyp
         J6hW+TVgy/cCF3WXiI3rxwkovdN/H+peuSZIk=
In-Reply-To: <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> Yes, it was fixed, the last one ("Fix adding ranges to hash types") covers 
> that.
>   
I disagree! I am still experiencing the same problems I've had with 
ipset 6.4, despite those being "fixed". When I try to load a set 
containing about 15k elements I get variations on the same type of error 
below:

ipset v6.5: Error in line 3556: Element cannot be added to the set: it's 
already added
ipset v6.5: Error in line 3653: Element cannot be added to the set: it's 
already added
ipset v6.5: Error in line 3340: Element cannot be added to the set: it's 
already added
ipset v6.5: Error in line 3266: Element cannot be added to the set: it's 
already added
ipset v6.5: Error in line 3653: Element cannot be added to the set: it's 
already added
ipset v6.5: Error in line 11187: Hash is full, cannot add more elements
ipset v6.5: Error in line 11182: Hash is full, cannot add more elements
ipset v6.5: Error in line 11185: Hash is full, cannot add more elements
ipset v6.5: Error in line 11186: Hash is full, cannot add more elements

The above happens when I try to use restore with the same file (i.e. the 
file contents does *not* change). On top of it all I also started 
getting this:

May 21 19:47:49 dmz1 kernel: [ 2103.322341] ipset[2827]: segfault at 0 
ip 004f6655 sp bf9125f0 error 4 in libmnl.so.0.0.1[4f4000+4000]
May 21 19:39:03 dmz1 kernel: [ 1576.402070] ipset[2777]: segfault at 0 
ip 006ea655 sp bfcfd900 error 4 in libmnl.so.0.0.1[6e8000+4000]
May 21 19:47:49 dmz1 kernel: [ 2103.322341] ipset[2827]: segfault at 0 
ip 004f6655 sp bf9125f0 error 4 in libmnl.so.0.0.1[4f4000+4000]
May 21 19:57:32 dmz1 kernel: [ 2685.725299] ipset[2870]: segfault at 0 
ip 00339655 sp bf8bac90 error 4 in libmnl.so.0.0.1[337000+4000]
May 21 20:01:48 dmz1 kernel: [ 2942.232408] ipset[2913]: segfault at 0 
ip 00baa655 sp bfa25d80 error 4 in libmnl.so.0.0.1[ba8000+4000]
May 21 20:09:18 dmz1 kernel: [ 3392.073377] ipset[2928]: segfault at 0 
ip 00470655 sp bfcb43c0 error 4 in libmnl.so.0.0.1[46e000+4000]
May 21 20:10:57 dmz1 kernel: [ 3490.388755] ipset[2941]: segfault at 0 
ip 00b8a655 sp bffb92c0 error 4 in libmnl.so.0.0.1[b88000+4000]
May 21 20:12:36 dmz1 kernel: [ 3589.622479] ipset[2954]: segfault at 0 
ip 009bf655 sp bf8fef80 error 4 in libmnl.so.0.0.1[9bd000+4000]
May 21 20:13:21 dmz1 kernel: [ 3634.433419] ipset[2966]: segfault at 0 
ip 00d11655 sp bf9ae7a0 error 4 in libmnl.so.0.0.1[d0f000+4000]
May 21 20:13:28 dmz1 kernel: [ 3641.484628] ipset[2977]: segfault at 0 
ip 005e7655 sp bfedb090 error 4 in libmnl.so.0.0.1[5e5000+4000]
May 21 20:13:42 dmz1 kernel: [ 3656.205294] ipset[2988]: segfault at 0 
ip 009cb655 sp bfae5b80 error 4 in libmnl.so.0.0.1[9c9000+4000]
May 21 20:15:31 dmz1 kernel: [ 3765.137306] ipset[3001]: segfault at 0 
ip 0019e655 sp bfe3fff0 error 4 in libmnl.so.0.0.1[19c000+4000]

libmnl is 1.0.1. I have then tried to play a bit with the hashsize 
value, but gave up when I reached 16777216! ipset though was still 
insisting that the hash size is "full":

maxelem 15000 hashsize 4194304
ipset v6.5: Error in line 11191: Hash is full, cannot add more elements
maxelem 15000 hashsize 8388608
ipset v6.5: Error in line 11191: Hash is full, cannot add more elements
maxelem 15000 hashsize 16777216
ipset v6.5: Error in line 11191: Hash is full, cannot add more elements

-bash-4.1# ipset -L -terse test
Name: test
Type: hash:net
Header: family inet hashsize 16777216 maxelem 15000 timeout 0
Size in memory: 134937948
References: 0

So, 134MB of RAM is not enough for a set consisting of 15k members? 
Right! I am reverting to 4.5 again as this is crazy!
