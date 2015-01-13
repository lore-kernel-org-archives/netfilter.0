From: "Hassan Sultan" <hsultan@thefroid.net>
Subject: Fastest / most reliable way of matching conntrack log entries to PID
Date: Mon, 12 Jan 2015 22:30:23 -0800
Message-ID: <op.xsd1oxwc1jp0b1@content.bigsnout.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=thefroid.net; h=
	content-type:date:to:subject:mime-version
	:content-transfer-encoding:from:message-id; s=thefroid.net; bh=q
	bacaxKUKLFFxFyEdr5fU2rWR7I=; b=bwczDDJU5aMhgMVIb8HYJaJgb2+amewRu
	9GwqEsBbXFozK7hPQvVjyBRtM4kWx7WtZypJAaqg3Ui30fAMhKq/Cc8un6FqoiXP
	9jvuDyDsBl+EtMJnFMbkFI71lUx/zWH1kwNu/dC9YJq39gC5/dH98yUK+wwPWr0P
	IwH7qvN3X0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

So I have a tool that uses conntrack (the library, not the tools) to  
retrieve a log of TCP connection creation/deletion, however it seems that  
there is no logging of the PID provided.

What's the most efficient way of doing that match ? I could obviously use  
netstat or /proc and try to do a match, but that seems ugly and prone to  
race conditions. Should I instead get my log from the auditd  
infrastructure ? Do they provide the matching PID ?

Thanks,

Hassan
