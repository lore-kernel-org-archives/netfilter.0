From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: shorewall: how to open high port
Date: Thu, 1 Apr 2004 07:28:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040401052857.4A66B380B@sterenborg.info>
References: <200404011013.29208.fajarpri@arinet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404011013.29208.fajarpri@arinet.org>
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

> #SOURCE         DEST            POLICY          LOG LEVEL     
>   LIMIT:BURST
> net     $FW     DROP    ULOG
> $FW     net     ACCEPT  ULOG
> loc     net     ACCEPT  ULOG
> all     all     DROP    ULOG
> #LAST LINE -- ADD YOUR ENTRIES ABOVE THIS LINE -- DO NOT REMOVE
> 
> #ACTION  SOURCE         DEST            PROTO   DEST    
> SOURCE     ORIGINAL
> #                                               PORT    
> PORT(S)    DEST
> ACCEPT:ULOG     loc     $FW     tcp     110     -
> ACCEPT:ULOG     loc     $FW     tcp     25      -
> ACCEPT:ULOG     loc     $FW     tcp     22,21   -
> ACCEPT:ULOG     $FW     net     tcp     5050    -
> ACCEPT:ULOG     $FW     all     all     -       -
> DROP:ULOG       net     $FW     all     -       -
> ACCEPT:ULOG     net     $FW     tcp     80      -
> #LAST LINE -- ADD YOUR ENTRIES BEFORE THIS ONE -- DO NOT REMOVE
> 
> And in my local server, very similar:
> #SOURCE         DEST            POLICY          LOG LEVEL     
>   LIMIT:BURST
> fw      net     ACCEPT
> net     fw      DROP    info
> #net    all     DROP    info
> all     all     REJECT  info
> #LAST LINE -- ADD YOUR ENTRIES ABOVE THIS LINE -- DO NOT REMOVE
> 
> #ACTION  SOURCE         DEST            PROTO   DEST    
> SOURCE     ORIGINAL
> #                                               PORT    
> PORT(S)    DEST
> ACCEPT  net     fw      udp     53      -
> ACCEPT  net     fw      tcp
> 80,443,53,22,20,21,25,109,110,143,783,993,10000 -
> ACCEPT  fw      net     all     -
> #LAST LINE -- ADD YOUR ENTRIES BEFORE THIS ONE -- DO NOT REMOVE
> 
> But the PROBLEM is:
> I can't connect to my server using FTP, nor from the server 
> to my notebook. In /var/log/messages of the server, it drops 
> high port:
> Mar 31 21:14:20 server2 kernel: Shorewall:net2fw:DROP:IN=eth0 
> OUT= MAC=00:09:6b:a5:b1:65:00:c0:9f:28:15:65:08:00 SRC=192.168.0.234
> DST=192.168.0.236 LEN=60 TOS=0x08 PREC=0x00 TTL=64 ID=29064 
> DF PROTO=TCP SPT=20 DPT=32802 WINDOW=5840 RES=0x00 SYN URGP=0
> 
> Can anyone give me direction here? Why the setting doesn't 
> work? How do I open this "high port"? Is it safe to do so?
> TIA

Not familiar with Shorewall and I didn't fully read the rules above but what
I'm not seeing is an entry stating : RELATED,ESTABLISHED or something. My
guess is you need such a rule.
And are you loading the ftp helper module ?


Gr,
Rob


