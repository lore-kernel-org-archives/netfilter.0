From: Payam Chychi <pchychi@gmail.com>
Subject: Re: Are limit and hashlimit "limited"?
Date: Mon, 14 May 2012 15:45:50 -0700
Message-ID: <FAE1FE7B-97F2-44A8-8033-05F7B39E72DF@gmail.com>
References: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:in-reply-to:mime-version:content-transfer-encoding
         :content-type:message-id:cc:x-mailer:from:subject:date:to;
        bh=EDG4mhpPPcFZVAq58Bpv9LQQH2P09wDMsCk/C8gq3Cc=;
        b=TEfjegd7dmiLJ7AUPvSLOhB3fVCtib2z1gQuzACEVV4Esi5K3Fl5pI06EIkysHZvXk
         UyahqVckeZa7V97/n54p2de/b+tH40H4wEZVRaU/+Ypy/OU+V3s5JYdVB2EwNk9ij918
         Aup89cI4Nip70Aab95PLS/a2mSN78MERRdJjt66Q/ic/ay50z5JQEOEdVZa5Obw2cScT
         B2sjHNFXhnB7mOLbmSSuv4RSp/90jxhfet+OI3UFSR8+amSjCM/YHktmNYUcU4U4vC5n
         cKVLHx/nYq42EpmKGbF5MZvKDhCoIyvc1bd/Dl+vCyBXI4Z4dLz1aCTPIvvl024xOQ1k
         J/7g==
In-Reply-To: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Klaubert Herr da Silveira <klaubert@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

limit and hashlimit have never worked properly, one reason being the system bus speed.

playing around with values i was able to account for 100,000 packets/sec but that is the max

Sent from my iPhone

On 2012-05-14, at 3:30 PM, Klaubert Herr da Silveira <klaubert@gmail.com> wrote:

> Hi,
> 
> I'm playing with match modules limit and hashlimit, and they appear to
> be limited to match a maximun 100/sec. If I use hashlimit with no
> "--hashlimit-mode" I get the same, a max of 100/sec, even if I set for
> exemple to 250/sec. My command setting the 250/sec is accepted, with
> no error, but test show only 100 match/sec.
> 
> Is this a hard limit of this modules, or I can go above this in some way?
> 
> Best regards,
> 
> Klaubert
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
