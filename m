From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: a problem with nat table setting
Date: Wed, 1 Feb 2006 22:12:09 +0100
Message-ID: <001801c62774$29f5ebf0$0101000a@sterenborg.info>
References: <d268cd070602011128m953f2b9na975a0a8b0dfd804@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <d268cd070602011128m953f2b9na975a0a8b0dfd804@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Netfilter' <netfilter@lists.netfilter.org>

> Rob,
> 
> Thanks for the answer.
> 
> Is there a way to remove the established connection? I have read
> ctnetlink seems can do this job, but my system is with 2.6.8.1.
> ctnetlink is not there. I also can not find the install package in
> the web. 

It seems to be in POM... But I've never used it; don't know how to put
it to work.
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra
-ctnetlink

> We use that proxy as a url filter, so we need it to be able to be
> disabled/enabled. 

Sorry, I don't understand that.
IMHO if Squid should filter urls, why would you turn it off ?


Gr,
Rob


