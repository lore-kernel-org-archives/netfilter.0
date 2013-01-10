From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Thu, 10 Jan 2013 22:15:54 +0100
Message-ID: <50EF2F8A.7040804@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu> <50ED13BC.6010005@airpost.net> <20130109115232.GA19321@1984> <50EEB9DC.7070902@airpost.net> <alpine.DEB.2.00.1301101605260.11492@blackhole.kfki.hu>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050002060507030501010307"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type; s=mesmtp; bh=1XdHFMF0iwqZf
	nZpe9n9udqcFLc=; b=XGv7skv096Fiajzi7ghhvDu5DDaTerzDF4ysZheoff8s/
	9fW8YfC4bBkXZResvNmWLboc4oWpHXDp5JIQSCaCmvYp8kIjEayqsltljiYvaksQ
	HvXZcWitUMYf2yk2HMo5J3iNuC8OisUXsG9b9OV+Kl5WxWf1vznsaR3adG9KXI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type;
	 s=smtpout; bh=1XdHFMF0iwqZfnZpe9n9udqcFLc=; b=tgbGzle3Vun8MhFy7
	62c2pr8ZeL1uPtI8MhYb9A2SMu1JY7mZwxwC5fi8EgnbC2QMJuuWnStMoHY0LLK0
	yw4+JEQmfV928ro4elx/dXVV4DTMcaskVtYpfMeD9owkQTrNNGXls9Ec7kid3dOT
	XNNmLGk6ZTHbPKMHRGBNgUHhyA=
In-Reply-To: <alpine.DEB.2.00.1301101605260.11492@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jan Engelhardt <jengelh@inai.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050002060507030501010307
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10.01.2013 16:19, Jozsef Kadlecsik wrote:
> On Thu, 10 Jan 2013, Born Without wrote:
>
>> On 09.01.2013 12:52, Pablo Neira Ayuso wrote:
>> [...]
>>
>>> Suggestion: Some explicit header with licensing terms of your script
>>> is a good idea if you want to share things, otherwise the law in most
>>> countries defaults to "all right reserved".

[...]
>> Don't know much about them.
>> But I guess GPL 3 will do?
>
> GPL 2 or 3 will do, whichever you prefer.
>
>> Also for Jozsef, if he would consider adding it to contrib?
>
> Yes, of course.
>
>> One thing still is missing, to make it more foolproof, there's no checking for
>> supported ipset versions (i.e v2.x) in the script.
>> I only have 6.16.1 installed.
>> I don't know if the -v|--version option is persistent through ipset versions.
>
> Yes, assuming the 6.x branch. But 4.x is not developed anymore and 5.x was
> a very short lived branch. Please assume 6.x or above in your script.
>
> In the ipset version string the first number always corresponds to the
> protocol version. The second number indicates the release number and
> sometimes there's a third number when a quick release with a very minor
> change is required.
>
>> I don't know if the format of the version output is persistent through ipset
>> versions.
>
> It may change partially, from this
>
> ipset v6.14, protocol version: 6
>
> to
>
> ipset v7.Y, protocol versions: 6-7
>
>> I don't know from what version the \`list' action is valid (before it was -L i
>> think?).
>
> Starting from 6.0 both syntax is valid.
>
>> I don't know if the plain listing output (header - members) is persistent
>> through ipset versions.
>
> Yes, with the conditions I wrote previously, i.e. which prepares the
> script to accept new header lines inserted before Members or new values
> appended.

Thank you Jozsef for that information.

I chose GPL v3...
For version checking I just extract the first digit after 'ipset v'. 
Should be sufficient.
The script doesn't check for new appended values, so nothing to do there.
Regarding headers it just checks for 'Name:' and 'Members:' to find 
them. Some checks included if it's expecting an header or not.

Also changed the following:

- Added -i option to show only the members of a (single) selected set.
- Allow combination of -c and -t, to show headers and members sum of 
(selected) sets.
- Add ipset version checking (allow 6.x and upwards).
- Check for BASH variable.
- Added version.
- Don't display member count (of 0) if an invalid set name is used.
- More exammples and comments.

Attached and hopefully bug-free

Best regards



--------------050002060507030501010307
Content-Type: application/x-compressed;
 name="ipset_list_v1.tgz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ipset_list_v1.tgz"

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
sRiLsRiLsRiLsRj/9vgDTnwduQAoAAA=
--------------050002060507030501010307--
