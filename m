From: Daniel Drake <dsd@laptop.org>
Subject: Re: filtering based on MAC address prefix
Date: Sat, 16 Jan 2010 10:37:25 -0600
Message-ID: <818423da1001160837w64e17f52y1958260aaca80155@mail.gmail.com>
References: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com>
	 <4B518D2A.2040905@caf.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=EsMty60fCpv42v1aD9h9UeQfOa7sxcAlNWwcpDZb2ZI=;
        b=OeetnZd5IuylulA5Ml2bWmG/uYFwP76d6wAkrzedKM8spLclI+nBGNbw/hTbUajWWJ
         fi7ltAu7jXWRrLVxXHz5htUOvOgRxke0SVEt5sTQHUuRVs2SxhaNUooqPgwwwbH9FlA3
         QBPt0XsJjVfy8YPc75YHnA1hv3lGYi17m/fwc=
In-Reply-To: <4B518D2A.2040905@caf.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eray Aslan <eray.aslan@caf.com.tr>
Cc: netfilter@vger.kernel.org

2010/1/16 Eray Aslan <eray.aslan@caf.com.tr>:
> ebtables(8) is usually the better tool to use for dealing with ethern=
et
> frames. =A0Check if its --source and among matches fits.

Thanks! I wasn't aware of that.

At first glance it looks ideal, but after trying to get it working, it
seems inappropriate.
Setting all ebtables policies to DROP (and adding log rules) does
nothing. As far as I can tell, ebtables only operates on bridge
devices, of which there are none in this setup. Am I missing anything?

Daniel
