From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables
Date: Mon, 10 Jun 2002 20:27:33 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101927.g5AJRdA00657@Networker.rockstone.co.uk>
References: <CC845BB8BC74D6119934000347DD23E87C0BA5@jhbmail.autopage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <CC845BB8BC74D6119934000347DD23E87C0BA5@jhbmail.autopage.co.za>
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

On Monday 10 June 2002 3:06 pm, Paulo Andre wrote:

> I have a Exchange server

You have our sympathies...

> that needs to send mail out, the firewall
> (iptables) is set up as follows:
>
> iptables -A FORWARD -s (mail srv) -p tcp --dport 25 -j ACCEPT
>
> The mail server comes back with a "Host unreachable" error, and nslookup
> and traceroute takes me to the destination fine. Anyone have any
> ideas...???

Try putting a rule at the start of your FORWARD chain:

iptables -I FORWARD -s (mail srv) -j LOG --log-prefix "Exchg Svr"

And see if it's doing something strange....

 

Antony

