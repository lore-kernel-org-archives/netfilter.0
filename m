From: root <vlady@cyber2000.qc.ca>
Subject: Re: Too long delay
Date: Tue, 22 Jul 2003 15:39:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307221539.40604.vlady@cyber2000.qc.ca>
References: <Pine.GSO.4.20.0307221141030.20422-100000@jefferson.indtn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.20.0307221141030.20422-100000@jefferson.indtn.net>
Content-Disposition: inline
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
To: "Andrew Greenburg (Intelenet)" <agreenbu@in-span.net>, netfilter@lists.netfilter.org

Thanks for the hint.
I added entries REJECT-ed the incoming and outgoing connections via tcp/udp on 
113 port (identd) but unfortunatly that doesnt felps.

  -- In the case with the SMTP I am duing telnet on port 25 and the machine is 
responding immediately with:
	Trying xx.xx.xx.xx...
	Connected to xx.xx.xx.xx (xx.xx.xx.xx).
	Escape character is '^]'.

but the actual response from the mail server: "220 mail.mydomain.com ESMTP" 
apears in around 1--15 seconds 

  -- In the case with the FTP i get the login prompt in around 10s after I 
initiated the connection.

Thanks for any help
Cheers
vlady


>On Tuesday 22 July 2003 12:42, Andrew Greenburg (Intelenet) wrote:
> This is probably an identd issue. If you create a rule to REJECT identd
> packets instead of dropping them, this should help.


