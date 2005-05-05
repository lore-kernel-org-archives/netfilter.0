From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 05 May 2005 02:24:46 -0500
Message-ID: <4279CA3E.3000104@riverviewtech.net>
References: <4278C3DE.7010403@au-kbc.org>
	<4278F150.4000806@riverviewtech.net>	<42794F67.7060803@danbbs.dk>
	<4279570A.1090509@riverviewtech.net>
	<Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
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

> Why where a FIFO and a program which parses and transmit the data to
> another system any faster than syslog/syslog-ng/ulogd/etc? (Why reinvent
> the wheel?)

It is my belief that Syslog and the mechanism that it uses to log is not meant for extreme volume of login.  As I understand it Syslog will log each and every individual packet that passes through the IPTables LOG target individually, thus causing a write through the kernel in to SysLog space and possibly to disk for a VERY small amount of data.  Where as TCPDump or Snort will dump to memory for a specific amount of time or amount of traffic captured and then write a large group of packets as one write.  The former will have an I/O action for each and every packet that comes through the kernel, where as the later will have an I/O action once every x number of thousands or millions of packets (user definable).  It is much easier / efficient for a system to write a larger chunk of data at one time than it is for it to write the same amount of data in a lot of little bitty increments.  Imag
 en moving a book shelf from the basement in a house to the upstairs bedroom.  Would it be 
easier to move one book at a time up the stairs for each and every book on the shelf or would it be easier to grab as many books as you can carry and take a bunch of books at one time?  Which would you view as more work in the long run?  There is this same type of load on systems when logging via SysLog.

(Again, this is my perception of the way that SysLog writes log entries.  If someone knows this to be incorrect please tell me other wise.)

> If you sniff the network for logging, where do you actually want to sniff?
> Before the firewall? You'll have to cope with the same traffic as the
> firewall itself and won't see the dropped traffic on the other side.
> Behind the firewall? You won't see again the dropped traffic coming from
> outside. (Please note, I do not advise against an IDS inside which sniffs
> the traffic.)

If you are wanting to log for accounting reasons to know how much traffic any person behind the system moved I would sniff on the internal side of the system.  If you are wanting to log attacks and / or traffic that is dropped by the firewall I would log on the internal and external find find the difference and thus deduce what has been dropped.  Where you want to sniff will really depend on what you are wanting to log.  If you can be more specific I'd be glad to give a more specific response.  :)



Grant. . . .

