From: "Pranav Desai" <pranavadesai@gmail.com>
Subject: Re: Some weird issue with return traffic with redirect rule
Date: Fri, 17 Oct 2008 12:46:38 -0700
Message-ID: <cc64e8ce0810171246j131d3651rea38e4efee507608@mail.gmail.com>
References: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>
	 <48F8C91E.5010608@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=r22zPW7v2rbXb8AHOcKMO4LKL+bWitS1kWO46F1G3w8=;
        b=rCfilhDnjNUw8KDthdn56Tk0FKKXgerTaspL24W0p+UwsdBtoffIyYtVgi6ZHRGw/6
         +nPapR0+W6hG8ZXZxFrERy9J2l1BLssxeqcyR7qQiOOsBSXqh+cwY9D7AragkGjulHsn
         vaKrW4svIsuREj2oMX9R7gNWOQGdSak6m75VU=
In-Reply-To: <48F8C91E.5010608@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Fri, Oct 17, 2008 at 10:19 AM, Grant Taylor
<gtaylor@riverviewtech.net> wrote:
> On 10/17/08 01:30, Pranav Desai wrote:
>>
>> We are seeing cases where the return traffic is going out using the
>> proxyIP and port 8001, instead of using the origin servers IP and port 80. I
>> have added the traces for both cases below. Most of the traffic goes out
>> correctly using the origin server IP and port, but the traffic using port
>> 8001 is not insignificant, hence we are a bit concerned about it.
>
> *nod*
>
>> There are no connections coming in to port 8001.
>
> Ok...
>
> I have to ask, is there a reason you are not configuring clients to talk
> directly to the proxy?  In my experience this works a lot better than
> transparent proxying.  I tend to use direct proxying as the primary method
> and then transparent proxying as a backup and to catch devices that don't
> know how to talk to a proxy.
>

Too many clients will have to change their settings. Not feasible in our case.

>> I am not sure what could be causing this behavior or how I should go about
>> debugging this. Could the conntrack table or its usage be screwed up?
>
> Are there any DMESG or syslog entries about the connection table being full?
>

There is no info there, and the tables are not getting full. Here are
the conntrack settings.

net.ipv4.ip_conntrack_max = 1048576
net.ipv4.netfilter.ip_conntrack_buckets = 1048576
net.ipv4.netfilter.ip_conntrack_count = 63908
net.ipv4.netfilter.ip_conntrack_max = 1048576

-- Pranav

>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
