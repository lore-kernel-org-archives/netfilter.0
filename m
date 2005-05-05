From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 05 May 2005 11:37:48 +0200
Message-ID: <4279E96C.7010304@danbbs.dk>
References: <4278C3DE.7010403@au-kbc.org>
	<4278F150.4000806@riverviewtech.net>	<42794F67.7060803@danbbs.dk>
	<4279570A.1090509@riverviewtech.net>
	<Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
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
Cc: "Taylor, Grant" <gtaylor@riverviewtech.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Jozsef Kadlecsik wrote:
> On Wed, 4 May 2005, Taylor, Grant wrote:
> 
> 
>>>How about using a fifo (man mkfifo and man syslog) and let syslog pipe
>>>to that fifo. Some program can then read from the fifo, parse data, and
>>>maybe use a database for storing the parsed, now more limited, data.
>>>Might be a good ide to have the database on another system :-
>>
>>Using a FIFO to a program that parses and transmits the data to another
>>system to network might be a possibility.  Keep in mind that any
>>processing that you do on the packets has to be able to be done at least
>>as fast if not faster than the rate the packets come in.  If you ever
>>end up getting behind on the processing things will snowball on you VERY
>>quickly and more than likely end up in a very nasty mess.  This is why I
>>think it would be better to use something like TCPDump or Snort to sniff
>>the network and then post process the dumps.
> 
> 
> Why where a FIFO and a program which parses and transmit the data to
> another system any faster than syslog/syslog-ng/ulogd/etc? (Why reinvent
> the wheel?)

It might not.. AFAIK, the FIFO is implemented not as disk I/O, but is a 
memory thingy.
It *appears* as file I/O, but the filesystem is used only to create that 
named pipe.
Hence, my thought was that since logging with iptables has to go throu 
syslog, this might offload faster through a FIFO.
The app reading the FIFO would preprocess the datastream and turn it 
into chunks, exactly as Taylor put it.
Depending on what one really wants to look at / dig out of logging, the 
FIFO-reading app could also reduce data.

-- 
Kind regards,
Mogens Valentin


