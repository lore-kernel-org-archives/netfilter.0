From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Duplicated multicast packets with -j ROUTE --tee
Date: Tue, 17 Jun 2008 11:43:41 +0200
Message-ID: <145d4e1a0806170243m1eb8a6bds888f8e9bd4146d92@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=Z9h3+hzmBBPRJGY2UMb7fU4mtmsqhgfLPZUfuCUn/0M=;
        b=Wms78NiTcUlXqskeh0IyZ6JXZnWApvV1doSoFwf7tLaTYaYCczTIXF6cCncW4FqqO3
         TXyvvJ9F/IDPVaRDoRbyuONvLfXaRdMhuKJq7TU9rZYr54z7hVV+uty3Rs1RaakClgja
         TXiTAK7F17W7N6GgakvMKOb4cBcY8045VcKYI=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everyone,

I'm a complete newbie with iptables. I've read some tutorials from
netfilters.org in order to have a look about how to proceed. I'm
generating a multicast flow and, in order to take some research
results, I would like to duplicate the packets in the source computer
through the ethernet interface.

I'm working in a Debian machine with kernel 2.6.18-6-686 and iptables
version 1.3.6. I have done some research with google and, eventually,
I've tried this:

  # iptables -t mangle -A OUTPUT -d 239.255.1.0/24 -o eth0 -j ROUTE
--tee --oif eth0

but I obtain:

  iptables: No chain/target/match by that name

Besides that, if I try the same without specifying what ROUTE should do:

  # iptables -t mangle -A OUTPUT -d 239.255.1.0/24 -o eth0 -j ROUTE

I get:

  iptables v1.3.6: ROUTE target: oif, iif or gw option required
  Try `iptables -h' or 'iptables --help' for more information.

Then, I think that the ROUTE target is included in the kernel, so I
suppose there's no need to apply a patch and recompile the kernel but
I don't know what to do in order to succeed in this.Hi everyone,

Anyway, I would like to get some help for more experienced users or
anyone who has dealed with this issue. Any help would be much
appreciated.


Thank you all,
Javi

PS: Some issues with formatted text. Sorry.
