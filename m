From: Alexis <alexis@attla.net.ar>
Subject: Re: How do I Translate Seq & Opt?
Date: Tue, 20 Jan 2004 12:44:06 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074613446.3001.43.camel@pepelui.baicom>
References: <1074612414.1800.21.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074612414.1800.21.camel@dchws.TQMcube.com>
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
To: "David C. Hart" <dch@TQMcube.com>, Netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-01-20 at 12:26, David C. Hart wrote:
> What is this telling me? Example:
> 
> Jan 20 09:50:18 mail2 kernel: Firewall: 

> IN=eth1 (Incoming interface)
> OUT= (outgoing interface, in this case the packet was directed to the box)
> MAC=00:09:5b:22:29:d1:00:06:25:e4:ed:a3:08:00 (MAC Address)
> SRC=141.156.35.166 (Source IP Address)
> DST=192.168.0.31 (Destination IP Address)
> LEN=48 (Length of the packet in bytes)
> TOS=0x00 (Type of service field)
> PREC=0x00 (IP Precedence field)
> TTL=121 (Time to live field)
> ID=56322 (ID of packet)
> DF ( dont fragment ) 
> PROTO=TCP (Protocol)
> SPT=3134 (Source Port) 
> DPT=445 (Destination Port) 
> SEQ=1244763263 (Sequence Number) 
> ACK=0 (ACK Flag state)
> WINDOW=64170 (Window Size) 
> RES=0x00 (Reset flag)
> SYN (syn flag) 
> URGP=0 (tcp urgent pointer)
> OPT (0204059201010402) (options if any)
> 
> What do I need to read to learn how to understand this?

ethernet first, IP then, and tcp then.

TCP/IP of Comer could be a good start

> 
> Thanks.
> 
>                                ---------
>             Quality Management - A Commitment to Excellence
-- 
Alexis <alexis@attla.net.ar>


