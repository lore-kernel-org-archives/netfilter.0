From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: psd and active ftp mode
Date: Thu, 10 Apr 2003 22:07:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <154613683199.20030410220749@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-Id: <20030410190757.344EA43386E9@mail-proxy.apollo.lv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Wednesday, April 9, 2003, 5:18:19 AM, you wrote:

n> On Tue, 2003-04-08 at 20:22, Peteris Krumins wrote:
>> hello,
>> 
>>  i was just testing psd match and w/ ftp active mode.
>> 
>>  I created 10000 files on the ftp server and set my ftp client to
>>  active mode and let it download those files while having
>>  `iptables -A INPUT -p tcp -m psd -j REJECT --reject-with tcp-reset`
>>  (with psd default threshold/weigh values).
>>  The psd matched 3136 packets.
>> 
>>  Ftp server went mad issuing:
>>   425: Unable to build data connection: Connection refused
>> 
>>  This means i cannot relay on psd and block 'possible portscans'?
>>  Any suggestions?

> What are you trying to accomplish?  If you want it to block all the
> packets then set the threshold higher/longer and you'll catch most.  If
> you want it to NOT catch them, then set it shorter.  Do you anticipate a
> production situation where you will have 10000 sequential FTP
> connections that you want to get through in a short time, or are you
> trying to simulate a rapid succession of destport accesses?  (were they
> sequential, or was the client pulling several at a time, like 4
> simultaneous transfers?)

I am trying to detect portscans. Then my tool -j QUEUE's them and in
the userspace different parts of the packet are logged to the
database and then dropped.

the scheme would look like:
(Internet) - (my tool box) - (router) - (LAN)

The tool box would use ROUTE patch or maybe a bridge.

i simulated rapid succession of destport accesses (sequental) to ensure i
can put it on a high load link. The simulation approved that i cant
do it yet, cause if there are many simultaneous active ftp mode
connections the psd would treat that as portscan, the pacet will be
queued to userspace and my tool would log the packet and drop it.


P.Krumins


