From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Connection tracking counters increasing
Date: Thu, 07 Mar 2013 08:13:05 -0800
Message-ID: <assp.17785d9ff5.5138BC91.9060903@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=kugul2KXlYM2YPDpjVKhepKwx5I=; b=yPMgKe2HvYODXxrRlU4llsRU21CQJq4fpv5jtqwicbi2hhSbtQsQ4dSetEKOidA/iy8posLO9JkQMhcTu6XSajor6V8xACZ24Wp0uhlcB/Iw93cdauqss93C1ye8id2VljXsgCFmR2+u4kquMn+Q2wewxGRXuxc9OSX9epOWH3k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-Users <netfilter@vger.kernel.org>

Sorry if this is answered elsewhere - my initial googling didn't show me.

I have an Ubuntu Precise server that is using iptables.  I've noticed 
that my connection tracking counters keep increasing - and will do so 
until failure.  I've tried a few different timeout settings to see if 
that fixes it - but so far nothing helps except increasing the maximums 
and then rebooting prior to failure.

I'm assuming I'm doing something wrong - but I don't even know where to 
look.  The only things that helps is NOT using iptables - which isn't a 
good answer!

-- 
Daniel

