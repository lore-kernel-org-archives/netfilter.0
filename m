From: Erik Pagel <erik.pagel@gmx.de>
Subject: Re: Yet another FTP connection problem
Date: Thu, 06 Jun 2002 19:47:35 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <381103237.1023392855@[192.168.13.4]>
References: <200206061650.g56GoQA32044@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061650.g56GoQA32044@vulcan.rissington.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hi Antony,

sorry I must apologise again, but I didn't send all my rules, just the ftp 
part.
Of course my standard policy is deny, also I manage my own DNS Server.
NAT is also installed and working. The only part not working are the ftp 
ruleset.


># allow ftp control connections outbound
> iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
Why only port 21 and not also port 20 (DATA Channel).

># allow replies back from ftp servers
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
Ok, but I want to restrict the portrange to source port 20 and 21.
Anyway my last ruleset has a line like this but I want to get ride of it.

[...] I delete some line just to make the reply short.

> iptables -A POSTROUTING -t nat -o $EXT_IF -j SNAT --to $EXT_IP

I use this rule
iptables -t nat -A POSTROUTING -o $I_EXTERN -j MASQUERADE

> Let us know how you get on with those.
sorry, not until now.
>
> Antony.
>
bye Erik


