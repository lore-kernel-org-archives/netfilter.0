From: Scott Hall <halls@aros.net>
Subject: Re: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Tue, 06 Jan 2004 08:48:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FFAD8C0.9080308@aros.net>
References: <3FFA5EBD.1000701@aros.net> <1073388187.2047.250.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073388187.2047.250.camel@grendel>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body>
I will work today on getting some more complete traffic samples.&nbsp; I
appreciate the insight and hope we can find a resolution to this
problem.&nbsp; <br>
<br>
The interesting thing that I didn't mention was that on the same 'My
side' network I am serving several other customers with hardware
routers using the 500 MTU.&nbsp; In fact this customer, until recently was
set up on an Adtran router.&nbsp; We ultimately decided to take them off of
the Adtran due to lack of 802.1p support on its ethernet port which
lead to voice quality problems.&nbsp; The point being that this particular
web page they are having issues with is the owners homepage, thus is
visited often, and he never had problems getting to it until we put
this new Fedora PC router in place.&nbsp; <br>
<br>
Is there anyway to have netfilter ignore the don't fragment instruction
on the incoming packets?&nbsp; Just a thought.<br>
<br>
thanks again, <br>
<br>
--Scott<br>
<br>
Chris Brenton wrote:
<blockquote cite="mid1073388187.2047.250.camel@grendel" type="cite">
  <pre wrap="">GReets Scott,

On Tue, 2004-01-06 at 02:07, Scott Hall wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">I am using this setup to share a single T1 pipe for both voice (via IP 
telephone) and data.  That is the reason for the 500 MTU across the t1 
link. 
    </pre>
  </blockquote>
  <pre wrap=""><!---->
You may find you are going to have this problem a bit more often. See
below.

  </pre>
  <blockquote type="cite">
    <pre wrap=""> &gt;&gt;&gt;&gt;&gt; Not sure why I don't see the original request &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;
    </pre>
  </blockquote>
  <pre wrap=""><!---->
What do you mean by "original request"? DNS query? TCP three packet
handshake? Both appear to be missing from your traces. The DNS info
could have still been in cache however.

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:48:57.275929 Fasttrack2.machinerytrader.com.http &gt; 
--PUBLIC_IP--.1308: P 1481515766:1481517126(1360) ack 2518922124 win 
65161 (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
ACK packet with absolute sequence numbers tells me we missed the initial
handshake somehow. From the window size it looks like we are well into
the data session.

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:48:57.275953 --PUBLIC_IP-- &gt; Fasttrack2.machinerytrader.com: icmp: 
10.1.4.50 unreachable - need to frag (MTU 500) [tos 0xc0]
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Two problems here:
1) A lot of networks, and even some ISP's for that matter, are now
dropping all ICMP due to some of the Window's worms running around.
Don't tell me that its a brain dead idea, you are preaching to the
choir, just letting you know I see people doing it in the wild.

Also, even if the sending system does receive this packet, I'm guessing
it will pitch it. You are telling the remote Web server that the
connection to 10.1.4.50 needs to have its traffic fragmented. I'm
guessing the Web server sees the connection as originating from a public
address. (the NAT address you are using). Since the payload IP does not
match, it will disregard the packet as an unsolicited ICMP error.

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:48:57.276111 --PUBLIC_IP--.32769 &gt; ns1.mydomain.com.domain:  25222+ 
PTR? 17.164.70.63.in-addr.arpa. (43)  (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Weird its doing a reverse lookup, but not a problem.

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:59:25.962167 Fasttrack2.machinerytrader.com.http &gt; 
--cust-publicIP--.29695: P 308:1668(1360) ack 375 win 65161 (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
OK, completely new session well that's a few packets into the data
transfer.

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:59:25.962189 --PUBLIC_IP-- &gt; Fasttrack2.machinerytrader.com: icmp: 
--cust-publicIP-- unreachable - need to frag (MTU 500) [tos 0xc0]
    </pre>
  </blockquote>
  <pre wrap=""><!---->
There goes our ICMP error with a private address in the payload again.
:)

  </pre>
  <blockquote type="cite">
    <pre wrap=""> &gt;&gt;&gt;&gt; I see this traffic next but the customer side doesn't receive the 
packets &lt;&lt;&lt;&lt;&lt;&lt;

16:59:33.605043 --cust-publicIP--.29695 &gt; 
Fasttrack2.machinerytrader.com.http: R 2681907386:2681907386(0) win 0 (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
OK, something is weird. If the frag info did not get though we should
have seen the Web site attempt some retransmissions. Also, we're looking
at absolute sequence numbers. I think we again didn't get to see some of
the packets in the session. Are you stopping and restarting your packet
capture?

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:59:38.142184 --cust-publicIP--.29714 &gt; 
Fasttrack2.machinerytrader.com.http: S 2689170753:2689170753(0) win 
65280 &lt;mss 1360,nop,nop,sackOK&gt; (DF)
16:59:38.174050 Fasttrack2.machinerytrader.com.http &gt; 
--cust-publicIP--.29714: S 3983995986:3983995986(0) ack 2689170754 win 
65535 &lt;mss 1380,nop,nop,sackOK&gt; (DF)
16:59:38.178358 --cust-publicIP--.29714 &gt; 
Fasttrack2.machinerytrader.com.http: . ack 1 win 65280 (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
WAHOO! A three packet handshake. This time we got in from the beginning!
:)

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:59:38.181116 --cust-publicIP--.29714 &gt; 
Fasttrack2.machinerytrader.com.http: P 1:430(429) ack 1 win 65280 (DF)
16:59:38.216940 Fasttrack2.machinerytrader.com.http &gt; 
--cust-publicIP--.29714: P 1:241(240) ack 430 win 65106 (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
OK, up to here we are good because your MTU did not get exceeded. 

  </pre>
  <blockquote type="cite">
    <pre wrap="">16:59:38.220596 Fasttrack2.machinerytrader.com.http &gt; 
--cust-publicIP--.29714: P 241:1601(1360) ack 430 win 65106 (DF)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
And again, we hit an MTU that exceeds you max, so this is were the
problems start. I'm guessing after this we had an outbound ICMP frag
needed, followed by a couple of inbound retransmissions of the above
packet, but it would have been cool to see it in order to confirm.

HTH,
C



  </pre>
</blockquote>
</body>
</html>


