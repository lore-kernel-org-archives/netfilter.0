From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nat with virtual interfaces
Date: Thu, 27 Jun 2002 16:35:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206271537.g5RFbUU14917@vulcan.rissington.net>
References: <BACC2B29B574704A8494EAD86EDBB9501C6132@stosrv-0003.lemonplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <BACC2B29B574704A8494EAD86EDBB9501C6132@stosrv-0003.lemonplanet.com>
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

On Thursday 27 June 2002 2:49 pm, Mika Ullgren wrote:

> Yes I did. Sorry I forgot to mention that... If I use DNAT exactly the
> same thing happens as with REDIRECT.
>
> Any other ideas?

Here's a bit of a daft idea, but you never know.....

Try using DNAT to a completely different address (which you still add to eth0 
and include in the apache httpd.conf file) ?

eg ifconfig eth0:0 172.16.64.75 netmask 255.255.255.0

iptables -A PREROUTING -t nat -d 192.168.64.75 -p tcp --dport 80 -j DNAT --to 
172.16.64.75:8080

etc....

I have no idea if this would work (or if it did, why it's a better idea than 
the other things you've tried) but it's got to be worth a quick go.....

 

Antony.

