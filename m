From: Nikolay Kichukov <hijacker@oldum.net>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 16:20:15 +0200
Message-ID: <4ECFA41F.50105@oldum.net>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org> <4ECF299D.9040005@gmail.com> <janteh$3ui$1@dough.gmane.org> <4ECF9C17.80804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=oldum.net; s=mail;
	t=1322230817; bh=VzMfmBt9NvLNFmUnCYx6QLIKVkyFBBAMongF0w5MwoQ=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=li/OdfLTb5uEAGx4RPemTJX/FOH74wkSJgr4Xn5wwWJD4cWPspkhgMnx8gNcoEMPd
	 8S4C2oer1q7dbKjxZLbO6JrJtSeOtJRvuHGyw/dJ6n+xXNOcUByuYxugJhlo0oITqB
	 Cm1C9PVSNXomMjUxTExhaTQCWAjW9MxKOIwpQzAU=
In-Reply-To: <4ECF9C17.80804@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lu zhongda <luzhongda@gmail.com>
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>, netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
just googled what you're after and bumped to:

http://www.lowth.com/cutter/

HTH

P.S. Our Sonicwall devices have that feature to close established connections when they hit a predefined timeout value
with no data passing through.

- -Nik

On 11/25/2011 03:45 PM, lu zhongda wrote:
> Hi Brian:
> We supply java application server product to our customer.
>     The application server supplies jdbc connection pool functionality to deployed web application.
>     The jdbc connection pool usually keeps a fixed count of physical connections to database which are socket connections.
>     The support staff reflected that the connections in the connection pool were dropped by firewall after 30mins to
> become idle under customer environment .
>     I can't get clear information whether the firewall product is iptables.
> 
>     I googled the topic "firewall drop idle connection" on the Internet, found somebody met the same issue like me even
> though they used the firewall product of cisco
>     such as:
> http://vivekagarwal.wordpress.com/2009/07/04/firewall-dropping-oracle-database-connections-in-websphere-connection-pool/
> 
>     Even some web page indicated that iptables can drop idle connection, such as the tcp section of
> 
> http://www.rigacci.org/wiki/lib/exe/fetch.php/doc/appunti/linux/sa/iptables/conntrack.html
> 
> 
>     I am familiar with Linux, so i want to reproduce the issue with iptables, this is why i posed this topic, I want to
> know whether iptables support this or not.
>     If yes, what is the detailed rule set, if not then that is.
> 
>     As to whether iptables should support this feature, it seems that some product supported this, such as pfsense on
> freebsd or some commercial product.
>     Because I never touch freebsd, so I don't want to use pfsense . From my opinion closing the idle connection can
> avoid the upper application leak idle connection,
>     releasing unused system socket resource. So it is a useful feature if iptables can support this.
> 
>     This is the background for my question and is my real-world use case, haw-haw.
>     Thanks for your help and hope for your answer.
> 
> On 2011-11-25 19:16, Brian J. Murrell wrote:
>> On 11-11-25 12:37 AM, lu zhongda wrote:
>>> On 2011-11-24 19:30, Brian J. Murrell wrote:
>>>> You didn't answer my other question though, which is why do you think
>>>> you need to be dropping idle, yet still ESTABLISHED sessions (and
>>>> breaking higher level protocols when you do that)?
>>> The need to drop idle connection comes from one technical support request:
>> Answering my question of "why do you want to do this" with "because
>> somebody asked" does not really answer the question though.
>>
>> There is an important reason for me to to ask and you to answer the
>> question (i.e. with a real-world use-case) and that's because typically
>> when somebody is proposing to do things that are "strange" or "not as
>> intended" (and indeed which will result in other things breaking -- like
>> TCP in this case) it's because they are trying to solve a problem with
>> the wrong tool.
>>
>> Can you please provide a real-world use-case as to why you'd want/need
>> to stop (i.e. break) an open TCP session?
>>
>> Cheers,
>> b.
>>
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOz6QfAAoJEDFLYVOGGjgXuiIIAOPlQpEkbvo3l2CFPOZ8Y1P3
DIqWsBsImFwGq3/xAk8Poypsz3ZLN+dzsGdGmBHVVF8mzTJO4bn33yEmIYj7wXPC
+8zuKHBiXXXrguS/nZq3Xr19KoWGTDvBa/HanO3q5uq7mJaMETo484jf2uHYZbCS
ms4pd0BvKGGMhu5r781hcRdUU2ZXmsm8LmVyfKYDUkGrgLqQrJGrcs+s6KMDe89p
vU+/6rdXnDfVjhIasKZshuiwTbhTcKEULpVot+oiJLQ5uT7ova4yXL6AP626wO4c
FHfeK8RfBImQLgDRWOx5GPcdEPFt06sBwPEcJJUdcleW8Vy5xYiUFAZZSpFFIhY=
=LG4G
-----END PGP SIGNATURE-----
