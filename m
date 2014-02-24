From: Scott Mayo <scotgmayo@gmail.com>
Subject: Re: Public IP to Private IP
Date: Mon, 24 Feb 2014 13:13:37 -0600
Message-ID: <CAFPGR9hjWxAUxkP_EerkWr5NiWRZpWZa7=8UfNfaDbYRBgBASg@mail.gmail.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
	<CAFPGR9jQFUyQhjyH-kBdDj7cJvNrub5uFaGmStXRtWRfO6NFWQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=1guv3T7VQ4gQd4LGUcQDQSJj9EZYF/fTz3tVmNfhFPE=;
        b=k+oXDwKMJPwQ0rjCyd1ce77Lb7Sriy6z0YRBBYae74tzTYKHvRr2BSl4ANh2+1HhyA
         yxF9KDyt9h+kobN3GppudZUEL+qD0NoYLR+DQd/q69V5yWP1L4U0lty7/2Hd6s+lOVeF
         PNPrYufXsPTuCCAj+saEOkVJQ1j8612Wxvx594i7xVecrBtJogHcO3sCE+KxrLZEwsX1
         dE9jJVOmxGf1FgXliW7L1I0SItPPfV0jUPT/TDBuRZ0fjw/hGjd8atFJ0K5gIcIE66gk
         6TxQDkQZ0n62RvNmd8Tj2LnIGFg7gtCVzsNqxqhyo9Nl4NgktJJTlqcqIKsUmo/wq4k6
         yBXg==
In-Reply-To: <CAFPGR9jQFUyQhjyH-kBdDj7cJvNrub5uFaGmStXRtWRfO6NFWQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Feb 24, 2014 at 12:22 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
> On Mon, Jan 27, 2014 at 1:22 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
>> I am having some troubles getting my public IPs routed to my private IPs.
>>
>> Here is an example.
>> Private IP of the main server with my IPTables:  192.168.0.1
>> Public IP of the main server:  1.1.1.1
>> I also have 1.1.1.2 and 1.1.1.3 as public IPs attached to the public nic.
>> Domain name example.org is pointed to 1.1.1.2
>>
>> I am trying to get the following public IPs to Private IPs:
>> 1.1.1.2 -> 192.168.0.2
>> 1.1.1.3 -> 192.168.0.3
>>
>> If I am outside my network and go to example.org, it seems to work fine.
>> If I am inside my network and go to 192.168.0.2 then it works fine.
>> If I go to example.org from inside my network then it goes back to
>> 192.168.0.1 instead of 192.168.0.2
>>
>> Maybe this does not have to do with IPTables even since it works with
>> an IP, but I thought I would ask here.  I do not have an internal DNS
>> server.
>>
>> Here are the rules that I have:
>>
>> IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
>> --to-destination 192.168.0.2
>> IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -j SNAT --to-destination 1.1.1.2
>>
>> Any suggestions would be appreciated.
>> Thanks.
>
>
> I ended up finishing my setup on my new filter server.  I had not
> messed with this problem and wanted to wait until I got it into place.
>  I am back to it now.  I appreciate the suggestions so far.  I am
> getting ready to setup an internal DNS server, but until I do, I would
> like to get the IPTABLES working.
>
> Here are the IPTABLE rules that I have in place:
>
> $IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
> --to-destination 192.168.0.2
> $IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -s 192.168.0.0/16 -j
> SNAT --to-source 1.1.1.2
> $IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 1.1.1.1
>
> Here is quick breakdown
> ifcfg-eth0 = 1.1.1.1  #public IP of the main Squid/IPTABLES box
> ifcfg-eth0:0 = 1.1.1.2   #Virtual IP which I want to forward on to the
> other webserver box: example.org
> example.org resolves to 1.1.1.2 fine
> ifcfg-eth1 = 192.168.1.1  #private IP of the main Squid/IPTABLES box
> 192.168.1.2  #Is the private IP that I want forward on to the other
> webserver box: example.org
>
> My IPTABLES are on my Squid box.  I have just played some more and
> found that if I take the proxy settings out of my browser and type in
> example.org in the URL, it works fine.
>
> If I leave the proxy settings in and type in example.org then it comes
> back to the main Squid box address of 192.168.1.1.
>
> Any idea why that would matter?  I do drop port 80 and port 3128 so
> that the proxy cannot be gone around.  For testing purposes though, I
> took those two drops out and it is still doing it.
>
> I'll get a copy of my IPTABLE rules and post also.  Just thought I
> would post this first and see if someone had an idea of what I might
> be looking for.


It just dawned on me that this may be pulling from the Squid cache so
I'll wait until after school and clear that.  Maybe my IP rules are
correct now since it is working without going through the proxy.

Thanks.

-- 
Scott Mayo
Mayo's Pioneer Seeds
