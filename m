From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: unexpected behaviour...?
Date: Tue, 02 Sep 2003 15:59:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F54F6A7.8020004@chrisbrenton.org>
References: <20030828113329.32071.qmail@web21404.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christof Nyffenegger <cnyf@yahoo.de>
Cc: Jim Carter <jimc@math.ucla.edu>, netfilter@lists.netfilter.org

Christof Nyffenegger wrote:
> 
>>Oh, I didn't understand the configuration.  Hmmm again.  I would really
>>expect the http and ssh connections to behave the same.
> 
> Yep, thats the point. but they don't.

I have not followed this whole thread, so if this idea has been 
suggested already please feel free to /dev/null this.

My experience has been that most SSH clients issue a keep alive while 
HTTP does not. If your accept rule is based on IP and port number only 
(in other words, you are not doing a --tcp-flags ALL SYN), its possible 
that the outbound ACK from the client is recreating the session in the 
state table.

Easy way to check this would be to write your SSH rule with the above 
switch. If SSH starts acting like HTTP (no longer re-creates the state 
table entry) then you know this is it.

HTH,
C


