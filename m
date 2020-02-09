From: Haochen Tong <i@hexchain.org>
Subject: nftables "native interface" for IPv6 NPT?
Date: Sun, 9 Feb 2020 01:44:19 +0100
Message-ID: <8b2eff13-0857-08d8-9111-9be84b39db29@hexchain.org>
Reply-To: i@hexchain.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hexchain.org; q=dns/txt;
 s=smtp; t=1581209064; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: Subject: From: To: Reply-To: Sender;
 bh=87nycdntUlsqtPjmUnC1m6GY++eQPJ+kH1GaA247GsQ=; b=FvvKlDi1z/cw6DTMvIQFd0MgvK6gna4k2MwyaWLi/UBc7+oBy7sKz/pNthHXjtRIqSAFq5wA
 fcERyhGq4iwJexfHJq4zNtCckFMj6m962DPjzxh6ysnC6iZ3j1W7Wwy3+5Ng49MKQKMV5GVU
 sgklO8Hl6hQCl2dTNca+E+OJlvTS1q/VBgpElVDcq/nP9hbVlqqVQcGrrFAQmJInpakkYMbk
 550CqXyfq7Vu2DbF2/JropG4+W3l0PyTBA8SRdHyQo3Z4QX98KyXq2GXTxPmDGyo1oMTOgsW
 GrnzmmzjmLXjeix6tf+UyWsQ/vTBG/7pJv/maXUmUjzi98upaX6zKw==
Content-Language: en-US-large
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

While trying to implement IPv6 NPT with nftables I did not found any
useful documentation. The wiki says "consider native interface", however
I cannot find any reference to this "native interface".

Is this unsupported for now? Are there any workarounds?

Thanks in advance.

Best regards,
Haochen Tong
