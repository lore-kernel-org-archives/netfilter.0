From: zrm <zrm@trustiosity.com>
Subject: Re: Routing some packets different?
Date: Sun, 6 Aug 2017 12:38:46 -0400
Message-ID: <096fca7d-296e-831a-be5f-79aa39551419@trustiosity.com>
References: <5986DB5B.1070505@mathemainzel.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1502037543; bh=UfJk8sPcdUYPxt+fdDBKWv5erUW/7VfF7p+Edp+JBn4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=FvFE1y1SR0+7oLfG2z1+72haOCOhF0V8n7cR/6WiVX62ico8rJccncEcuCmVjIWyn
         8RuL6d39COgL8L/wJUSEkZpHbuljXjKXOrWwvRUmoq6e7qDiwrjJfzrWr1PHwN08PF
         lc5P6uaJLEtuGP643cBwtbsLqiuBIEpVxiQ1Xkiw=
In-Reply-To: <5986DB5B.1070505@mathemainzel.info>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Walter H." <Walter.H@mathemainzel.info>, netfilter@vger.kernel.org

> I regularly see in  the log that HTTP traffic to these IPs
> - 104.16.89.188
> - 104.16.90.188
> - 104.16.91.188
> - 104.16.92.188
> - 104.16.93.188
> 
> is there a way to redirect these packets through the squid-proxy running 
> on the router?
> or any other way to get to know what is causing these traffic?
> 
> Thanks,
> Walter
> 

What you're looking for is called a transparent proxy. Knowing that you 
can search the web for instructions.

Another way is to capture packets with dumpcap and look at the capture 
file in wireshark.

If you have access to the client device while the connection is open you 
can also use lsof to see which program is making the connection, e.g.:

lsof | grep TCP

