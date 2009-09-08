From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: How to view blacklist ip ?
Date: Tue, 8 Sep 2009 10:48:25 +0300
Message-ID: <38db14850909080048h781ea05eqaae04dd9b88eb676@mail.gmail.com>
References: <4AA4A0D4.3080109@infoservices.in>
	 <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org>
	 <4AA4C3B8.7080309@infoservices.in> <4AA4D05E.5050909@infoservices.in>
	 <4AA4E1AD.4040200@plouf.fr.eu.org> <4AA4FA86.2020601@infoservices.in>
	 <38db14850909071137l3b70e3ecp7eb4b21fd9bffcf6@mail.gmail.com>
	 <4AA5DF29.9070008@infoservices.in> <4AA5EB75.5060301@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=97zxdfaQE0NfH19lNCDhfbAZr7Bofv0G+BrhiAEVbEE=;
        b=R8DmsdacmTZyRk4dDlqhVsWFi0zbjxvCvRlClK1HlS+9luA6Yp6z30RDbtad8TNlsq
         Rw5UKdJNa5qIl32RHeYuRCA5uN6XXC9QhlMMz4AZ6dbASRjPXABNXalVN4pbRPPlBq+N
         jhNuh8yrLVI/H+3QFgR4EdlaD5hi70MCvqxjs=
In-Reply-To: <4AA5EB75.5060301@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

An example is quite simple:

# Create iptree set to lock bad guys for 5 minutes
ipset -N BAD_GUYS iptree --timeout 300
# to add a bad guy( classified by source ip ) into the set
iptables -A SOMEWHERE <your_conditions> -j SET --add-set BAD_GUYS src
# to manually delete a bad guy( classified by source ip ) from the set
iptables -A SOMEWHERE <your_conditions> -j SET --del-set BAD_GUYS src
# to view the list content
ipset -L BAD_GUYS
# to check ip in the list
ipset -T BAD_GUYS <ip>
OR
iptables -A SOMEWHERE -m set --set BAD_GUYS src

If you do not need a timeout you may use iphash set type or ipmap for
/16 network.

-- 
Best regards
Anatoly Muliarski
