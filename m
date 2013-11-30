From: Antonio Prado <thinkofit@gmail.com>
Subject: Re: iptables redirects packets to local proxy
Date: Sat, 30 Nov 2013 21:39:33 +0000
Message-ID: <529A5B15.5030207@gmail.com>
References: <529A42E6.7030504@gmail.com> <20131130201749.GB23089@home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=a9V1vi5QDujUN7pPB0At7VadeZaSNNnEFZodZW4z8b8=;
        b=02RgFp/jgO9ufsodiUEP+psTeS9lls6ccGIAhyvvegdMJiOhAtMOsRD1IGwkJWyBhM
         NgaWz2E1Bfri29ct/tCFCpWj1dmgjn1wQ6zJLIUpf8kHiNqxrSSujlRAjI6oS5DjAd6s
         tnICcMUPkZfevCEj2a+GBYvf2roBNF6GJqcDQu7lGGurAs2rfRbbbgBGeVdGzhQPA6fs
         VfwWgKKc13FTN4qO/gXF3ZLEKiQ9heQfstW+XRYLCAp3VfG/YVTToVdtEvEp8j/w+elB
         my5rsTQVwC4BGC49J/9+Y1ejJZZwdve/fhEhs0QgHacIrRk0haVErrIbrg6YtnoHyK/0
         dk2Q==
In-Reply-To: <20131130201749.GB23089@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil Oester <kernel@linuxace.com>
Cc: ilic_68@yopmail.com, netfilter@vger.kernel.org

On 30/11/13 20:17, Phil Oester wrote:
> Seems the socks proxy should be configured to send the traffic to y:40000.

Right, without using iptables at all for redirecting, socat can do it all.

For example:
socat TCP4-LISTEN:20000,reuseaddr,fork \
SOCKS4:127.0.0.1:A.B.C.D:40000,socksport=12345

--
antonio
