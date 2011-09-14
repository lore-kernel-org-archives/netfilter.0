From: Anatoli Bobylev <anatoli.bobylev@perimetrix.com>
Subject: correct way to terminate nfct_catch
Date: Wed, 14 Sep 2011 17:37:21 +0400
Message-ID: <20110914133721.GU26897@cronos.perimetrix.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a multihreaded application using netfilter_conntrack and one
thread is blocked in nfct_catch. Signal handling is done in another
(main) thread. What is the correct way to terminate nfct_catch? I
tried sending SIGINT to the blocked thread using pthread_kill
expecting that it would be interrupted with EINTR but that did not
happen. The same approach works with NFQUEUE in the recv cycle. Any
suggestions? Thank you. 

Anatoli Bobylev 




