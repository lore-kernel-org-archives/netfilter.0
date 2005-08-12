From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Handling bad tcp checksums
Date: Fri, 12 Aug 2005 00:09:37 -0500
Message-ID: <42FC2F11.1020709@riverviewtech.net>
References: <dd8o4i$hjr$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dd8o4i$hjr$1@sea.gmane.org>
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

Robert Nichols wrote:
> I've run into a problem handling tcp packets that have incorrect
> checksums.  It appears that such packets are assigned state INVALID,
> and thus are never treated as part of an ESTABLISHED connection.
> Thus, dropping such packets becomes the responsibility of the firewall. 
>  The problem is that unsolicited SYN,ACK packets are also matching
> "--state INVALID", and for these the proper action is to send tcp-reset. 
>  I cannot risk sending tcp-reset for an incorrect checksum -- the result
> would be that a transmission error would cause the connection to drop.
> If I test "--flags SYN,ACK SYN,ACK" then I run the risk of basing my
> decision on the flags in a possibly corrupted packet.
> 
> Iptables doesn't seem to have any way to match on incorrect checksums.
> It looks like the best I can do is check the flags and accept the
> possibility that they are corrupted.
> 
> Suggestions?

If we presume that you are correctly DROPing traffic that is in an INVALID state when the checksum is invalid and you are just wanting to send a reset to an invalid connection with the SYN and ACK flags set you could do something like the following:

... -m state --state INVALID --flags SYN,ACK SYN,ACK ... -j MyResetTarget
... -m state --state INVALID ... -j DROP



Grant. . . .

> BTW, doesn't this mean that _all_ iptables matches are testing data
> that is possibly corrupted?


