From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 17:07:02 +0200
Message-ID: <508D4A16.5020509@ngtech.co.il>
References: <5088717B.6080300@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5088717B.6080300@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org, ntop-dev@unipi.it, "G. Elian Gidoni" <geg@gnu.org>

On 10/25/2012 12:53 AM, Ed W wrote:
> The practical upshot is that you can do stuff like:
>
>      iptables -I FORWARD -m opendpi --WinUpdate -j LOG
> or
>      iptables -I FORWARD -m opendpi --skype -j REJECT
>
> In theory you can also filter Facebook, Twitter, etc, but I concede that
> doesn't seem to work as expected right now...
>
> Another of the clever things that nDPI does is to try and classify SSL
> traffic by examining the name on the cert.  A technique that seems
> likely to allow crude identification of significant traffic.
>
>
> We could benefit from more eyes on this, both the netfilter module and
> the nDPI library
>
> Thanks for your feedback
>
> Ed W
I tried the new version which is suppose to work with:
iptables -m ndpi --help
but it seems like there is an error:
iptables v1.4.12.1: Couldn't load match `ndpi':No such file or directory

but work with opendpi.
I am using kernel 3.3.8 64 bit.

did you tested the new changes to work?
for now I cant restart the server and I was hoping to test it without 
doing it.

Thanks,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
