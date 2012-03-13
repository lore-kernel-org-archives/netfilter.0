From: =?UTF-8?B?RMSBdmlz?= <davikovs@gmail.com>
Subject: Translation of addresses inside ICMP errors
Date: Tue, 13 Mar 2012 12:10:08 +0200
Message-ID: <4F5F1D00.7030901@gmail.com>
References: <CAHQn7pLfzDNrEsUawtqeE_yyeqKpUp4n-E=mTaghwdRoJWo5oQ@mail.gmail.com> <CAHQn7pLfLuYS=XC1SYxYNPxL35aMD_pU8dd6mFt-FFRiqsrAAg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=5F6pMi6EmNl4jOTLoFrzCVtyfSzuloE6L9NNE0w8LTI=;
        b=iqH8v/AfwZze2EK4riVcwgPz3XFOo5K5CS0eYg/oVhKNPY4dt2BL7BwBviJYthrLPN
         oReqpwVTpcsztrFx+0RjI+wDpBjop0hJH9tQF4UgMo6yl7el4lLSqLXx1AB/wSFWidRg
         KRluclezZAmr1XNOkkIsA+edy3xAi2hORjpIGSbozlzUMsNzUxaf21MBCr3ZFVzLpe21
         qwZuNMlK5xqDl+EtJn/7+Ev+Ss55H2CaN2ZpROOlamJ7PZ+7jnoziWWWaBeGy1u2Ua5e
         mf4neo12Q5k/VejHN/CZt297dHR9VYVC79DLvRi8vPAAK44DxhsHKrEaOPBsEtIvex0i
         ySWQ==
In-Reply-To: <CAHQn7pLfLuYS=XC1SYxYNPxL35aMD_pU8dd6mFt-FFRiqsrAAg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

When packets are NATed (in very typical case with SNAT when leaving
internal network) their IP addresses in IP header are adjusted. ICMP
error messages sent via router (running netfilter and doing translation)
however contain unmodified "IP Header + First 8 Bytes of Original
Datagram's Data" of packets sent in internal network (i.e. IP addresses
inside ICMP error messages aren't translated). Is this expected behavior
of netfilter? Is it possible to translate IP addresses inside ICMP
messages using netfilter?

