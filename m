From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: iptables question - how to securely allow *just* outgoing smtp
Date: Sat, 22 Jun 2002 10:28:24 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622102824.A32585@spawar.navy.mil>
References: <20020621083228.A21833@spawar.navy.mil> <200206211535.g5LFZbU03196@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206211535.g5LFZbU03196@vulcan.rissington.net>; from Antony@Soft-Solutions.co.uk on Fri, Jun 21, 2002 at 04:35:31PM +0100
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Antony

Wow, thanks! This answer was like a laser - direct
and to the point.

Even if I just want to *send* email I still
need the *INPUT* part right? In other words, I don't suppose
*just* the following will allow firewall to send email will it??

iptables -A OUTPUT -p tcp --dport 25 -d aa.bb.cc.dd -j ACCEPT


*If* I do need the INPUT part, can I *just* allow
the ESTABLISHED and *not* the RELATED???? RELATED
would only be necessary if smtp needed multiple new ports
for incoming right???

Thanks again,

Chris

P.S. One more thing if you don't mind....

I *could* define $SSH_PORT and $SMPT_PORT but
doesn't iptables recognize ssh and smtp /already/
as 22 and 25?




On Fri, Jun 21, 2002 at 04:35:31PM +0100, Antony Stone wrote:
> On Friday 21 June 2002 4:32 pm, Christian Seberino wrote:
> 
> > My firewall does *not* need or use any
> > rules on INPUT and OUTPUT chains
> > since it just *FORWARD*s packets to/from
> > private LAN.....
> >
> > I'd like to install Tripwire on firewall
> > and have firewall *email* me daily of status.....
> >
> > How can I securely *open* up firewall rules
> > to allow me to just email out without
> > compromising security???
> 
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -A OUTPUT -p tcp --dport 25 -d aa.bb.cc.dd -j ACCEPT
> iptables -A INPUT -p tcp --sport 25 -s aa.bb.cc.dd -m state --state 
> ESTABLISHED,RELATED -j ACCEPT
> 
> where aa.bb.cc.dd is the IP address of your mail server.
> 
>  
> 
> Antony.

-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
53560 Hull Street
San Diego, CA 92152-5001
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-2836
Email: seberino@spawar.navy.mil
_______________________________________

