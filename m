From: Padmanabhan <rpdumps@gmail.com>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 15:15:01 -0500
Message-ID: <76fdae320807211315v74557772jc9f8fefb83ac5b2b@mail.gmail.com>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>
	 <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>
	 <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>
	 <4884ADDC.7000600@riverviewtech.net>
	 <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>
	 <alpine.LNX.1.10.0807211848360.21244@fbirervta.pbzchgretzou.qr>
	 <76fdae320807211106m4d0c6dd8qfae16a04a31577d8@mail.gmail.com>
	 <4884EA41.3060203@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=qUlg651ZZmm0MaMooSyOZalhaVVW5IQEFACPy/hCrWk=;
        b=JpflpF0xD2J4zeK5bHi69l8J4YbdxiHlcNHJ5Nk24bMCCvhYlekE/oWKLdh4DLONhA
         7O8Pxj5Ti/fygWjhvxvg9FV+CQhBcOpeSDEnk7kMpg+6VMGQQGPNkUilc/MhSoAcX9l1
         Yi0AXR4LbE3Hel04v+sd73nQtLJJE98jXekKQ=
In-Reply-To: <4884EA41.3060203@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello Grant,
My interested 4 bytes can have value between all 0's to all FF's...
that's the reason that without matching it for a specific value,

I want to record those values.. without using any capturing programs
like tcpdump/wireshark.. u32 provided me flexibility to look for only
specific bytes...but the action which I would like perform is not
currently supported ....

I have another story after recording these values :-)

Thanks
Padmanabhan
