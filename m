From: =?iso-8859-1?q?dee3lmo?= <dee3lmo@yahoo.co.uk>
Subject: Re: SRC and DST
Date: Sat, 31 Jul 2004 09:26:29 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040731082629.8558.qmail@web25208.mail.ukl.yahoo.com>
References: <200407310901.12827.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1758203768-1091262389=:7620"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407310901.12827.Antony@Soft-Solutions.co.uk>
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

--0-1758203768-1091262389=:7620
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi Antony,
 
Thanks for your quick reply. I don't get the first part. You say:
 
"Similarly the reply packet comes back from the web server: source address = remote web server; destination address = your computer; neither of these = firewall."
 
The destination address isn't my. None of the addresses is an address of my firewall.
 
dee3lmo.


Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

On Saturday 31 July 2004 8:42 am, dee3lmo wrote:

> Hello,
>
> I'm quite new to netfilter and I'm using iptables for a short time and till
> now I'm loving it. But I have a question about the SRC and DST addresses.
>
> I know you can filter on the source and destination addresses. On my box I
> receive a packet with the following addresses: SRC=62.234.65.26
> DST=62.234.111.0
>
> The strange thing is that both the addresses are not mine! I always thought
> that either the SRC or DST address must be the IP of my box or am I missing
> something.

Imagine the following setup:

You are sitting at home with your computer connected to your ISP.
Your ISP is running a firewall to protect you and all its customers from nasty 
things on the Internet.
You connect to a website, through your connection to the ISP.

Then the ISPs firewall system sees a packet where the source address = your 
computer; destination address = remote web server; neither of these = ISPs 
firewall.

Similarly the reply packet comes back from the web server: source address = 
remote web server; destination address = your computer; neither of these = 
firewall.

> An other strange thing is that the DST ip address is a network
> address?

How do you know that? Just because it ends in .0? That is not necessarily 
a rule for a network address.

For example, if you have a small 8-IP address block range from the DSL 
provider, the network address might be a.b.c.24, usable addresses a.b.c.25 to 
a.b.c.30, broadcast address a.b.c.31

Similarly a big organisation with a full Class B range might have a network 
address a.b.0.0, usable addresses a.b.0.1 to a.b.255.254, broadcast address 
a.b.255.255. The usable range includes a.b.5.0 and a.b.100.0 for example, 
as well as a.b.5.255 and other things whcih might look at first glance like 
netowkr or broadcast addresses, but aren't.

The onyl way to know whether an address is a network address or a broadcast 
address is to know the netmask, and that is inaccessible to all machines 
except the ones on the local destination subnet.

> Isn't this quite strange? A network address is not a computer so
> how to know where package is send to?

Once you start playing with firewalls you will see quite a lot of packets 
which can never get to a sensible destination - it's surprising what is out 
there on a network when you really start looking.

Therefore it's possible that the above address *is* a network address - but 
that doesn't stop somebody using it as the destination IP of a packet if they 
want to.

Hope this helps,

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

Please reply to the list;
please don't CC me.




		
---------------------------------
 ALL-NEW Yahoo! Messenger - all new features - even more fun!  
--0-1758203768-1091262389=:7620
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>Hi Antony,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks for your quick reply. I don't get the first part. You say:</DIV>
<DIV>&nbsp;</DIV>
<DIV>"Similarly the reply packet comes back from the web server: source address = remote web server; <STRONG>destination address = your computer</STRONG>; neither of these = firewall."</DIV>
<DIV>&nbsp;</DIV>
<DIV>The destination address isn't my. None of the addresses is an address of my firewall.</DIV>
<DIV>&nbsp;</DIV>
<DIV>dee3lmo.</DIV>
<DIV><BR><BR><B><I>Antony Stone &lt;Antony@Soft-Solutions.co.uk&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">
<P>On Saturday 31 July 2004 8:42 am, dee3lmo wrote:<BR><BR>&gt; Hello,<BR>&gt;<BR>&gt; I'm quite new to netfilter and I'm using iptables for a short time and till<BR>&gt; now I'm loving it. But I have a question about the SRC and DST addresses.<BR>&gt;<BR>&gt; I know you can filter on the source and destination addresses. On my box I<BR>&gt; receive a packet with the following addresses: SRC=62.234.65.26<BR>&gt; DST=62.234.111.0<BR>&gt;<BR>&gt; The strange thing is that both the addresses are not mine! I always thought<BR>&gt; that either the SRC or DST address must be the IP of my box or am I missing<BR>&gt; something.<BR><BR>Imagine the following setup:<BR><BR>You are sitting at home with your computer connected to your ISP.<BR>Your ISP is running a firewall to protect you and all its customers from nasty <BR>things on the Internet.<BR>You connect to a website, through your connection 
 to the ISP.<BR><BR>Then the ISPs firewall system sees a packet where the source address = your
 <BR>computer; destination address = remote web server; neither of these = ISPs <BR>firewall.<BR><BR>Similarly the reply packet comes back from the web server: source address = <BR>remote web server; destination address = your computer; neither of these = <BR>firewall.<BR><BR>&gt; An other strange thing is that the DST ip address is a network<BR>&gt; address?<BR><BR>How do you know that? Just because it ends in .0? That is not necessarily <BR>a rule for a network address.<BR><BR>For example, if you have a small 8-IP address block range from the DSL <BR>provider, the network address might be a.b.c.24, usable addresses a.b.c.25 to <BR>a.b.c.30, broadcast address a.b.c.31<BR><BR>Similarly a big organisation with a full Class B range might have a network <BR>address a.b.0.0, usable addresses a.b.0.1 to a.b.255.254, broadcast address <BR>a.b.255.255. The usable range includes a.b.5.0 and a.b.
 100.0 for example, <BR>as well as a.b.5.255 and other things whcih might look at first glance like
 <BR>netowkr or broadcast addresses, but aren't.<BR><BR>The onyl way to know whether an address is a network address or a broadcast <BR>address is to know the netmask, and that is inaccessible to all machines <BR>except the ones on the local destination subnet.<BR><BR>&gt; Isn't this quite strange? A network address is not a computer so<BR>&gt; how to know where package is send to?<BR><BR>Once you start playing with firewalls you will see quite a lot of packets <BR>which can never get to a sensible destination - it's surprising what is out <BR>there on a network when you really start looking.<BR><BR>Therefore it's possible that the above address *is* a network address - but <BR>that doesn't stop somebody using it as the destination IP of a packet if they <BR>want to.<BR><BR>Hope this helps,<BR><BR>Regards,<BR><BR>Antony.<BR><BR>-- <BR>If at first you don't succeed, destroy all the eviden
 ce that you tried.<BR><BR>Please reply to the list;<BR>please don't CC
 me.<BR><BR><BR></P></BLOCKQUOTE><p>
		<hr size=1> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://uk.rd.yahoo.com/evt=21626/*http://uk.messenger.yahoo.com"><strong><font face="Arial, Helvetica, sans-serif">ALL-NEW 
Yahoo! Messenger</font></strong></a><font face="Arial, Helvetica, sans-serif"><strong> 
- all new features - even more fun!</strong></font><strong><font color="#FF9900"> 
</font></strong></font> 
--0-1758203768-1091262389=:7620--

