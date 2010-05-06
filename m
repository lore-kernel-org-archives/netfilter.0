From: Alessandro Vesely <vesely@tana.it>
Subject: Help: netfilter frozen in recvmsg (slightly improved)
Date: Thu, 06 May 2010 19:51:30 +0200
Message-ID: <cone.1273168290.116207.28621.1000@north>
References: <cone.1273080221.526801.26283.1000@north>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1273168290; bh=c5z/GIngeD+mkNy9W+8RmZJ/O+YzJwPtkil3bX8Hg4U=;
	l=1895;
	h=References:Message-ID:From:To:Date:Mime-Version:
	 Content-Transfer-Encoding;
	b=QRZsBeJhukmIyF93sLPQwpUCHDWd34A2Pm7bwT6+Df6wpnGM5HF33fWgfnwpNFNIO
	 8MC+jskH3gGhr92t5n7f9vLYDRLJ9Cnt2jDdCCNaWUGnE3Zqs9cBGD06xNpPlTSnx+
	 2cJd2R2b/PUr5yJ2eIaqSbutJxCl6YpS3Q4rOJY4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@vger.kernel.org

I wrote:
> Hi all,
> yesterday my netfilter client suddenly froze. I wasn't even able to kill it. 
> The following is a strace:
> 
> recvmsg(4, 0x7fffffffa770, 0)           = ? ERESTARTSYS (To be restarted)

strace was displaying just "recvmsg(4,", until the signal was caught. The 
buffer address and flags have been added at thet time. I think strace didn't 
write more info because no msg had been received.

> The relevan line of code is
> 
>         while (caught_signal == 0 &&
>                 (rv = recv(fd, buf, sizeof(buf), 0)) >= 0)

This was wrong. recv is translated to recvfrom in the C library. recvmsg is 
apparently called from the nfnetlink library. I downloaded some sources 
(independently of the installed libraries --still lenny.) They show such 
calls in nfnl_talk

	while (1) {
		status = recvmsg(nfnlh->fd, &msg, 0);
		if (status < 0) {
			if (errno == EINTR)
				continue;

and in nfnl_listen

	while (! quit) {
		remain = recvmsg(nfnlh->fd, &msg, 0);
		if (remain < 0) {
			if (errno == EINTR)
				continue;

(This may explain why I had to use SIGKILL.)

(It seems both these functions are now deprecated. I must have an older 
library.)

I'd guess the program froze in the nfnl_listen function, since nfnl_talk is 
only used for queue configuration. However, I haven't been able to find 
where nfnl_listen is being referenced from. Can anybody shed some light on 
how that works?

At any rate, the most plausible diagnosis I can think of is that messages 
were not being sent to user space any more. After I killed the daemon, I 
just launched it again. It worked. I haven't rebooted the box since, so the 
problem seems likely to be in user space. A reasonable question is whether 
it is common practice to destroy the queues and the handle and rebuild 
everything from scratch every now an then. Would that help?

