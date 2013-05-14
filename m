From: "krzf83@gmail.com " <krzf83@gmail.com>
Subject: OUTPUT: nat after filter (2nd nat). Please help :(
Date: Tue, 14 May 2013 06:35:34 +0200
Message-ID: <CAJ1PRSnsV_cN0R6JK+8PYb=9u=Fnp_tbo9ufB1j0vUJPoP0cFQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=Hs5sxobWVhmz9RB4JoyrKgqeo+OjzlxGoD1dI2dhc8c=;
        b=IMoNCSWZeCXGaa3JE1O3AwlNbHo17qU8LMjqT4zJinxXrAW19MtpsXdlctjD+Ppx8p
         FPtifcWq+RSw11nhi6uwbNXCo6xBPPJlSh/RNnfDAVN+R5UqYf6vE9sVPw897MpJmyW0
         8GvflPaG+TxkizqLTEiMjAm7POBLsHtxM3uGSiRO1CS/MUQaCHsiqu2CDUimXlmQj8SX
         9iQCTAODgKERHvVFN9wesBCwtNKSed0w37EIL16+U93ZNCKL7zVLvJkf6vI/HRGPeOYO
         DPj0xjnrcHyra8+QfFv83HQ8g9LOGvDNmO05VvgexHe6yx+3Gy/uNMZZMDnUDQ1bXRVc
         1FYQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

According to graph at wikipedia
(http://imageshack.us/scaled/thumb/29/iptablesb.png) in OUTPUT nat
table is processed before AND after filter (2 times). I want to
utilize this second time:

iptables -t filter -A OUTPUT -d 1.2.3.4 -j DROP
iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner abc -j DNAT --to
127.0.0.1:121

Does not work because nat is executed befure filter.

iptables -t filter -A OUTPUT -d 1.2.3.4 -J DROP
iptables -t filter -A OUTPUT -m owner --uid-owner abc -j CONNMARK
--set-mark 0x1234
iptables -t nat -A OUTPUT -p tcp -m connmark --mark 0x1234 -j DNAT
--to 127.0.0.1:121

I think that should work. It does not. What am I missing? Please help :(
