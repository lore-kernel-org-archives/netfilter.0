From: narendra prabhu <naren@deeproot.co.in>
Subject: Re: packet matching problem
Date: Mon, 12 May 2003 21:12:54 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EBFC0FE.6080101@deeproot.co.in>
References: <3EBFAFB7.3D78BFDE@wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EBFAFB7.3D78BFDE@wipro.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "P.Srihari" <srihari.par@wipro.com>
Cc: netfilter@lists.netfilter.org

Hi,

>iptables -I FORWARD -p tcp --tcp-flags SYN,RST,ACK SYN -m limit --limit
>1/s --limit-burst 1024 -j ACCEPT
>iptables -A FORWARD -p tcp --tcp-flags SYN,RST,ACK SYN -j LOG
>--log-prefix "SYN ATTACK"
>iptables -A FORWARD -p tcp --tcp-flags SYN,RST,ACK SYN  -j DROP
>iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j
>ACCEPT
>

I am not quiet sure about the seqence of the rules. Usaully, we place 
the "-m state
--state RELATED,ESTABLISHED"( the connection tracking stuff) is in the 
top of the list of
rules.... I guess instead of -A  it should have been -I..  Read about 
connection tracking .. might help you.

>now i started an FTP session from the host to an FTP server. in this
>session, i turn off the prompt and do an mget * ( multiple files ).
>the files are in order of about 4 MB or so. as soon as the first file
>is completed, it prints the message SYN ATTACK - with the SRC port as
>ftp-data port (20) - no other traffic is coming into the firewall host. 
>TCPDUMP on the firewall machine shows that about 8 or 9 SYN packets 
>having been received by the firewall host. 
>
FTP is one of those peculiar protocols, Again, read about connection 
tracking. For the protocols  like these
the connection tracking modules have more work to do. However , this is 
not very relavent to your problem.
The solution for your problem possilbly is the ordering of the rules, or 
the sequence.

There is a link from netfilter.org..(docs section).

Hope this helps ...

Narendra.

--------------------------
Narendra Prabhu. B
DeepRoot Linux Pvt Ltd.,Bangalore.
http://www.deeproot.co.in



