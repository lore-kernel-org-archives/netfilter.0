From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: iptables
Date: Mon, 10 Jun 2002 21:23:06 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <004b01c210ee$ec7b4e40$020aa8c0@matttm9svd8lrh>
References: <CC845BB8BC74D6119934000347DD23E87C0BA5@jhbmail.autopage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Paulo Andre <PAndre@autopage.altech.co.za>, "Netfilter (E-mail)" <netfilter@lists.samba.org>

try telnetting from the exchange server to a mail server on the Internet.

----- Original Message -----
From: "Paulo Andre" <PAndre@autopage.altech.co.za>
To: "Netfilter (E-mail)" <netfilter@lists.samba.org>
Sent: Monday, June 10, 2002 9:06 AM
Subject: iptables


> I have a Exchange server that needs to send mail out, the firewall
> (iptables) is set up as follows:
>
> iptables -A FORWARD -s (mail srv) -p tcp --dport 25 -j ACCEPT
>
> The mail server comes back with a "Host unreachable" error, and nslookup
and
> traceroute takes me to the destination fine. Anyone have any ideas...???
>
>
>
>



