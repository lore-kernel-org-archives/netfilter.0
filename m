From: "Michael K" <micke@klintan.se>
Subject: RE: to understand --tcp-flags
Date: Sun, 1 Jun 2003 01:48:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c327cf$1516b8b0$0200a8c0@klintan.local>
References: <36427.200.204.151.150.1054419058.squirrel@webmail.4linux.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <36427.200.204.151.150.1054419058.squirrel@webmail.4linux.com.br>
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



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ralf Braga
> Sent: Sunday, June 01, 2003 12:11 AM
> To: netfilter@lists.netfilter.org
> Subject: to understand --tcp-flags
> 
> 
> Hi,
> 
> I dont understand this command:
> 
> iptables -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK \
> -m state --state NEW -j REJECT --reject-with tcp-reset
> 
> Because two times is used --tcp-flags SYN,ACK SYN,ACK ?
> 
> 
> This example will be bloqued packages for flags syn and ack ?
> 
> Thanks,

I don't understand this either. But the man page says
       --tcp-flags [!] mask comp
              Match when the TCP flags are as specified.  The  first
argument
              is  the  flags which we should examine, written as a
comma-sepa-
              rated list, and the second argument is a comma-separated
list of
              flags which must be set.  Flags are: SYN ACK FIN RST URG
PSH ALL
              NONE.  Hence the command
               iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST
SYN
              will only match packets with the SYN flag set, and the
ACK,  FIN
              and RST flags unset.

So I think that your command meens that SYN and ACK must be set and it
don't mind the others (FIN RST URG PSH) if they are set or unset.

Perhaps its better to understand the --state. The god thing about state
is that it works with all protocols. The states are: NEW, ESTABLISHED,
RELATED, INVALID.

Still need more info on the tcp flags? Read rfc 793
(ftp://ftp.rfc-editor.org/in-notes/rfc793.txt).

/Klintan



