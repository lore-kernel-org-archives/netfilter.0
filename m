From: Markus Marquardt <adrock0501@arcor.de>
Subject: Re: Packets from "self" dont pass through netfilter
Date: Thu, 12 Jan 2006 13:52:27 +0100
Message-ID: <43C6510B.3070203@arcor.de>
References: <4dcb3660601110735o30468a40m87b7629d8b0e041d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4dcb3660601110735o30468a40m87b7629d8b0e041d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thanos Panousis wrote:

> But the packets that come from the primary server(which has the same
> IP/MAC) NEVER go in the backups QUEUE. Why is that?? I dont grab them
> at the QUEUE target, but I can see them crossing if I use ethereal!

IMHO the backup server thinks the packets came from itself (same MAC). 
So why should it queue them into the ip stack?

Regards,
Markus


