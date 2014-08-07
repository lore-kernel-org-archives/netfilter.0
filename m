From: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: Match EUI64 in IPv6 Address
Date: Thu, 07 Aug 2014 22:51:01 +0200
Message-ID: <53E3E6B5.4000300@dupond.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dupond.be; s=mail;
	t=1407444663; bh=l7d7/IBXtOg3GmJya4uvBsesVqJOVrTlrRJeHV/ohOA=;
	h=Date:From:To:Subject:From;
	b=O5FjQCdB+qtXE+rXry6EC+sX266v4/9un9cWfcTIAXzG0TKdogkCF98HUX+j2kIX+
	 U1bLiYT09Y5ztwTFA1CLZpR3P29z6n+hnQI2Jn0tSJonv3IUxW8dTUdYCvjraZ2wA7
	 N3EVCYKguT7FybfCKtBLiPByH34zR7GkpM6NkDug=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm in the following situation.
My ISP gives me native IPv6 connectivity, a /56 range.

The only thing is, the prefix is dynamic, it changes every 96hours.

Now my router announces this range to my clients, and everything works fine.
But then comes the issue.

I firewall my LAN on my router, so there is no need for a firewall on al
the clients.
But as the prefix is dynamic, I can't just fix this in a clean way.

Every time the prefix changes, I need to adjust my ip6tables rules.

So my question: Is there a way to make an ip6tables rule that only
matches the last 64 bits (the EUI64)?
This would solve the issue that i've got.

Thanks
Jean-Louis
