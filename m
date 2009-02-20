From: Ralf <rm@amitrader.com>
Subject: Cannot get data out of the QUEUE
Date: Fri, 20 Feb 2009 16:53:41 +0100
Message-ID: <gnmjm9$a92$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On my Linux virtual box only the QUEUE option of iptables is working.
I guess this is a compatibility mode with old versions.
The packet queuing is working (one can see it in iptables counters (-vL)),
but the problem is getting the packets from the queue.

I tried the libipq sample but the function ipq_set_mode() gives 
an error "Failed to send netlink message: Connection refused".

How can I use at least the old QUEUE method (ie. queue 0) ?

Loading of any newer kernel modules (NFQUEUE etc) is unfortunately 
not possible because it is a rented box and the hoster rejects 
to load any other modules.

Just one queue would be sufficient for me.
Any help very much appreciated, also info about alternative methods/libraries.

