From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables redirecting
Date: Tue, 18 Jun 2002 12:10:45 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206181110.MAA26320@slate.rockstone.co.uk>
References: <CC845BB8BC74D6119934000347DD23E87C0BE2@jhbmail.autopage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <CC845BB8BC74D6119934000347DD23E87C0BE2@jhbmail.autopage.co.za>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter (E-mail)" <netfilter@lists.samba.org>

On Tuesday 18 June 2002 11:48 am, Paulo Andre wrote:

> Can someone give me the pros/cons of the following situation.

> 1- Running a firewall that forwards all smtp traffic to another (internal)
> ip address --- DNAT

Yes - do it this way, but with a DMZ.

> 2- Running a firewall that forwards all smtp traffic to another (internal)
> ip address --- running mail server on firewall that redirects the traffic

I believe you should not run any services on a firewall - only netfilter 
itself.   Services such as email should be provided on a separate machine.

The reason for this is that an application such as sendmail / qmail / exim / 
whatever is far more likely to have an exploitable vulnerability than 
netfilter is - therefore if you run both on the same box someone may be able 
to defeat your firewall because of a weakness in the mail server.   If 
they're on separate boxes then they can only defeat the mail server, and the 
firewall remains intact.

However, this still leaves the possibility that they can defeat the mail 
server and then run riot through the rest of your network, starting from the 
mail server machine; hence the reason for putting such systems onto a DMZ and 
then severely restricting (with the firewall again) what connections these 
machines are allowed to initiate either to the internal network or to the 
outside world.   If someone compromises your mail server, you still want to 
make it difficult for them to launch a further attack starting from that 
machine.

Assuming you have a mail server sending & receiving from the Internet by 
SMTP, receiving from the internal LAN by SMTP, and delivering mail to 
internal clients by POP3 or IMAP, you should use the following rules:

Internet -> DMZ mail server: SMTP allowed
Mail server -> Internet: SMTP allowed
Mail server -> Name server: DNS allowed
Internal LAN -> Mail server: SMTP + POP3/IMAP allowed
Everything else to or from mail server blocked.

The name server might be on your DMZ, or it might be out on the Internet, but 
you can see from the above rules that the mail server cannot initiate a 
connection to any machines on your internal LAN, and can only initiate 
connections to arbitrary machines on the Internet on TCP port 25 for SMTP.

That's the way I'd do it, anyway.

 

Antony.

