From: Sandy C <sc_netfiltermail@yahoo.com>
Subject: Re: netfilter machine in between 2 servers
Date: Sun, 14 Mar 2004 10:27:23 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040314182723.32260.qmail@web60004.mail.yahoo.com>
References: <200403140944.51622.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1521245030-1079288843=:31281"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403140944.51622.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--0-1521245030-1079288843=:31281
Content-Type: text/plain; charset=us-ascii

Hi Anthony,
    Great explanation. It seems like what you're saying is *if * I did want to keep track of whatever's going on (i.e. LOG http packets)  using iptables I would need to make sure the client and server are part of 2 different nets, correct? So...the 3rd machine would neet to route and filter.
 
   Otherwise how hard would it be to go into the code and make iptables recognize broadcast packets ala ethereal? From reading the docs, it seems like it wouldn't be possible, because the furtherest "up" that netfilter can go is to the "PREROUTING" hook.
 
 
Thanks,
S


Antony Stone <Antony@Soft-Solutions.co.uk> wrote: 
On Sunday 14 March 2004 9:28 am, Sandy C wrote:

>> So I have the following rule on the third machine:
> iptables -A INPUT -p 80 -j LOG
>
> meaning just log all http requests. It doesn't work, but if I have this
> rule on either the client or the server, it works as expected.

Indeed. The INPUT chain is for packets addressed to the machine with the 
rule running on it - so therefore it works as expected if you put the rule on 
the client or server, because they are actually sending and receiving 
packets.

It doesn't work if you look for packets in the INPUT chain of a machine which 
simply happens to be running ethereal (or tcpdump, or any other sniffer), 
because those packets are not addressed to the machine itself, and therefore 
never make they way up the TCP/IP stack and enter netfilter. Packet 
sniffers grab the packets much closer to the interface than this, and will 
see stuff which netfilter does not.

> I get the feeling I'm missing something very basic. Can anyone help?

You should think of netfilter as an add-on to Linux's routing capabilties. 
Normal routing allows a machine to pass packets between interfaces. 
Netfilter allows those packets to be blocked, or logged, or redirected to 
another address. If you are not routing packets through a machine, and it 
is not one of the endpoints taking part in the communication, then you cannot 
filter them with netfilter.

Your setup is not routing packet through machine 3 because client and server 
are on the same subnet, happily talking to each other directly, without any 
need to route through something else. If you were using a switch instead of 
a hub, machine 3 wouldn't even see the packets in the first place using 
ethereal :)

Hope this helps,

Antony.


Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
--0-1521245030-1079288843=:31281
Content-Type: text/html; charset=us-ascii

<DIV>
<DIV>Hi Anthony,</DIV>
<DIV>&nbsp;&nbsp;&nbsp; Great explanation. It seems like what you're saying is *if * I did want to keep track of whatever's going on (i.e. LOG http packets) &nbsp;using iptables I would need to make sure the client and server are part of&nbsp;2 different nets, correct? So...the 3rd machine would neet to route and filter.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp; Otherwise how hard would it be to go into the code and make iptables recognize broadcast packets ala ethereal? From reading the docs, it seems like it wouldn't be possible, because the furtherest "up" that netfilter can go is to the "PREROUTING" hook.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>S<BR><BR><BR><B><I>Antony Stone &lt;Antony@Soft-Solutions.co.uk&gt;</I></B> wrote: </DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On Sunday 14 March 2004 9:28 am, Sandy C wrote:<BR><BR>&gt;&gt; So I have the following rule on the third machine:<BR>&gt; iptables -A INPUT -p 80 -j LOG<BR>&gt;<BR>&gt; meaning just log all http requests. It doesn't work, but if I have this<BR>&gt; rule on either the client or the server, it works as expected.<BR><BR>Indeed. The INPUT chain is for packets addressed to the machine with the <BR>rule running on it - so therefore it works as expected if you put the rule on <BR>the client or server, because they are actually sending and receiving <BR>packets.<BR><BR>It doesn't work if you look for packets in the INPUT chain of a machine which <BR>simply happens to be running ethereal (or tcpdump, or any other sniffer), <BR>because those packets are not addressed to the machine itself, and the
 refore <BR>never make they way up the TCP/IP stack and enter netfilter. Packet <BR>sniffers grab
 the packets much closer to the interface than this, and will <BR>see stuff which netfilter does not.<BR><BR>&gt; I get the feeling I'm missing something very basic. Can anyone help?<BR><BR>You should think of netfilter as an add-on to Linux's routing capabilties. <BR>Normal routing allows a machine to pass packets between interfaces. <BR>Netfilter allows those packets to be blocked, or logged, or redirected to <BR>another address. If you are not routing packets through a machine, and it <BR>is not one of the endpoints taking part in the communication, then you cannot <BR>filter them with netfilter.<BR><BR>Your setup is not routing packet through machine 3 because client and server <BR>are on the same subnet, happily talking to each other directly, without any <BR>need to route through something else. If you were using a switch instead of <BR>a hub, machine 3 wouldn't even see the packet
 s in the first place using <BR>ethereal :)<BR><BR>Hope this
 helps,<BR><BR>Antony.<BR></BLOCKQUOTE></DIV><p><font face=arial size=-1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/mailtag_us/*http://mail.yahoo.com" target="_blank"><b>Yahoo! Mail</a></b> - More reliable, more storage, less spam
--0-1521245030-1079288843=:31281--

