From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's network
Date: Thu, 16 Oct 2008 08:07:51 +0200
Message-ID: <1814bfe70810152307p4934a291x7171ce7b6b107f97@mail.gmail.com>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
	 <b279aba36c2ccd3e1bb1d98c7fce21a2.squirrel@webmail.treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=E+NJyR5pe3Htyp3uMbL5Qkv2DIbCBgY8yQBm8tYhMr4=;
        b=YAefX6/WTH8pZDAfYP0Iwvs0hZy3TI6iwED+1fqsQZQXYv1rymS1jVhqk6txkXAr7T
         qRG6QoK+0gzCAg3P6FxLEzbBe/1l/0BQe4Fl/sBm2+jyIs8MxMzcVcZcm3Sb8c8WMfzU
         JEpZMqgyJxDGe2or/Ket7EOK2f2Cirq0fTE9k=
In-Reply-To: <b279aba36c2ccd3e1bb1d98c7fce21a2.squirrel@webmail.treenet.co.nz>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: netfilter@vger.kernel.org

Greetins :)

no I do not need a direct assistance, I just need a hint about this
transfer from IPv6 network to IPv4 network....and I placed my question
on this mailing list ( I am reading it very often ) because I think
this is
place where are a lot of people network proffesionals.
In network I have only unix/linux ( debian/openbsd ) and all works ok,
and IPv6 is supported by all. Setting ipv6 address to host is not such
a big problem, and just want to make clear, how to connect from ipv6
client thru ipv6/ipv4 gateway to internet....

Kind regards,

Elvir Kuric


On Wed, Oct 15, 2008 at 11:23 PM, Amos Jeffries <squid3@treenet.co.nz> wrote:
>> Hi all,
>>
>> I have an question network/iptables related. In my home network I am
>> planning to deploy ipv6 addressig, not because I do not ip addresses,
>> but only as training how to set up
>> all that. I read some manuals/books and less or more it is not so big
>> problem. On my home firewall/router I have Debian GNU/Linux with
>> iptables as firewall tool and it works fantastic :)
>> I am wondering does someone has experinece with translation from ipv6
>> ---> ipv4, I mean I am going to set up my home computers to use IPv6
>> but still I have to push my iptables rules ( I know iptable supports
>> ipv6 ) and
>> my gateway to packages from ipv6 network prepare for ipv4 network ( my
>> ISP provider )
>> Any suggestio is welcome and thank you in advance.
>>
>
> Greetings.
>  If you need direct assistance, I've been through this already in a
> Debian environment.
>  You need to look at dual-stack network with a 6to4 or 6over4 tunnel on
> one of the machines. Depending on how close you are to 192.88.99.1 will
> determine which works fastest for you. I have a script I can provide when
> I return home which does setup of 6to4 tunnels. 6over4 is usually
> provided by the tunnel broker you choose.
>
> What OS are your home machines?
> and do you have at least one machine Linux 2.6.25+ (newer is better for
> IPv6 stability) to use as the IPv4/IPv6 gateway? NP: it does not have to
> be the same as IPv4 gateway machine, but that helps :)
>
> Amos Jeffries
>
>
