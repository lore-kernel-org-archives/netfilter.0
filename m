From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: ipv6 tproxy / transparent proxy support?
Date: Tue, 26 Oct 2010 19:48:09 +0200
Message-ID: <4CC71459.5020809@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=YixsIiFg2iGbAXBwqqsy6v
	mmF1o=; b=Gaj/x9CpAaPSSNocG3yizbQVcqkC6dL0k/w10/syGlox5ok+P0IxJ9
	yue66GdgRIdoBsNJ8f555iyXa93v/w/nL/+Ib9EXjw1TyDwh5To/9KYZQdhMXVRi
	bJxK6uYHgWt+hY9NADTBgltEB3d3pCAWmVodKLIJO+YN1BsNvLNh4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

What is the state of tproxy / transparent proxying (i.e. with Squid) 
with ipv6?

As far as I can find in the documentation, I will need:

- a kernel which supports it,

- ip6tables which support it.


Is ipv6 transparent proxying available in stable iptables? If not, 
perhaps I should get a daily snapshot?

What about the kernel? I guess I'll need these patches for the kernel 
("[PATCH 0/9] tproxy: add IPv6 support" by Kovacs Krisztian)? Perhaps 
something else?

http://thread.gmane.org/gmane.comp.security.firewalls.netfilter.devel/35841


-- 
Tomasz Chmielewski
http://wpkg.org
