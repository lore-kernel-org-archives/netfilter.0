From: "Rob \(lists\)" <lists@sterenborg.info>
Subject: RE: LOG_ACCEPT does not result in matching packet being accepted (ACCEPT works)
Date: Sat, 19 Mar 2011 08:41:19 +0100
Message-ID: <3B9D650FA47F4012ACBD15C9FA7E5DC7@Dell>
References: <AANLkTin0ZoJ7MfonStpL_Ez=m=tre_w5WvRRXWLrswke@mail.gmail.com> <8A7E792DB93B42C5B2C33004FFDBF9C6@Dell>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8A7E792DB93B42C5B2C33004FFDBF9C6@Dell>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> > If I change the LOG_ACCEPT to ACCEPT, strangely SSH starts working.
> 
> Not so strange to me. Using the ACCEPT target, you're 
> actually ACCEPTing the packet(s) whereas LOG_ACCEPT doesn't 
> (do anything).

Maybe this isn't clear.
ACCEPT is a final target: the packet will be accepted and that's that.
LOG_ACCEPT is a userdefined chain, not a target, but you can send
packets matching a rule to such chain for further processing. You should
add rules to this chain that tell Netfilter what to do with a packet; if
the chain is empty, nothing will be done. The packet will not be
accepted, simply because the chain is called 'LOG_ACCEPT'.


-- Rob

