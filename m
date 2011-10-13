From: <abirvalg@lavabit.com>
Subject: nfqueue stuck on queue length >299
Date: Thu, 13 Oct 2011 13:37:10 +0000
Message-ID: <20111013133710.6c302eeb@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Sorry, I have to retract my previos statement.
The reason why it lifted the bar to 359 is because I changed the amount of data to copy to NFQUEUE to 
nfq_set_mode ( globalqh_repeat, NFQNL_COPY_META, 0 )
whereas the 299 was hit when I had
nfq_set_mode ( globalqh_input, NFQNL_COPY_PACKET, 40 )
Of course this shows that some NFQUEUEs buffer get filled.
But my issue is not how to increase the size of this buffer, my question is:
Why after the buffer reaches its limit, it refuses to shrink and get stuck.

Am I overlooking something or is this a bug worth reporting to the developers.
Or could somebody write a simple app and confirm my finding on their machine?

