From: andre.correa@pobox.com
Subject: Re[2]: sendto: No buffer space available
Date: Mon, 2 Dec 2002 12:46:35 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <897096133.20021202124635@pobox.com>
References: <Pine.LNX.4.44.0212020932180.16752-100000@Sinister.Com>
Reply-To: Andre Docena Correa <andre.docena@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0212020932180.16752-100000@Sinister.Com>
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
To: Bob Keyes <bob@sinister.com>
Cc: netfilter@lists.netfilter.org


Hi list and Bob, my netstat -n shows nothing unusual:

root@mybox:~# netstat -n
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0     20 xxx.xxx.xxx.xx:22       yy.yy.yy.yy:1105        ESTABLISHED 
Active UNIX domain sockets (w/o servers)
Proto RefCnt Flags       Type       State         I-Node Path
unix  24     [ ]         DGRAM                    57     /dev/log
unix  2      [ ]         DGRAM                    7051   
unix  2      [ ]         DGRAM                    4997   
unix  2      [ ]         DGRAM                    4928   
unix  2      [ ]         DGRAM                    2820   
unix  2      [ ]         DGRAM                    2730   
unix  2      [ ]         DGRAM                    2690   
unix  2      [ ]         DGRAM                    2650   
unix  2      [ ]         DGRAM                    2550   
unix  2      [ ]         DGRAM                    2500   
unix  2      [ ]         DGRAM                    2460   
unix  2      [ ]         DGRAM                    2330   
unix  2      [ ]         DGRAM                    2240   
unix  2      [ ]         DGRAM                    2200   
unix  2      [ ]         DGRAM                    2134   
unix  2      [ ]         DGRAM                    2081   
unix  2      [ ]         DGRAM                    2041   
unix  2      [ ]         DGRAM                    2001   
unix  2      [ ]         DGRAM                    1921   
unix  2      [ ]         DGRAM                    1909   
unix  2      [ ]         DGRAM                    1765   
unix  2      [ ]         DGRAM                    1757   
unix  2      [ ]         DGRAM                    60     

that is it...

tks

Andre



On 02/12/02, Bob Keyes wrote:
BK> What does netstat -n show you?
BK> I have seen this error when there are thousands of TCP connections open at
BK> the same time (this was using the 'naptha' DoS demonstration tool I
BK> wrote).

BK> On Mon, 2 Dec 2002 andre.correa@pobox.com wrote:

>>
>> Hi list,
>>
>> I  have  a  Linux  2.4.19  box  doing NAT, PPPoE, Traffic Shapping and
>> Firewalling.  It  is  a  2xPIII  733MHz with 512Mb RAM. Everything was
>> working  just  fine  until 5 or 6 days ago we started having some strange
>> behavior.
>>
>> Under  moderate  traffic,  15  to  20  NAT users, we find that traffic
>> suddenly  stops  for 10 or 15 seconds and then comes back. During this
>> periods  I've  figured  out  that  if I ping my interfaces or Internet
>> addresses I get:
>>
>> sendto: No buffer space available
>> ping: sent 64 octets to xxx.xxx.xxx.xxx, ret=-1
>>
>> I've  made  lots  of  searchs  in  mailling lists, Internet and in the
>> kernel  source  but couldn't work on it.
>>
>> Can you guys help me to solve this problem?
>>
>> tks in advance for your help and attention.
>>
>> Andre
>> andre.correa@pobox.com
>>
>>
>>



Andre Correa
andre.docena@pobox.com


