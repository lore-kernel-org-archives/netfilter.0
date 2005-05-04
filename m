From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Wed, 04 May 2005 18:13:14 -0500
Message-ID: <4279570A.1090509@riverviewtech.net>
References: <4278C3DE.7010403@au-kbc.org> <4278F150.4000806@riverviewtech.net>
	<42794F67.7060803@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42794F67.7060803@danbbs.dk>
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

> How about using a fifo (man mkfifo and man syslog) and let syslog pipe 
> to that fifo. Some program can then read from the fifo, parse data, and 
> maybe use a database for storing the parsed, now more limited, data.
> Might be a good ide to have the database on another system :-

Using a FIFO to a program that parses and transmits the data to another system to network might be a possibility.  Keep in mind that any processing that you do on the packets has to be able to be done at least as fast if not faster than the rate the packets come in.  If you ever end up getting behind on the processing things will snowball on you VERY quickly and more than likely end up in a very nasty mess.  This is why I think it would be better to use something like TCPDump or Snort to sniff the network and then post process the dumps.  This post processing could probably be done as often or seldom as you would like, this is all tunable.  The reason that I like the post processing is that you have a rather large buffer before you start snowballing on your self, namely the disk to store dumps on.

(maning mkfifo...)

After reading about FIFOs and playing with them momentarily (mkfifo test; ls > test; (jump to different terminal) cat test) I would be worried about how much data could be queued in a fifo and what would happen if more data than that was dumped in to the fifo.  I personally see too many opportunities for things to break login this way.  Login this way may indeed work but I would not want to try this, especially on a higher speed link.  Seeing as I have no idea what speed this would break on I am even less likely to try it, but that is just me and my opinion.  You know what they say about opinions...



Grant. . . .

