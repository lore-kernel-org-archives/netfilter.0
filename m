From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables question - how to securely allow *just* outgoing smtp
Date: Sat, 22 Jun 2002 18:44:09 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622174411.EPV19225.mta07-svc.ntlworld.com@there>
References: <20020621083228.A21833@spawar.navy.mil> <200206211535.g5LFZbU03196@vulcan.rissington.net> <20020622102824.A32585@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020622102824.A32585@spawar.navy.mil>
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
To: netfilter@lists.samba.org

On Saturday 22 June 2002 6:28 pm, Christian Seberino wrote:

> Antony
>
> Even if I just want to *send* email I still
> need the *INPUT* part right? In other words, I don't suppose
> *just* the following will allow firewall to send email will it??
>
> iptables -A OUTPUT -p tcp --dport 25 -d aa.bb.cc.dd -j ACCEPT

No, that on its own will only allow outbound packets, and will not allow 
returning replies.   You need both for a successful connection, even if the 
email is only going out.

> *If* I do need the INPUT part, can I *just* allow
> the ESTABLISHED and *not* the RELATED???? RELATED
> would only be necessary if smtp needed multiple new ports
> for incoming right???

I included the RELATED state just in case you get some ICMP packets saying a 
connection failed etc.

> P.S. One more thing if you don't mind....
>
> I *could* define $SSH_PORT and $SMPT_PORT but
> doesn't iptables recognize ssh and smtp /already/
> as 22 and 25?

What would you define SSH_PORT as ?   22, presumably ?

I'm not quite sure I understand your question.   SSH runs on TCP port 22, so 
if you want an iptables rule to allow SSH, you could write it using the 
number 22, or the variable $SSH_PORT, where SSH_PORT is defined as 22, or you 
could use $BANANA, where BANANA is defined as 22.....

So long as the rule ends up allowing TCP packets on port 22, how you specify 
it comes down to readability and style.

 

Antony.

