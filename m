From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: block network access for certain users/groups
Date: Sat, 31 Jul 2010 06:04:45 +0100
Message-ID: <AANLkTinz=AfA0N2DRabe2XfTpvNqdaQv_WKNnF3Xwudd@mail.gmail.com>
References: <op.vgmcupy42qajpl@imac.local>
	<4C51D771.1080904@gmail.com>
	<alpine.LSU.2.01.1007301036310.27811@obet.zrqbmnf.qr>
	<4C52B8D4.30207@gmail.com>
	<AANLkTini081q41=oHEoSgQQ+YGN5NEkvuDhU7MBWguhV@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=1yDjDtUeU8Z0SJOfVo/kUVUzhgdm/jWYA1rMKh2/nUg=;
        b=YwEB1bQEMcAry/yg2+7+faMmwK+o4PCbLaRM5zpO7qYGwVfUQoT340hR81xRhjbhcS
         pE5G/55hoPmthKcicZqp2HJxy5E8JMQQmD6MJ7U9aWQEOHPr5uGgCo7rx37E9MSVX0+1
         WQpqjRk6ASy//ZY9bg5DbJhi3eysQh3WnLyZs=
In-Reply-To: <AANLkTini081q41=oHEoSgQQ+YGN5NEkvuDhU7MBWguhV@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elmar Stellnberger <estellnb@gmail.com>
Cc: Lars Nooden <lars.curator@gmail.com>, jengelh@medozas.de, netfilter@vger.kernel.org

[snipped original]
Might be worth turn trace on :
iptables -t raw -A OUTPUT -j TRACE

See which rules the packets hit; if you want to cut down the amount of
traces just add the relevant matches - I tend to trace everything
until I know what I'm the packet(s) look like what I expect and  then
start focusing in.
-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.richardhorton.info
