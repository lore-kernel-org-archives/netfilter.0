From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: How do you correctly interpret the FORWARD chain interface 
	options?
Date: Tue, 9 Feb 2010 13:25:01 +0000
Message-ID: <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=4u3jXibDwKKtcQghMe0WkHi5wtpTvwxAylHeShh4WFA=;
        b=QF9Ve7F1eX2L2JsE+bahjeZYmMLzzAWs8BEHJKL7OAelRrtn5ZVnY1iCoAsjAhi8ZA
         JMcEXnpl4ujGedlcFm7AoeXGYDbXeJyo6JPWeAn6vq9caRm1fIfDly0BrOVWwyKPD004
         JbPlocMxfrRmAcOFIslpX7tYvDLu749UQ5lls=
In-Reply-To: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> wrote:
> Hi All,
>
> How should one interpret the inbound ("-i") and outbound ("-o") of the
> FORWARD chain.
>


-i refers to the interface the packet is received on.
-o refers to the interface the packet is routed out on.



-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
